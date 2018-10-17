/*
 *  Created on: May 7, 2018
 *   Author: Jerome Pare-Lepine
 *   Notes:
 *   1. Unlike with the ChinookLib-based projects where the "main" contains none
 *   of the application code, this file here is where the SensTel application is
 *   meshed together. Also, instead of using a state machine scheduler as in
 *   all of the PIC32 projects, this one introduces the use of FreeRTOS. This
 *   decision was taken to allow Chinook developers to experiment and gain
 *   knowledge about real time OS'es and the features used in such systems.
 *   FreeRTOS is widely used in projects with limited ROM and RAM ie. where a
 *   full fledged OS like Linux or Android can't run, but where resource management
 *   and timing constraints has to be managed. It is a good asset for one's career.
 *
 * 	 2. FreeRTOS is task based. A task is very much similar to a state from
 *	 the other ChinookLib-based projects. While not very complicated, it is packed with
 *	 features and quite a few are put to use in the follwing code. RTFM'ing is highly
 *	 recommended, even if you know everything. That being said, get yourself a copy of
 *	 'Mastering the FreeRTOS Real Time Kernel' available for free online.
 *
 *   3. General description:
 *   The SensTel code handles sensor data acquisition and processing, broadcasts most
 *   of it on CAN bus, logs it on-demand to an SD card, can implement wireless telemetry
 *   and manages the VHDL pitch control AI core. Let's call the CAN bus, SD card and telemetry
 *   "outputs" - this term will be used later.
 *   While it currently works as is, wireless telemetry is not currently implemented,
 *   the automatic pitch control needs to be trained using real data from the car
 *   (valid torque meter readings are necessary) and the SD card can only handle one
 *   file at a time (once the SD card has a file on it, it needs to be formatted if
 *   you want to log something again). The development phase could be defined as
 *   early beta and was developed up to the point where it is functional but maybe
 *   not time and memory efficient - it can and should be improved.
 *
 *   4. App architecture overview:
 *   A software timer triggers a sensor acquisition task. The latter then successively
 *   triggers the sensor tasks - each sensor type has its own. After a read,
 *   each value is sent to a management task which stores them as is in an array
 *    - no processing is done yet. The idea behind that is that the acquisition should be
 *   done as quick as possible to achieve good sampling rates. The rest can take more time
 *   since nothing else is particularly time critical.
 *   The other tasks (the "outputs", for example) are also triggered periodically by the
 *   same software timer - each of these at a multiple of the acquisition period.
 *   Once an "output" task is triggered, it processes its corresponding data array
 *   (averaged and/or converted) and it outputs the resulting value(s) on its
 *   respective peripheral. Note that not all "outputs" need the same data formats,
 *   hence the need for separate tasks, data arrays and processing.
 *
 *   A software timer periodically triggers
 *   5. The tasks could've been moved to a separate 'tasks' file (for improved
 *   readability and code modularity) but a lack of time prevented me to do so.
 *   I also experienced crashes when dissociating FATFS variables from the main
 *   but was unable to find the actual reason.
 *
 *
 *
 *
 *
 *   FreeRTOS V8.2.1 - Copyright (C) 2015 Real Time Engineers Ltd.
 *   All rights reserved
 *
 */


//==============================================================================
// INCLUDES
//==============================================================================
/* FreeRTOS includes */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "semphr.h"

/* Xilinx includes */
#include "xil_printf.h"
#include "xparameters.h"

/* SensTel application code includes */
#include "senstel_sd.h"
#include "setup.h"
#include "senstel_acq_config.h"
#include "ChinookCanUtils.h"
#include "ChinookSteeringWheelUtils.h"
#include "inputcapture.h"
#include "ads1015.h"
#include "cv7.h"
#include "interrupts.h"
#include "uart.h"
#include "ringbuffer.h"
#include "timer.h"
#include "ann.h"


//==============================================================================
// TASKS & CALLBACK PROTOTYPES
//==============================================================================
static void prvCv7DecodeTask( void *pvParameters );
static void prvUartBufferTask( void *pvParameters );
static void prvSsiTask( void *pvParameters );
static void prvAdcTask( void *pvParameters );
static void prvIC0_0Task( void *pvParameters );
static void prvIC0_1Task( void *pvParameters );
static void prvAcqManTask( void *pvParameters );
static void prvSdWriteTask( void *pvParameters );
static void prvSdManTask( void *pvParameters );
static void prvCanTask( void *pvParameters );
static void prvPitchControlTask ( void *pvParameters);
static void prvSerialOutTask( void *pvParameters);
static void prvStartAcqTask( void *pvParameters );
static void vTimerCallback( TimerHandle_t pxTimer );

//==============================================================================
// GLOBAL VARIABLES
//==============================================================================
/* FreeRTOS Task Handles */
static TaskHandle_t xSsiTask;
static TaskHandle_t xAdcTask;
static TaskHandle_t xIc0_0Task;
static TaskHandle_t xIc0_1Task;
static TaskHandle_t xAcqManTask;
static TaskHandle_t xSdWriteTask;
static TaskHandle_t xCanTask;
TaskHandle_t xPitchControlTask;
static TaskHandle_t xSerialOutTask;
static TaskHandle_t xUartBufferTask;
TaskHandle_t xCv7DecodeTask;
TaskHandle_t xSdManTask;
static TaskHandle_t xStartAcqTask;

/* FreeRTOS Queue Handles */
static QueueHandle_t xQueueTimeStampSsi = NULL;
static QueueHandle_t xQueueTimeStampAdc = NULL;
static QueueHandle_t xQueueTimeStampIC0_0 = NULL;
static QueueHandle_t xQueueTimeStampIC0_1 = NULL;
static QueueHandle_t xQueueAcqMan = NULL;
static QueueHandle_t xQueueSdWrite = NULL;
static QueueHandle_t xQueueCan = NULL;
static QueueHandle_t xQueueSerialOut = NULL;
static QueueHandle_t xQueuePitchControl = NULL;

/* FreeRTOS Timer Handles */
static TimerHandle_t xAcqTimer = NULL;
static TimerHandle_t xDataTransmitTimer = NULL;

