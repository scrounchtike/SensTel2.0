/*
 * main.c
 *
 *  Created on: Feb 27, 2018
 *      Author: Chinook-ELE
 */


#include "xparameters.h"
#include "xtmrctr.h"

#define DEVICE_TMR_0	0
#define DEVICE_TMR_1	1

#define INIT_CNT_RST_VAL	1000000

void main(void)
{
	XTmrCtr sTimerController;
	XTmrCtr_Config sTimerConfig;
	u32 timerOptions = 0;

	XTmrCtr_Stop(&sTimerController, DEVICE_TMR_0);
	XTmrCtr_CfgInitialize(
			&sTimerController, &sTimerConfig, XPAR_AXI_TIMER_0_BASEADDR);
	timerOptions = XTmrCtr_GetOptions(&sTimerController, DEVICE_TMR_0);
	XTmrCtr_SetOptions(&sTimerController, DEVICE_TMR_0,
				timerOptions | XTC_CAPTURE_MODE_OPTION);
	// Set a new counter reload value only when a timer isnt running
	XTmrCtr_SetResetValue(&sTimerController, DEVICE_TMR_0, INIT_CNT_RST_VAL);
	XTmrCtr_Start(&sTimerController, XTC_CAPTURE_MODE_OPTION);
	while(1){
		XTmrCtr_GetCaptureValue(&sTimerController, DEVICE_TMR_0);
		XTmrCtr_Start(&sTimerController, XTC_CAPTURE_MODE_OPTION);
	}

	return 1;
}
