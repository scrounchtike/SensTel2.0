/*
 * timer.h
 *
 *  Created on: Jun 24, 2018
 *      Author: Jerome Pare-Lepine
 */

#ifndef SRC_TIMER_H_
#define SRC_TIMER_H_


//==============================================================================
// INCLUDES
//==============================================================================
#include "xil_types.h"
#include "xil_exception.h"
#include "xscutimer.h"
#include "xparameters.h"


//==============================================================================
// DEFINITIONS
//==============================================================================
/*
 * As per the core's SCU specs (Cortex-A9 MPCore Tech. Ref. Man. -> 4.1),
 * the private timer is clocked at half the CPU frequency. 666.666MHz /2
 */
#define	SCU_TIMER_FREQ	XPAR_CPU_CORTEXA9_0_CPU_CLK_FREQ_HZ >> 1

/*
 * As per the SCU specs, the timer event period is calculated
 * like this:
 * period = ((prescaler+1)(loadvalue+1))/timer_clk_freq
 * So, to obtain a timer period of close to 1e-6 seconds, the prescaler has to be
 * set to 2.003 (round to 2) and the load value to 110.
 */
#define SCU_TMR_PRESCALER	250
#define SCU_TMR_RELOAD_VAL	0xfffffff



//==============================================================================
// FUNCTION PROTOTYPES
//==============================================================================
u32 ulCoreMicroSecondsTicks;


//==============================================================================
// FUNCTION PROTOTYPES
//==============================================================================
u32 GetScuCounterValue(XScuTimer *tmrinst);
void InitScuTimer(XScuTimer *tmrinst, u32 devid);
void InitScuTimerInterrupts(XScuTimer *tmrinst, Xil_ExceptionHandler handler, u16 DevIntId);
void StartScuTimerInterrupts(XScuTimer *tmrinst);


#endif /* SRC_TIMER_H_ */