/* FreeRTOS Semaphore Handles */
static SemaphoreHandle_t xSdMutex = NULL;
static SemaphoreHandle_t xUartBuf2DecodeMutex = NULL;
static SemaphoreHandle_t xAcqSem = NULL;
SemaphoreHandle_t xIc0_0AcqSem = NULL;
SemaphoreHandle_t xIc0_1AcqSem = NULL;
SemaphoreHandle_t xUartBufferSem = NULL;

/* SensTel application code global variables */
char HWstring[15] = "Hello World";   /* Artifact from the FreeRTOS demo */
long SsitaskCntr = 0;	/* For debug purposes */
long AdctaskCntr = 0;
long AcqMantaskCntr = 0;
long CanTaskCntr = 0;
sPeriphInstances_t PInst;
buffer_t UartRingBuf;
u8 UartArray[UART_CHAR_BUFFER_SIZE] = {0};
sAppTaskProfiles_t sAppProfs;   /* No longer used, could be removed */
u32 oTHWM= 0;
volatile u32 PitchSysMode = 1;	/* Starts off in Manual Mode (high) */
volatile u32 PitchCmdDone = 1;	/* Allow the initial command to be issued */
volatile eSensor_t SystemToZero = 0;
volatile u8 CalibSystem = 0;
static u8 HaltSdWrite = ACQMAN_HALTSDW;

/* Fatfs object instances */
static FATFS fatfs;
static FIL file;

//==============================================================================
// MAIN FUNCTION
//==============================================================================
int main( void )
/*
* \brief       This is where all of the initialization is done - the FreeRTOS
*              resources (software timers, queues, semaphores and tasks), buffers,
*              data tables and system peripherals.
*              The only thing left to do after starting the scheduler is to
*              start the interrupts, which is done at the beginning of the
*              SSI task.
*              The tasks are ran from the vTaskStartScheduler() function.
*/
{
	/* Prepare the time basis for the acquisition and data distribution */
	const TickType_t xAcqRate = pdMS_TO_TICKS( ACQ_PERIOD );
	const TickType_t xDataSendRate = pdMS_TO_TICKS( DATXMIT_CNT_PERIOD );

	/* TODO: Get rid of the AppProfile-related code. While it could be very useful, its a lot of work.
	 * Figuring out how to enable the RuntimeInfo features could be more efficient. */
//	InitAppProfile(&sAppProfs);
	InitSensorProfilesArray();
	InitSensorBuffersTable();

	/* Create the tasks. The task priorities have to be carefully chosen. The stack sizes
	 * are determined experimentally. */
	xTaskCreate( prvSsiTask,
				 ( const char * ) "Ssi",
				 configMINIMAL_STACK_SIZE,
				 NULL,
				 tskIDLE_PRIORITY + 3,
				 &xSsiTask );

	xTaskCreate( prvUartBufferTask,
				 ( const char * ) "UartBuf",
				 configMINIMAL_STACK_SIZE + 200,
				 NULL,
				 tskIDLE_PRIORITY + 3,
				 &xUartBufferTask );

	xTaskCreate( prvCv7DecodeTask,
				 ( const char * ) "Cv7",
				 600,
				 NULL,
				 tskIDLE_PRIORITY + 3,
				 &xCv7DecodeTask );

	xTaskCreate( prvAdcTask,
				 ( const char * ) "Adc",
				 configMINIMAL_STACK_SIZE,
				 NULL,
				 tskIDLE_PRIORITY + 3,
				 &xAdcTask );

	xTaskCreate( prvIC0_0Task,
				 ( const char * ) "Inp00Cap",
				 500,
				 NULL,
				 tskIDLE_PRIORITY + 4,
				 &xIc0_0Task );

	xTaskCreate( prvIC0_1Task,
				 ( const char * ) "Inp01Cap",
				 500,
				 NULL,
				 tskIDLE_PRIORITY + 4,
				 &xIc0_1Task );

#ifdef DEBUG_ENABLE_ACQ_MAN
	xTaskCreate( prvAcqManTask,
				 ( const char * ) "AcqMan",
				 configMINIMAL_STACK_SIZE * 20,
				 NULL,
				 tskIDLE_PRIORITY + 4,
				 &xAcqManTask );
#endif

	xTaskCreate( prvSdManTask,
				 ( const char * ) "SdMan",
				 configMINIMAL_STACK_SIZE,
				 NULL,
				 tskIDLE_PRIORITY + 3,
				 &xSdManTask);

	xTaskCreate( prvSdWriteTask,
				 ( const char * ) "SdW",
				 configMINIMAL_STACK_SIZE + 1000,
				 NULL,
				 tskIDLE_PRIORITY + 2,
				 &xSdWriteTask );

	xTaskCreate( prvCanTask,
				 ( const char * ) "Can",
				 configMINIMAL_STACK_SIZE,
				 NULL,
				 tskIDLE_PRIORITY + 4,
				 &xCanTask );

	xTaskCreate( prvPitchControlTask,
				 ( const char * ) "PitCont",
				 configMINIMAL_STACK_SIZE,
				 NULL,
				 tskIDLE_PRIORITY + 2,
				 &xPitchControlTask );

	xTaskCreate( prvSerialOutTask,
				 ( const char * ) "SerO",
				 configMINIMAL_STACK_SIZE + 500,
				 NULL,
				 tskIDLE_PRIORITY,
				 &xSerialOutTask );

	xTaskCreate( prvStartAcqTask,
				 ( const char * ) "StartAcq",
				 configMINIMAL_STACK_SIZE+50,
				 NULL,
				 tskIDLE_PRIORITY + 2,
				 &xStartAcqTask );

	/* Create the queues used by the tasks. */
	xQueueAcqMan = xQueueCreate( 	64,					/* The number of slots in the queue. */
							sizeof( sSensorData_t ) );	/* The size of each slots */
	xQueueTimeStampSsi = xQueueCreate( 	1, sizeof( HWstring ) );
	xQueueTimeStampAdc = xQueueCreate( 	1, sizeof( HWstring ) );
	xQueueTimeStampIC0_0 = xQueueCreate( 	3, sizeof( HWstring ) );
	xQueueTimeStampIC0_1 = xQueueCreate( 	3, sizeof( HWstring ) );
	xQueueSdWrite = xQueueCreate( 	64, sizeof( sSensorData_t ) );
	xQueueCan = xQueueCreate( 	32, sizeof( sCanPacket_t ) );
	xQueueSerialOut = xQueueCreate( 	32, sizeof( sSensorData_t ) );
	xQueuePitchControl = xQueueCreate( 	16, sizeof( sSensorData_t ) );

	/* Check that the queues were created. */
	configASSERT( xQueueAcqMan );
	configASSERT( xQueueTimeStampAdc );
	configASSERT( xQueueTimeStampSsi );
	configASSERT( xQueueTimeStampIC0_0 );
	configASSERT( xQueueTimeStampIC0_1 );
	configASSERT( xQueueSdWrite );
	configASSERT( xQueueCan );
	configASSERT( xQueueSerialOut );
	configASSERT( xQueuePitchControl );

	/* Create the software timers and register the callback function */
	xAcqTimer = xTimerCreate( (const char *) "AcqTmr",
					xAcqRate,
					pdTRUE,
					(void *) ACQ_TIMER_ID,
					vTimerCallback);

	xDataTransmitTimer = xTimerCreate( (const char *) "DatXmitTmr",
							xDataSendRate,
							pdTRUE,
							(void *) DATXMIT_TIMER_ID,
							vTimerCallback);

	/* Check that the timers were created. */
	configASSERT( xAcqTimer );
	configASSERT( xDataTransmitTimer );

	/* Create the counting semaphore used for triggering the sensor tasks. */
	xAcqSem = xSemaphoreCreateCounting(ACQ_SEM_MAX_COUNT, 0);

	/* Create the counting semaphore used for setting off the Uart char buffer
	 * emptying task. */
	xUartBufferSem = xSemaphoreCreateCounting(2, 0);

	/* Create the binary semaphores used for deferring IC interrupts
	 * processing to the ICTasks. */
	xIc0_0AcqSem = xSemaphoreCreateBinary();
	xIc0_1AcqSem = xSemaphoreCreateBinary();

	/* Create the counting semaphore used for setting off the Cv7 char buffer
	 *  parsing task. */
	xSdMutex = xSemaphoreCreateMutex();

	/* Create the mutex used for mutual exclusion between the Uart buffering task
	 * and the Cv7 data decoding task. */
	xUartBuf2DecodeMutex = xSemaphoreCreateCounting(CV7_SEM_COUNT, 0);

	/* Start the timer with a block time of 0 ticks. This means as soon
	 * as the schedule starts the timer will start running and will expire after
	 * 10 seconds */
	xTimerStart( xAcqTimer, 0 );
	xTimerStart( xDataTransmitTimer, 0 );

	InitPeripherals(&PInst);
	initbuffer(&UartRingBuf, UART_CHAR_BUFFER_SIZE, &UartArray[0]);


	/* Start the tasks and timer running. */
	vTaskStartScheduler();

	/* If all is well, the scheduler will now be running, and the following line
	will never be reached.  If the following line does execute, then there was
	insufficient FreeRTOS heap memory available for the idle and/or timer tasks
	to be created.  See the memory management section on the FreeRTOS web site
	for more details. */
	for( ;; );
}


