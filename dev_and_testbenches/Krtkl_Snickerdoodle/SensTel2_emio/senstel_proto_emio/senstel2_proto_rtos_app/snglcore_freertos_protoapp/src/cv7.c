/*
 * cv7.c
 *
 *  Created on: Jun 5, 2018
 *      Author: Jerome Pare-Lepine
 */

#include "cv7.h"
#include "fifo.h"
#include "ringbuffer.h"
#include "uart.h"
#include <stdio.h>


//==============================================================================
// GLOBAL VARIABLES
//==============================================================================
static char pcNmeaBuf[NMEA_BUF_SZ];
static sFifo_t *sNmeaFifo;

//==============================================================================
// FUNCTION DEFINITIONS
//==============================================================================
/*
 * @brief	Initializes the FIFO buffer the NMEA data parser uses to store payload
 * 			strings before processing them.
 */
void vInitNmeaCharBuffer(void)
{
	fifo_init(sNmeaFifo, (void *)pcNmeaBuf, NMEA_BUF_SZ);
}

/*
 * @brief 	Parses the NMEA character stream received from the wind sensor via UART.
 *
 * @arg		u32 baseaddr: Base addres of the UART peripheral used to interface the Cv7
 *
 * @arg		float *wdir, *wspd: Pointers to the variables the parser will store the
 * 			actual float values extracted from the NMEA strings. These are only
 * 			updated if the parser found any useful data in the attached buffer.
 *
 * @arg		buffer_t *pbuffer:	The ringbuffer the xUartBufferTask() uses to push the
 * 			received bytes into.
 */
u32 ulProcessCv7CharBuf(u32 baseaddr, float *wdir, float *wspd, buffer_t *pbuffer)
{
	u8 RecvChar, c1;
//	void *test = 0;
	static char str_end[3] = "\r\n";
	static eNmeaSeq_t NmeaStatusFlag = 0;
	static u32 CrRegVal = 0;


	while(!isempty(pbuffer)){
		RecvChar = popqueue(pbuffer);

		if(NmeaStatusFlag != NmeaComma){
			if( (RecvChar == '$') && (NmeaStatusFlag == NmeaNone) ){
				NmeaStatusFlag++;
			}
			else if( (RecvChar == 'I') && (NmeaStatusFlag == NmeaDollr) ){
				NmeaStatusFlag++;
			}
			else if( (RecvChar == 'I') && (NmeaStatusFlag == NmeaI1) ){
				NmeaStatusFlag++;
			}
			else if( (RecvChar == 'M') && (NmeaStatusFlag == NmeaI2) ){
				NmeaStatusFlag++;
			}
			else if( (RecvChar == 'W') && (NmeaStatusFlag == NmeaM) ){
				NmeaStatusFlag++;
			}
			else if( (RecvChar == 'V') && (NmeaStatusFlag == NmeaW) ){
				NmeaStatusFlag++;
			}
			else if( (RecvChar == ',') && (NmeaStatusFlag == NmeaV) ){
				NmeaStatusFlag++;
			}
		}

		else if(NmeaStatusFlag == NmeaComma){
			if(RecvChar == '*'){
				NmeaStatusFlag = 0;
				fifo_write(sNmeaFifo, (void *)str_end, 2);
				/* At this point, we're sure to have the important part of the Cv7's NMEA,
				 * with a character we won't use in the middle. */
				sscanf(pcNmeaBuf, "%f,%c,%f%*s", wdir, &c1, wspd);
				fifo_reset(sNmeaFifo);
				CrRegVal = XUartPs_ReadReg(baseaddr, XUARTPS_CR_OFFSET);
				/* Reset the UART receiver so that the acquisition again */
				XUartPs_WriteReg(baseaddr, XUARTPS_CR_OFFSET, (CrRegVal | XUARTPS_CR_RXRST | 0x20) );

				return XST_SUCCESS;
			}
			else if(RecvChar != '\0'){
				fifo_write(sNmeaFifo, (void *)&RecvChar, 1);
			}
		}
	}

	return XST_FAILURE;
}



