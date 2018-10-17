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

//#define INIT_CNT_RST_VAL	500000000
//#define INIT_CNT_RST_VAL	0

/*	See PG079 - AXI Timer IP Documentation	*/
/*	This is an input capture test which only demonstrates the Timer core useage. */

void main(){
	u32 csRegValue = 0;
	u32 ldRegValue = 0;
	u32 tmrCntrRegValue = 0;

	// Control/Status register is initialized: capture flag is cleared, external capture input is enabled
	// and the timer is set in capture mode.
	csRegValue = XTmrCtr_GetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0);
	csRegValue |= XTC_CSR_INT_OCCURED_MASK | XTC_CSR_EXT_CAPTURE_MASK | XTC_CSR_CAPTURE_MODE_MASK;
	XTmrCtr_SetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0, csRegValue);
	csRegValue |= XTC_CSR_ENABLE_TMR_MASK;
	XTmrCtr_SetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0, csRegValue);
	csRegValue = XTmrCtr_GetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0);

	ldRegValue = XTmrCtr_GetLoadReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0);
	tmrCntrRegValue = XTmrCtr_GetTimerCounterReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0);

	while(1){
		csRegValue = XTmrCtr_GetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0);
		tmrCntrRegValue = XTmrCtr_GetTimerCounterReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0);
		ldRegValue = XTmrCtr_GetLoadReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0);

		// If a low to high transition is captured the load register is read and the T0INT is reset
		// to allow another capture to be recognized.
		if(csRegValue & XTC_CSR_INT_OCCURED_MASK){
			ldRegValue = XTmrCtr_GetLoadReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0);
			XTmrCtr_SetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, DEVICE_TMR_0, csRegValue | XTC_CSR_INT_OCCURED_MASK);
		}
	}

}

//
//void main()
//{
//	XTmrCtr sTimerController;
//	XTmrCtr_Config sTimerConfig;
//	u32 timerOptions = 0;
//	u32 capVal1 = 0;
//	u32 capVal2 = 0;
//	int expired = 0;
//
////	XTmrCtr_Stop(&sTimerController, DEVICE_TMR_0);
//	XTmrCtr_CfgInitialize(
//			&sTimerController, &sTimerConfig, XPAR_AXI_TIMER_0_BASEADDR);
//	timerOptions = XTmrCtr_GetOptions(&sTimerController, DEVICE_TMR_0);
//	XTmrCtr_SetOptions(&sTimerController, DEVICE_TMR_0,
//				timerOptions | XTC_CAPTURE_MODE_OPTION | XTC_AUTO_RELOAD_OPTION |XTC_EXT_COMPARE_OPTION);
//	// Set a new counter reload value only when a timer isnt running
//	XTmrCtr_SetResetValue(&sTimerController, DEVICE_TMR_0, INIT_CNT_RST_VAL);
//	XTmrCtr_Start(&sTimerController, DEVICE_TMR_0);
//	while(1){
//		capVal1 = 0;
//		capVal1 = XTmrCtr_GetCaptureValue(&sTimerController, DEVICE_TMR_0);
//		if(capVal1 > INIT_CNT_RST_VAL){
//			XTmrCtr_Reset(&sTimerController, DEVICE_TMR_0);
//			XTmrCtr_Start(&sTimerController, DEVICE_TMR_0);
//			capVal1 = XTmrCtr_GetCaptureValue(&sTimerController, DEVICE_TMR_0);
//			expired = 0;
//		}
//		if(capVal1 < INIT_CNT_RST_VAL){
//			capVal1 = XTmrCtr_GetCaptureValue(&sTimerController, DEVICE_TMR_0);
//		}
//	}
//
//	return;
//}