//==============================================================================
// SENSTEL APP TASKS
//==============================================================================
/*
 * NOTE: The tasks are not defined in the same order than they are called.
 */
static void prvCv7DecodeTask( void *pvParameters )
/*
* \brief       Once the Cv7's raw data payload is transferred from the FIFO to
*              a software buffer, a mutex is given. This unblocks this task, which
*              parses the buffer for the wind direction and wind speed data.
*
*/
{
	static u32 Res = 1;
	float wdir = 0, wspd = 0;
	static sSensorData_t DirDat = CV7_WDIR_PROFILE, SpdDat = CV7_WSPD_PROFILE;

	/* This is the buffer the NMEA packet processing function, ulProcessCv7CharBuf(),
	 * will use to lineup chars it judges relevant until it extracts the wind data floats*/
	vInitNmeaCharBuffer();

	for( ;; ){
		vTaskDelay(1);
		xSemaphoreTake(xUartBuf2DecodeMutex, portMAX_DELAY);
		#ifdef DEBUG_TASK_PRINTS
			xil_printf("cv7dec\n");
		#endif
		Res = ulProcessCv7CharBuf(PInst.Cv7UartInst->Config.BaseAddress, &wdir, &wspd, &UartRingBuf);
		if(!Res){
			memcpy((void *)&DirDat.Data, (void *)&wdir, 4);
			memcpy((void *)&SpdDat.Data, (void *)&wspd, 4);
			xQueueSend(xQueueAcqMan, &DirDat, 0);
			xQueueSend(xQueueAcqMan, &SpdDat, 0);
#ifdef DEBUG_CV7_DECODE_PRINTS
			printf("%f, %f\r\n", wdir, wspd);
#endif
		}
	}

}


/*-----------------------------------------------------------*/
static void prvUartBufferTask( void *pvParameters )
/*
* \brief    The Cv7's FIFO threshold interrupt defers the character
*           transfer to this task using a semaphore. The reason
*           why this transfer task is separated from the decode
*           task is that we want to empty the Uart peripheral's
*           Fifo as soon as possible to avoid any fault condition
*           or data loss.
*           The Cv7 decode part of the processing can be done once
*           in a while but doesn't necessarily needs to be immediate.
*           Having two tasks for that enables us to choose separate
*           priorities.
*/
{
	static u32 RecvdChar = 0;

	for( ;; ){
		xSemaphoreTake(xUartBufferSem, portMAX_DELAY);
		#ifdef DEBUG_TASK_PRINTS
			xil_printf("cv7buftsk\n");
		#endif
		for(int i = 0; i<UART_FIFO_THRESHOLD; i++){
			RecvdChar =  XUartPs_ReadReg(PInst.Cv7UartInst->Config.BaseAddress,
						    XUARTPS_FIFO_OFFSET);
			push(&UartRingBuf, (u8 )RecvdChar);
		}
		xSemaphoreGive(xUartBuf2DecodeMutex);
	}

}


