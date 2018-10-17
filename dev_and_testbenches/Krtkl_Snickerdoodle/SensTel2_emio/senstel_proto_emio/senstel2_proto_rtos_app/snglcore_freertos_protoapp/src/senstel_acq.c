/*
 * senstel_acq.c
 *
 *  Created on: May 30, 2018
 *      Author: Jerome Pare-Lepine
 */

#include "senstel_acq_config.h"
#include <stdio.h>


//==============================================================================
// FUNCTION DEFINITIONS
//==============================================================================
void InitAppProfile(sAppTaskProfiles_t *AppProfiles)
{
	AppProfiles->idx = 0;
}

u8 AddTaskProfile(sAppTaskProfiles_t *AppProfiles, char *TaskId, u8 charcount)
{
	sTaskProfile_t *tprof = &AppProfiles->TaskArray[AppProfiles->idx];
	u8 prevTaskIdx = AppProfiles->idx;

	tprof->AvgLooptime = 0;
	tprof->LastDelta = 0;
	tprof->LoopCount = 0;
	tprof->MaxDelta = 0;
	tprof->MinDelta = 0;

	strncpy(tprof->TaskId, TaskId, charcount);

	AppProfiles->idx++;

	return prevTaskIdx;
}


void UpdateTaskProfile(sAppTaskProfiles_t *AppProfiles, u8 TaskIdx, u32 NewTimeDelta)
{
	u32 tmp = 0;
	sTaskProfile_t *tprof = &AppProfiles->TaskArray[TaskIdx];

	if(tprof->LoopCount == 0){
		tprof->AvgLooptime = NewTimeDelta;
		tprof->MinDelta = NewTimeDelta;
		tprof->MaxDelta = NewTimeDelta;
	}
	else{
		tmp = (tprof->AvgLooptime + NewTimeDelta) >> 1;
		tprof->AvgLooptime = tmp;
	}

	if(tprof->LoopCount < 0xFFFFFFFF) tprof->LoopCount++;
	else tprof->LoopCount = 0;

	tprof->LastDelta = NewTimeDelta;

	if(NewTimeDelta > tprof->MaxDelta) tprof->MaxDelta = NewTimeDelta;
	else if( (NewTimeDelta > 0) || (NewTimeDelta < tprof->MinDelta) ) tprof->MinDelta = NewTimeDelta;


}
