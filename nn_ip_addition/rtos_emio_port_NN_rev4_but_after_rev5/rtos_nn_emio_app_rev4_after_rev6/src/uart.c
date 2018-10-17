/*
 * uart.c
 *
 *  Created on: May 25, 2018
 *      Author: Jerome Pare-Lepine
 */


//==============================================================================
// INCLUDES
//==============================================================================
#include "xparameters.h"
#include "xstatus.h"
#include "xscugic.h"	//Interrupts driver
#include "xil_types.h"
#include "xil_assert.h"
#include "xuartps_hw.h"
#include "xuartps.h"
#include "xil_printf.h"
#include "stdio.h"
#include "fifo.h"
#include "uart.h"
#include "interrupts.h"
#include "cv7.h"


//==============================================================================
// FUNCTION DEFINITIONS
//==============================================================================
void InitUartPeripherals(XUartPs *Uart0Inst, XUartPs *Uart1Inst)
/*
* \brief    Initializes both PS UART peripherals. One of the peripherals is going through the MIO
* 			and don't need any setup but we need its XUartPs instance to send it data to output. The
* 			other is used as the Cv7 wind sensor's input interface.
*
* \note     Zynqs typically have only two UART hardware peripherals but more can be instantiated
* 			in the PL fabric.
* 			This is for PS peripherals and not for UART ip cores instantiated in the PL, if any.
* 			The register reads were for debug purposes.
*
* \param[in]   Uart0Inst, Uart1Inst  - UART peripherals' structure instances.
*
*/
{
	XUartPs_Config *config0, *config1;
	XUartPsFormat format0, format1;
	u32 tmp, regval;
	s32 res = 0;


	config0 = XUartPs_LookupConfig(XPAR_XUARTPS_0_DEVICE_ID);
	config1 = XUartPs_LookupConfig(XPAR_XUARTPS_1_DEVICE_ID);

	XUartPs_CfgInitialize(Uart0Inst, config0, config0->BaseAddress);
	XUartPs_CfgInitialize(Uart1Inst, config1, config1->BaseAddress);

	regval = XUartPs_ReadReg(Uart1Inst->Config.BaseAddress, XUARTPS_BAUDDIV_OFFSET);
	regval = XUartPs_ReadReg(Uart1Inst->Config.BaseAddress, XUARTPS_BAUDGEN_OFFSET);

	XUartPs_GetDataFormat(Uart1Inst, &format1);
	format1.BaudRate = (u32) 4800;		/* Cv7's baud rate */
	/* The assigned values select a predetermined number. Ex: Databits = 0
	 * means option 0 is selected. And by looking at the documentation,
	 * option 0 means 8 bits of data.*/
	format1.DataBits = (u32) 0;
	format1.Parity = (u32) 4;
	format1.StopBits = (u8) 00;
	res = XUartPs_SetDataFormat(Uart1Inst, &format1);
	tmp = XUartPs_ReadReg(config1->BaseAddress, XUARTPS_CR_OFFSET);
	XUartPs_WriteReg(config1->BaseAddress, XUARTPS_RXTOUT_OFFSET, tmp | (u32)XUARTPS_CR_TX_DIS);
	XUartPs_EnableUart(Uart1Inst);

	/* For debug:
	 * The baudrate for UART1 can be calculated as follows: UART_REF_CLK/(CD*(BDIV+1)).
	 * Here for example, I got 99999999/(4166*(4+1)) = 4800.77 which matches Vivado's hardware settings. */
	regval = XUartPs_ReadReg(Uart1Inst->Config.BaseAddress, XUARTPS_BAUDDIV_OFFSET);
	regval = XUartPs_ReadReg(Uart1Inst->Config.BaseAddress, XUARTPS_BAUDGEN_OFFSET);

}

void InitUartInterrupts(XUartPs *InstancePtr, u32 DevIntId)
/*
* \brief       Registers the peripheral's interrupt handlers to its peripheral
*              instance struct. Also lists it to be registered to the Interrupt
*              Controller.
*              The FIFO's interrupt threshold value is also initialized. The
*              timeout value was supposed to help synchronizing with the Cv7's
*              data flux but that feature was dropped.
*
* \param[in]   InstancePtr    - Pointer to the UART peripheral struct
*                               instance for which the interrupts are to be setup.
*
* \param[in]   DevIntId       - ID of the peripheral in the Interrupt Controller's
*                               vector
*/
{
	u32 tmp;
	XUartPs_SetHandler(InstancePtr, (XUartPs_Handler)&UartHandler, InstancePtr);

	/* Config the FIFO data threshold value. The Uart event handler will get called
	 * every time the UART peripheral's fifo will be filled up to this value. Beware that
	 * if the 64 bits fifo is filled, this interrupt will not happen again. */
	XUartPs_WriteReg(InstancePtr->Config.BaseAddress, XUARTPS_RXWM_OFFSET, UART_FIFO_THRESHOLD);

	/* Configure the Uart's timeout value. The value is the amount of baud sample clock to wait
	 * before causing an interrupt. */
	XUartPs_WriteReg(InstancePtr->Config.BaseAddress, XUARTPS_RXTOUT_OFFSET, UART_TIMEOUT_THRESHOLD);

	/* Configure CR to restart the receiver timeout counter */
	tmp =
		XUartPs_ReadReg(InstancePtr->Config.BaseAddress,
				  XUARTPS_CR_OFFSET);
	XUartPs_WriteReg(InstancePtr->Config.BaseAddress, XUARTPS_CR_OFFSET,
			   (tmp | XUARTPS_CR_TORST));

	AddHandler2InitTable(InstancePtr, DevIntId,
			(Xil_ExceptionHandler) XUartPs_InterruptHandler, &ExceptionHandlers);

}

void StartUartInterrupts(XUartPs *InstancePtr)
/*
* \brief    Unmask the FIFO threshold and timeout bits.
*
* \param[in]   InstancePtr  - Pointer to the UART peripheral struct
*                             instance for which the interrupts are to be setup.
*/
{
	XUartPs_SetInterruptMask(InstancePtr, (XUARTPS_IXR_RXOVR | XUARTPS_IXR_TOUT));

}