/*-----------------------------------------------------------*/
static void prvSsiTask( void *pvParameters )
/*
* \brief    Since it is the first one that is created in the
*           main() function, it is the first one that is ran
*           when the FreeRTOS scheduler is started.
*           The peripheral interrupts are started at the beginning
*           of this, before it is stopped waiting for a message in
*           its queue. The absolute encoders data is read and packetized
*           before being sent to the acquisition manager.
*
* \note     The "Timestamp" received in the queue is currently a
*           "Hello World" string. When an RTC is going to be available,
*           change this string for an actual timestamp. Timestamp
*           management in the data buffers will have to be implemented
*           - it can be useful to log and/or communicate the sensor
*           data along with a timestamp instead of presuming that the
*           acquisition rate is as intended.
*           ***This is valid for every sensor data acquisition task
*
*/
{
char Timestamp[15] = "";
BaseType_t xRes = pdFALSE;
StartPeripheralInterrupts(&PInst);
static u32 ulPitch22bVal = 0, ulGear12bVal = 0;
static sSensorData_t SensDat1 = PITCH_ABSENC_PROFILE, SensDat2 = GEAR_ABSENC_PROFILE;
static u8 start = 1;


	for( ;; )
	{
		xQueueReceive( 	xQueueTimeStampSsi,
									Timestamp,
									portMAX_DELAY );
		#ifdef DEBUG_TASK_PRINTS
			xil_printf("ssitsk\n");
		#endif

#ifdef SSI_DUMMY_VALUE
		SensDat1.Data = (SSI_DUMMY_VALUE);
		SensDat1.Data ^= 1;

#else
		/* The 22-bits pitch encoder had to be swaped for the 12-bit part. */
		ulPitch22bVal = readPos(PInst.EmioBankPins, TwelveBits);
		SensDat1.Data = ulPitch22bVal;
//		ulGear12bVal = readPos(PInst.EmioBankPins, TwelveBits);
//		SensDat2.Data = ulGear12bVal;
#endif
		SsitaskCntr++;
		xRes = xQueueSend(xQueueAcqMan, (void *)&SensDat1, 0);
//		xRes = xQueueSend(xQueueAcqMan, (void *)&SensDat2, 0);

		/* Gear position sensor data to actual gear number conversion and
		 * zero calibration handling still have to be debugged/implemented */
		if( start ){
			start = 0;
//			ZeroGearsTable(SensDat2.Data);
		}
	}
}

/*-----------------------------------------------------------*/
static void prvAdcTask( void *pvParameters )
/*
* \brief    The sensors that are interfaced to the ADC are read in this
*           task.
*
* \note     The "Timestamp" received in the queue is currently a
*           "Hello World" string. When an RTC is going to be available,
*           change this string for an actual timestamp. Timestamp
*           management in the data buffers will have to be implemented
*           - it can be useful to log and/or communicate the sensor
*           data along with a timestamp instead of presuming that the
*           acquisition rate is as intended.
*           ***This is valid for every sensor data acquisition task
*
*/
{
char Timestamp[15] = "";
BaseType_t xRes = pdFALSE;
static s16 value[4] = {0};
static sSensorData_t SensDat1 = TURB_TORQUE_PROFILE, SensDat2 = THRUST_LOAD_PROFILE;

	for( ;; )
	{
		/* Block to wait for data arriving on the queue. */
		xQueueReceive( 	xQueueTimeStampAdc,				/* The queue being read. */
						Timestamp,	/* Data is read into this address. */
						portMAX_DELAY );	/* Wait without a timeout for data. */
#ifdef DEBUG_TASK_PRINTS
		xil_printf("adctsk\n");
#endif
#ifdef ADC_DUMMY_VALUES
		SensDat1.Data = ADC_DUMMY_VALUES;
		SensDat1.Data ^= 1;
		SensDat2.Data = ADC_DUMMY_VALUES;

#else
		SensDat1.Data = (u32) readADCSingleEnded(PInst.Iic1Inst, XPAR_PS7_I2C_1_BASEADDR, 0);
		/*
		 * Enable Thrust sensor's acquisition by uncommenting this.
		 * It currently sends an empty data packet to the Acquisition Manager
		 */
//		SensDat2.Data = (u32) readADCSingleEnded(PInst.Iic1Inst, XPAR_PS7_I2C_1_BASEADDR, 1);
#endif

		xRes = xQueueSend(xQueueAcqMan, &SensDat1, 0);
		xRes = xQueueSend(xQueueAcqMan, &SensDat2, 0);
	}
}

