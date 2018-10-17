/*
 * timer.c
 *
 *  Created on: Jun 24, 2018
 *      Author: Jerome Pare-Lepine
 */

#include "timer.h"
#include "interrupts.h"

//==============================================================================
// FUNCTION DEFINITIONS
//==============================================================================
u32 GetScuCounterValue(XScuTimer *tmrinst)
{
	return ulCoreMicroSecondsTicks;

}

void InitScuTimer(XScuTimer *tmrinst, u32 devid)
{
	XScuTimer_Config *conf;

	conf = XScuTimer_LookupConfig( (u16)devid );
	XScuTimer_CfgInitialize(tmrinst, conf, conf->BaseAddr);

	XScuTimer_Stop(tmrinst);
	XScuTimer_ClearInterruptStatus(tmrinst);
	XScuTimer_SetPrescaler(tmrinst, SCU_TMR_PRESCALER);
	XScuTimer_SetLoadReg(conf->BaseAddr, SCU_TMR_RELOAD_VAL);
	XScuTimer_EnableAutoReload(tmrinst);

}

void InitScuTimerInterrupts(XScuTimer *tmrinst, Xil_ExceptionHandler handler, u16 DevIntId)
{
	AddHandler2InitTable(tmrinst, DevIntId, handler, (void *)&ExceptionHandlers);
}


void StartScuTimerInterrupts(XScuTimer *tmrinst)
{
//	XScuTimer_Start(tmrinst);
	XScuTimer_EnableInterrupt(tmrinst);
//	XScuTimer_Start(tmrinst);
}

