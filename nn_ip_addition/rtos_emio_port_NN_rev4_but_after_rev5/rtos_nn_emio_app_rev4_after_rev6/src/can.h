/*
 * can.h
 *
 *  Created on: May 25, 2018
 *      Author: Jerome Pare-Lepine
 */

#ifndef SRC_CAN_H_
#define SRC_CAN_H_

#include "xcanps.h"
#include "xparameters.h"


//==============================================================================
// DEFINITIONS
//==============================================================================
/* Maximum CAN frame length in word */
#define XCANPS_MAX_FRAME_SIZE_IN_WORDS (XCANPS_MAX_FRAME_SIZE / sizeof(u32))
#define FRAME_DATA_LENGTH	4	/* Frame Data field length */

/*
 * Message Id Constant.
 */
#define TEST_MESSAGE_ID		0x555
#define ID_GEAR_VALUE		0x23
#define	TEST_GEAR_VALUE		7

#define TEST_BTR_SYNCJUMPWIDTH		0
#define TEST_BTR_SECOND_TIMESEGMENT	2
#define TEST_BTR_FIRST_TIMESEGMENT	5

#define TEST_BRPR_BAUD_PRESCALAR	39
#define CAN0_INTR_ID	XPAR_XCANPS_0_INTR
#define CAN0_ID XPAR_XCANPS_0_DEVICE_ID

#define VOLANT_SW_MSG_XID	XCanPs_CreateIdValue(VOLANT_SW_MSG, 0, 0, 0, 0)
#define PITCHSYS_MODE_XID	XCanPs_CreateIdValue(ID_PITCH_MODE_SID, 0, 0, 0, 0)
#define PITCHSYS_DONE_XID   XCanPs_CreateIdValue(ID_PITCH_DONE, 0, 0, 0, 0)
#define PITCHSYS_ZERO_XID	XCanPs_CreateIdValue(VOALNT_PITCH_ZERO, 0, 0, 0, 0)
#define WINDDIR_ZERO_XID	XCanPs_CreateIdValue(VOLANT_WEATHER_ZERO, 0, 0, 0, 0)
#define GEAR_ZERO_XID	XCanPs_CreateIdValue(VOLANT_GEAR_ZERO, 0, 0, 0, 0)



//==============================================================================
// TYPE DEFINITIONS
//==============================================================================
typedef u32 CanMsgSid_t;
typedef u32 CanMsgData_t;
typedef struct sCanPacket sCanPacket_t;
typedef enum eCanCommProfile eCanCommProfile_t;


//==============================================================================
// VARIABLE DEFINITIONS
//==============================================================================
/*
 * @brief	Used to determine whether, and at which priority, a data packet
 * 			has to be output on the CAN bus.
 */
enum eCanCommProfile{
	Private = 0,
	PublicLow,
	PublicHigh
};

struct sCanPacket{
	CanMsgSid_t Sid;
	CanMsgData_t Dat;
	eCanCommProfile_t Profile;
};


//==============================================================================
// PUBLIC VARIABLES
//==============================================================================
static u32 TxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS];
u32 RxFrame[XCANPS_MAX_FRAME_SIZE_IN_WORDS];

volatile static int LoopbackError;	/* Asynchronous error occurred */
volatile static int RecvDone;		/* Received a frame */
volatile static int SendDone;		/* Frame was sent successfully */


//==============================================================================
// FUNCTION PROTOTYPES
//==============================================================================
s32 InitCan(XCanPs *CanInst, u32 DevId);
void InitCanInterrupts(XCanPs *InstancePtr, u16 DevIntId);
void SendFrame(XCanPs *InstancePtr, CanMsgSid_t DestSid, CanMsgData_t *Payload);
void StartCanInterrupts(XCanPs *InstancePtr);

#endif /* SRC_CAN_H_ */