/*-----------------------------------------------------------*/
static void prvIC0_0Task( void *pvParameters )
/*
* \brief    The rear Axle rotation speed in measured in this task.
*           Rotational speed sensors that use an incremental encoder
*           to communicate their data - Turbine RPM (Futek TRD305)
*           and Axle RPM (SKF encoder bearing), are read through one
*           of these two tasks. They use either the first or second
*           half of the IP Core timer named "TimerCounter".
*
*
* \note     The "Timestamp" received in the queue is currently a
*           "Hello World" string. When an RTC is going to be available,
*           change this string for an actual timestamp. Timestamp
*           management in the data buffers will have to be implemented
*           - it can be useful to log and/or communicate the sensor
*           data along with a timestamp instead of presuming that the
*           acquisition rate is as intended.
*           ***This is valid for every sensor data acquisition task
*
*/
{
	char Timestamp[15] = "";
	static u32 Samples[IC_SAMPLES_NUM];
	static u8 SamplesAcqd = 0;
	static u32 sum = 0, end=0, start=0, dif=0, avg=0;
	static sSensorData_t SensDat = AXLE_INCENC_PROFILE;

	start = XTmrCtr_GetValue(PInst.TmrCtr0Inst, DEVICE_TMR_0);	/* Read the initial timer value */

	for( ;; )
	{
		/* Block to wait for data arriving on the queue. */
		xQueueReceive( 	xQueueTimeStampIC0_0,				/* The queue being read. */
				Timestamp,	/* Data is read into this address. */
						portMAX_DELAY );	/* Wait without a timeout for data. */
		#ifdef DEBUG_TASK_PRINTS
			xil_printf("ic0tsk\n");
		#endif

#ifdef IC0_DUMMY_VALUE
			SensDat.Data = IC0_DUMMY_VALUE;
			SensDat.Data ^= 1;

#else
		/* Experimenting with IC averaging and processing deferring from ISR */
		while(SamplesAcqd < IC_SAMPLES_NUM){ /* Acquire all samples */
			XTmrCtr_Reset(PInst.TmrCtr0Inst, DEVICE_TMR_0); /* Reset the counter */
			XTmrCtr_EnableIntr(PInst.TmrCtr0Inst->BaseAddress, DEVICE_TMR_0); /* Enable interrupts */
			xSemaphoreTake(xIc0_0AcqSem, portMAX_DELAY);	/* Wait for input capture ISR signal */
			start = XTmrCtr_GetCaptureValue(PInst.TmrCtr0Inst, DEVICE_TMR_0);
			XTmrCtr_EnableIntr(PInst.TmrCtr0Inst->BaseAddress, DEVICE_TMR_0);
			xSemaphoreTake(xIc0_0AcqSem, portMAX_DELAY);	/* Wait for input capture ISR signal */
			end = XTmrCtr_GetCaptureValue(PInst.TmrCtr0Inst, DEVICE_TMR_0);
			dif = end - start;
			/* We assume the difference between the start and end is the correct interval*/
			Samples[SamplesAcqd] = dif;
			SamplesAcqd++;
		}
		//TODO: Find out why is the first sample always corrupted
		for(int i=1; i < IC_SAMPLES_NUM; i++){	/* Skip the first sample */
			sum += Samples[i];
		}

		avg = sum/(IC_SAMPLES_NUM-1);
		SensDat.Data = avg;
#endif

		SamplesAcqd = 0;
		sum = 0;
		xQueueSend(xQueueAcqMan, &SensDat, 2);
	}
}


/*-----------------------------------------------------------*/
static void prvIC0_1Task( void *pvParameters )
/*
* \brief    The wind Turbine's rotation speed in measured in this task.
*           Rotational speed sensors that use an incremental encoder
*           to communicate their data - Turbine RPM (Futek TRD305)
*           and Axle RPM (SKF encoder bearing), are read through one
*           of these two tasks. They use either the first or second
*           half of the IP Core timer named "TimerCounter".
*
*
* \note     The "Timestamp" received in the queue is currently a
*           "Hello World" string. When an RTC is going to be available,
*           change this string for an actual timestamp. Timestamp
*           management in the data buffers will have to be implemented
*           - it can be useful to log and/or communicate the sensor
*           data along with a timestamp instead of presuming that the
*           acquisition rate is as intended.
*           ***This is valid for every sensor data acquisition task
*
*/
{
	char Timestamp[15] = "";
	static u32 Samples[IC_SAMPLES_NUM];
	static u8 SamplesAcqd = 0;
	static u32 sum = 0, end=0, start=0, dif=0, avg=0;
	static sSensorData_t SensDat = TURB_INCENC_PROFILE;

	start = XTmrCtr_GetValue(PInst.TmrCtr0Inst, DEVICE_TMR_1);	/* Read the initial timer value */

	for( ;; )
	{
		/* Block to wait for data arriving on the queue. */
		xQueueReceive( 	xQueueTimeStampIC0_1,				/* The queue being read. */
						Timestamp,	/* Data is read into this address. */
						portMAX_DELAY );	/* Wait without a timeout for data. */
		#ifdef DEBUG_TASK_PRINTS
			xil_printf("ic1tsk\n");
		#endif

#ifdef DEBUG_ENABLE_DUMMY_SENSOR_READINGS
		SensDat.Data = IC1_DUMMY_VALUE;
		SensDat.Data ^= 1;

#else
		//Experimenting with IC averaging and processing deferance from ISR
		while(SamplesAcqd < IC_SAMPLES_NUM){ //Acq all samples
			XTmrCtr_Reset(PInst.TmrCtr0Inst, DEVICE_TMR_1);
			XTmrCtr_EnableIntr(PInst.TmrCtr0Inst->BaseAddress, DEVICE_TMR_1);
			xSemaphoreTake(xIc0_1AcqSem, portMAX_DELAY);	/* Wait for input capture ISR signal */
			start = XTmrCtr_GetCaptureValue(PInst.TmrCtr0Inst, DEVICE_TMR_1);
			XTmrCtr_EnableIntr(PInst.TmrCtr0Inst->BaseAddress, DEVICE_TMR_1);
			xSemaphoreTake(xIc0_1AcqSem, portMAX_DELAY);	/* Wait for input capture ISR signal */
			end = XTmrCtr_GetCaptureValue(PInst.TmrCtr0Inst, DEVICE_TMR_1);
			dif = end - start;
			Samples[SamplesAcqd] = dif;
			SamplesAcqd++;
		}
		//TODO: Find out why is the first sample corrupted
		for(int i=1; i < IC_SAMPLES_NUM; i++){	/*The first entry is for some reasons always wrong	*/
			sum += Samples[i];
		}

		avg = sum/(IC_SAMPLES_NUM-1);
		SensDat.Data = avg;
#endif
		SamplesAcqd = 0;
		sum = 0;
		xQueueSend(xQueueAcqMan, &SensDat, 2);
		AdctaskCntr++;

	}
}


/*-----------------------------------------------------------*/
static void prvStartAcqTask( void *pvParameters )
/*
* \brief    The sensor acquisition tasks are waiting on their queue
*           to contain a message put there by this task.
*           These tasks are then consecutively activated.
*
* \note     The HWString put in the queue is currently a
*           "Hello World" string. When an RTC is going to be available,
*           change this for an actual timestamp. Timestamp
*           management in the data buffers will have to be implemented
*           - it can be useful to log and/or communicate the sensor
*           data along with a timestamp instead of presuming that the
*           acquisition rate is as intended.
*           ***This task would fetch the current timestamp and send it to
*           the sensor tasks.
*
*/
{
	static u8 taskIdx = 0;
	static u32 startval = 0;
	static u8 taskQty = 0;

	/* App profiling facilities - this would have registered a task for
	 * profiling */
//	taskIdx = AddTaskProfile(&sAppProfs, "StartAcq\0", 9);
	xSemaphoreTake(xAcqSem, portMAX_DELAY);	//Should block here until there's one
//	taskQty = uxTaskGetNumberOfTasks();
//	TaskStatus_t taskStates[taskQty];

	for(;;)
	{
		/* App profiling facilities - the SCU Counter (Core Timer)
		 * would have been used as a timebase for task
		 * runtimes */
//		startval = GetScuCounterValue(PInst.CoreTimer);
		#ifdef DEBUG_TASK_PRINTS
			xil_printf("+ acqman: %d, cantsk: %d\n", AcqMantaskCntr, CanTaskCntr);
		#endif
		/* TODO: Get timestamp and swap the HWString for it */
		xQueueSend( xQueueTimeStampSsi,			/* The queue being written to. */
							HWstring, /* The address of the data being sent. */
							0UL );			/* The block time. */
		/* TODO: Get timestamp and swap the HWString for it */
		xQueueSend( xQueueTimeStampAdc,			/* The queue being written to. */
							HWstring, /* The address of the data being sent. */
							0UL );			/* The block time. */
		/* TODO: Get timestamp and swap the HWString for it */
		xQueueSend( xQueueTimeStampIC0_0,			/* The queue being written to. */
							HWstring, /* The address of the data being sent. */
							0UL );			/* The block time. */
		/* TODO: Get timestamp and swap the HWString for it */
		xQueueSend( xQueueTimeStampIC0_1,			/* The queue being written to. */
							HWstring, /* The address of the data being sent. */
							0UL );			/* The block time. */

//		UpdateTaskProfile(&sAppProfs, taskIdx, ( GetScuCounterValue(PInst.CoreTimer) - startval) );
//		uxTaskGetSystemState(&taskStates[0], taskQty, NULL);
		xSemaphoreTake(xAcqSem, portMAX_DELAY);	/* Wait for a new acquisition trigger signal */
	}
}

/*-----------------------------------------------------------*/
static void prvAcqManTask( void *pvParameters )
/*
* \brief    The sensor acquisition tasks send their packetized
*           data here.
*           This manages a few things: it manages which data has to
*           be outputted where, it stores the sensor data in the correct
*           place and manages the zero calibration sequence. They are
*           done in that order.
*
*/
{
	static sSensorData_t Dat = {0};
	static sCanPacket_t Pkt = {0}, CalibDone = {CALIB_DONE_SID, EMPTY_CAN_MSG, PublicLow};
	static eXmitCmd_t eNotifVal = NoCmd;
	static eSensor_t Sen;
	sXmitData2Dest_t XmitDat[COMM_DEST_TOTAL];
	static u8 Res = 0, i;
//	static u8 taskIdx = 0;
	static u32 notif = 0;
	static float tmp = 0;


//	taskIdx = AddTaskProfile(&sAppProfs, "AcqMan\0", 7);

	for( ;; )
	{
		/* Is there a transmission request? */
		if( xTaskNotifyWait(0, ACQMAN_CLRALL, (u32 *) &eNotifVal, 0) ){
			for(Sen = Cv7_Wspd; Sen < SENSOR_TOTAL; Sen++){

				/* Lookup the data requested by the notification */
				Res = GetSensorTransmitData(eNotifVal, Sen, &XmitDat[0]);
				UpdateTaskHighWaterMark(&oTHWM, NULL);
				if(Res){
					/* Transmit the requested data */
					for(i = 0; i < Res; i++){
						switch(XmitDat[i].eDataType){
							case CanType:
#ifdef DEBUG_DATA_PATH_PRINTS
								xil_printf("dpath Can out: sns%d, dat%d\n", XmitDat[i].sSensProfile->Sensor, XmitDat[i].sSensProfile->Data);
#endif
								tmp = ConvertSensorData(Sen,
										(void *)&(XmitDat[i].sSensProfile->Data),
										(void *)&(XmitDat[i].sSensProfile->CalBias));
								memcpy((void *)&Pkt.Dat, (void *)&tmp, 4);
								Pkt.Sid = XmitDat[i].sSensProfile->Sid;
								//TODO: QueueSendToFront seems broken.. the CAN task crashes when this
								//API function is called.
//								if( XmitDat[i].sSensProfile->Profile == PublicHigh ){
//									xQueueSendToFront(xQueueCan, (void *)&Pkt, 0);
//								}
//								else if( XmitDat[i].sSensProfile->Profile > Private ){
								if(XmitDat[i].sSensProfile->Profile > Private){
									xQueueSend(xQueueCan, (void *)&Pkt, 0);
								}
								break;

							case SdType:
								if( !HaltSdWrite ){
									xQueueSend(xQueueSdWrite, (void *)XmitDat[i].sSensProfile, 0);
								}
								break;

							case NNType:
								if( (Sen == Cv7_Wspd) || (Sen == PitchAbsEnc) || (Sen == TurbineIncEnc) ){
									xQueueSend(xQueuePitchControl, (void *)XmitDat[i].sSensProfile, 0);
								}
								break;

							case LoRaType:
//								xQueueSend(xQueue);
								break;

							case SerialType:
#ifdef DEBUG_ENABLE_SERIALOUT
								xQueueSend(xQueueSerialOut, (void *)XmitDat[i].sSensProfile, 0);
#endif
								break;

						}
					}
				}
			}
			UpdateTaskHighWaterMark(&oTHWM, NULL);
		}

		/* Block to wait for data arriving on the queue. */
		xQueueReceive( 	xQueueAcqMan,				/* The queue being read. */
								&Dat,	/* Data is read into this address. */
								portMAX_DELAY );	/* Wait without a timeout for data. */

#ifdef DEBUG_DATA_PATH_PRINTS
		xil_printf("dpath Q In: Sens-> %d, Data-> %d\n", Dat.Sensor, Dat.Data);
#endif

		/* Service a calibration request? */
		if( CalibSystem ){ /* Updated by the CAN handler */
			if(Dat.Sensor == SystemToZero){  /* Selected by the steering wheel */
				CalibSystem = 0;
				switch(SystemToZero){
				case PitchAbsEnc:
					UpdateSensorBiasInArray(PitchAbsEnc, Dat.Data);
					break;
				case GearAbsEnc:
					ZeroGearsTable(Dat.Data);
					UpdateSensorBiasInArray(GearAbsEnc, Dat.Data);
					break;
				case Cv7_Wdir:
					UpdateSensorBiasInArray(Cv7_Wdir, Dat.Data);
					break;
				default:
					break;
				}
				/* Notify other systems that the calibration is done */
				xQueueSend(xQueueCan, (void *)&CalibDone, 0);
			}
		}
		/* Store the received sensor data in its array slot */
		UpdateSensorBuffers(&Dat);
		AcqMantaskCntr++; /* For debug purposes */
	}
}


/*-----------------------------------------------------------*/
static void prvSdWriteTask( void *pvParameters )
/*
* \brief    The task gets individual sensor values from the queue,
* 			masking its corresponding bit in a status word.
* 			Once values from every sensor have been received, they
* 			are made into a string and written in the open file in
* 			the SD card's filesystem.
*
*/
{
	static sSensorData_t Dat = {0};
	static s16 error = 0;
	static float tmpArray[SENSOR_TOTAL] = {0};
	static u32 rxdsensflags = 0;
	float ftmp = 0;
	char str[MAX_STRING_SIZE] = {0};

	for( ;; ){
		xQueueReceive( 	xQueueSdWrite,				/* The queue being read. */
						&Dat,	/* Data is read into this address. */
						portMAX_DELAY );	/* Wait without a timeout for data. */
		xSemaphoreTake(xSdMutex, portMAX_DELAY);
		rxdsensflags |= (1 << Dat.Sensor);
		ftmp = ConvertSensorData(Dat.Sensor, (void *)&(Dat.Data), (void *)&(Dat.CalBias) );
		tmpArray[Dat.Sensor] = ftmp;
		if(rxdsensflags == 0xFF){
			if( error >= 0 ){
				sprintf(str, "%f,%f,%f,%f,%f,%f,%f,%f\r\n",
												tmpArray[Cv7_Wspd],
												tmpArray[Cv7_Wdir],
												tmpArray[PitchAbsEnc],
												tmpArray[GearAbsEnc],
												tmpArray[TurbineIncEnc],
												tmpArray[AxleIncEnc],
												tmpArray[TurbineTorque],
												tmpArray[LoadCell]);
				error = f_puts((TCHAR *)str, &file);
			}
			rxdsensflags = 0;
		}
		xSemaphoreGive(xSdMutex);
	}
}


/*-----------------------------------------------------------*/
static void prvCanTask( void *pvParameters )
/*
* \brief    Takes a sensor data packet and sends it on the
*           CAN bus.
*
*/
{
	static sCanPacket_t Dat = {0};

	for( ;; ){

		xQueueReceive( 	xQueueCan,				/* The queue being read. */
						&Dat,	/* Data is read into this address. */
						portMAX_DELAY );	/* Wait without a timeout for data. */

		CanTaskCntr++;
#ifdef DEBUG_CAN_XMIT_PRINTS
		xil_printf("CAN OUT: Sid%x, Dat%d, Prof%d\n", Dat.Sid, Dat.Dat, Dat.Profile);
#endif

#ifdef DEBUG_ENABLE_CAN
		SendFrame(PInst.CanInst, Dat.Sid, &Dat.Dat);
#endif

	}
}


/*-----------------------------------------------------------*/
static void prvSerialOutTask( void *pvParameters)
/*
* \brief    Takes a sensor data packet and sends it on the
*           console UART.
*
*/
{
	static sSensorData_t Dat = {0};
	static float tmpArray[SENSOR_TOTAL] = {0};
	static u32 rxdsensflags = 0;
	float ftmp = 0;

	for(;;){
		xQueueReceive( 	xQueueSerialOut, &Dat, portMAX_DELAY );
		rxdsensflags |= (1 << Dat.Sensor);
		ftmp = ConvertSensorData(Dat.Sensor, (void *)&(Dat.Data), (void *)&(Dat.CalBias) );
		tmpArray[Dat.Sensor] = ftmp;
		if(rxdsensflags == 0xFF){
#ifdef DEBUG_ENABLE_SERIALOUT
			printf("%f, %f, %f, %f, %f, %f, %f, %f\n",
					tmpArray[Cv7_Wspd],
					tmpArray[Cv7_Wdir],
					tmpArray[PitchAbsEnc],
					tmpArray[GearAbsEnc],
					tmpArray[TurbineIncEnc],
					tmpArray[AxleIncEnc],
					tmpArray[TurbineTorque],
					tmpArray[LoadCell]
					);
#endif
			rxdsensflags = 0;
			for(int i = 0; i < SENSOR_TOTAL; i++) tmpArray[i] = 0;
		}
	}
}


/*-----------------------------------------------------------*/
static void prvPitchControlTask( void *pvParameters )
/*
* \brief    Services the automatic pitch control neural network IP Core.
*           It has been tested on the last test day before shipping
*           and is functional. However, it has been trained with
*           theoretical data and not real data from the car and would
*           need this to be able to provide real gains.
*
*/
{
	sSensorData_t Dat = {0};
	static u8 Sent = 0;
	/* Use the steering's SID's to issue Pitch commands */
	sCanPacket_t PPlusPkt = {VOLANT_SW_MSG, PITCH_PLUS_BUTTON, PublicHigh};
	sCanPacket_t PMinusPkt = {VOLANT_SW_MSG, PITCH_MINUS_BUTTON, PublicHigh};
	sCanPacket_t PMaintainPkt = {VOLANT_SW_MSG, EMPTY_CAN_MSG, PublicHigh};
	static u8 rxdsensflags = 0;
	static u32 ulWspd = 0, ulTurbRpm = 0, ulPitch = 0;
	static eANNCmdVal_t Cmd = MaintainPitch;

	for(;;){
		xQueueReceive( 	xQueuePitchControl, &Dat, portMAX_DELAY );
		switch(Dat.Sensor){
			case Cv7_Wspd:
				rxdsensflags |= 1; /* Wind speed data has been received */
				ulWspd = ConvertSensorDataForNN(Dat.Sensor, (void*)&(Dat.Data), (void*)&(Dat.CalBias) );
				break;
			case PitchAbsEnc:
				rxdsensflags |= 2;	/* Pitch data has been received */
				ulPitch = ConvertSensorDataForNN(Dat.Sensor, (void*)&(Dat.Data), (void*)&(Dat.CalBias) );
				break;
			case TurbineIncEnc:
				rxdsensflags |= 4;	/* Turbine data has been received */
				ulTurbRpm = ConvertSensorDataForNN(Dat.Sensor, (void*)&(Dat.Data), (void*)&(Dat.CalBias) );
				break;
			default:
				break;
		}
		if(rxdsensflags == 7){	/* Has all 3 values been received? */
			rxdsensflags = 0;

			if( PitchSysMode == PITSYS_MODE_AUTO ){
				ANNWriteValues(ulPitch, ulWspd, ulTurbRpm);	/* Write to the neural network IP core */
				vTaskDelay(4);	/* Give the core the chance to process the inputs*/
				Cmd = ANNReadCommand();
				PitchCmdDone = 0;	/* A command has been issued; don't send another one until Pitch's done */
				Sent = 1;
				if( ulPitch < 80  ){
					if(Cmd & PitchUp){
						xQueueSend( xQueueCan, &PPlusPkt, 0);
						Sent = 0;
					}
					else if(Cmd & PitchDown){
						xQueueSend( xQueueCan, &PMinusPkt, 0);
						Sent = 0;
					}
				}
				else{
					xQueueSend( xQueueCan, &PMinusPkt, 0);
				}
			}

#ifdef DEBUG_NN_VAL_PRINTS
			xil_printf("P: %d, W:%d, T:%d, Cmd:%d, Sent?: %d\n", ulPitch, ulWspd, ulTurbRpm, Cmd, Sent);
#endif
		}
	}
}


/*-----------------------------------------------------------*/
static void prvSdManTask( void *pvParameters )
/*
* \brief    Controls whether the SdWriteTask can write to a
*           file or not; it can if a filesystem has been mounted.
*           The filesystem is mounted when logging has been requested
*           on the steering wheel.
*
*/
{
	static u32 oNoticeVal = 0, oIsMounted = 0, Res;
	static sCanPacket_t Pkt = {ACQ_ACK, EMPTY_CAN_MSG, PublicLow};

	/* Take the SD card mutex semaphore and block the SD write task.
	 * Wait for the telemetry acquisition signal before mounting the SD card.
	 * Shutting the system down without dismounting it will corrupt the disk */
	xSemaphoreTake(xSdMutex, portMAX_DELAY);

	for( ;; ){

		Res = 0;
		xTaskNotifyWait(0, 1, &oNoticeVal, portMAX_DELAY);

		if( (oNoticeVal == SD_NOTICE) & (!oIsMounted)){
			Res = ulMountFs(&fatfs, &file);
			if(Res) oIsMounted = 2;
			else Res = ulOpenFile(&file);

			if(!Res){
				/* Let the steering know its mounted */
				xQueueSend(xQueueCan, (void *)&Pkt, 0);
				oIsMounted = 1;
				/* Allow the Sd write task to use the peripheral */
				HaltSdWrite ^= 1;	/* Block/Unblock dataflow to the SdWrite task */
				xSemaphoreGive(xSdMutex);
			}
		}

		else if( (oNoticeVal == SD_NOTICE) & (oIsMounted) ){
			xSemaphoreTake(xSdMutex, portMAX_DELAY);
			Res = ulCloseFiles(&file);
			if(Res) oIsMounted = 2;
			else Res = ulUnmountFs(&fatfs);
			if(!Res){
				xQueueSend(xQueueCan, (void *)&Pkt, portMAX_DELAY);
				HaltSdWrite ^= 1;	/* Block/Unblock dataflow to the SdWrite task */
				oIsMounted = 0;
			}
		}

	}
}


/*-----------------------------------------------------------*/
static void vTimerCallback( TimerHandle_t pxTimer )
/*
* \brief    Services the two software timer interrupts. Their interrupt
*           period is configured upon creation, in the main().
*/
{
	long lTimerId;
	static u8 usXmitTmrCntr;
	static eXmitCmd_t eXmitCmd = NoCmd;
	configASSERT( pxTimer );

	lTimerId = ( long ) pvTimerGetTimerID( pxTimer );

	if(lTimerId == ACQ_TIMER_ID){
		/* Wake up sensor reading tasks */
		xSemaphoreGive(xAcqSem);
	}

	if(lTimerId == DATXMIT_TIMER_ID){
		usXmitTmrCntr++;
		/* Is there something to transmit? */
		if( !(usXmitTmrCntr % CAN_XMIT_CNTS) ){
#ifdef DEBUG_TASK_PRINTS
			xil_printf("CANXMIT\n");
#endif
			eXmitCmd |= CanXmit;
		}
		if( !(usXmitTmrCntr % SD_WRITE_CNTS) ){
#ifdef DEBUG_TASK_PRINTS
			xil_printf("SDW\n");
#endif
			eXmitCmd |= SdWrite;
		}
		if( !(usXmitTmrCntr % NN_UPDATE_CNTS) ){
#ifdef DEBUG_TASK_PRINTS
			xil_printf("NNUPDT\n");
#endif
			eXmitCmd |= NNUpdate;
		}
		if( !(usXmitTmrCntr % LORA_XMIT_CNTS) ){
#ifdef DEBUG_TASK_PRINTS
			xil_printf("LORA_XMIT\n");
#endif
			eXmitCmd |= LoRaXmit;
		}
		if( !(usXmitTmrCntr % LORA_XMIT_CNTS) ){
			eXmitCmd |= SerialXmit;
#ifdef DEBUG_TASK_PRINTS
			xil_printf("SERIAL_XMIT\n");
#endif
		}
		if( eXmitCmd > NoCmd){
			/* Notify the acquisition managing task that a transmission is pending */
#ifdef DEBUG_ENABLE_ACQ_MAN
			xTaskNotify(xAcqManTask, (u32) eXmitCmd, eSetBits);
#endif
		}
		if(usXmitTmrCntr == RST_UPON){
			usXmitTmrCntr = NoCmd;
		}
	}

}


