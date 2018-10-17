/*
 * encoder_ad36.h
 *
 *  Created on: Mar 24, 2018
 *      Author: Jerome Pare-Lepine
 */
#include "xparameters.h"
#include "xgpiops.h"
#include <stdio.h>

#ifndef SRC_ENCODER_AD36_H_
#define SRC_ENCODER_AD36_H_


//==============================================================================
// DEFINITIONS
//==============================================================================
/* Numbers [54:...] are the numbers used to specify which EMIO pin
 * the developer wishes to use. Pins [0:53] are used to designate
 * the MIO pins.*/
#define SSI_BB_GEAR_CLK		54
#define SSI_BB_GEAR_DAT		55
#define SSI_BB_PITCH_CLK	56
#define SSI_BB_PITCH_DAT	57

/* The value used in a for loop to create a delay
 * allowing the interface circuitry to stabilize between reads */
#define	READ_DLY			110

#define PITCH_ENC_RESO		4095.0	// For a 12-bits SSI encoder
#define ROTOR_GBOX2BLADES_RATIO		1.5
#define ENC_DEGS_PER_BIT		(360.0 / PITCH_ENC_RESO)


//==============================================================================
// FUNCTION PROTOTYPES
//==============================================================================
u32 initSSIpins(XGpioPs* bankPins);

/*
 * @ brief:		Reads SSI data from an Hengstler encoder by bitbanging 2 IOs;
 * 				One is used to toggle the CLOCK line and the other is used to read
 * 				the logic levels (updated after a CLOCK line level transition) on
 * 				the incoming DATA line.
 */
u32 readPos(XGpioPs* bankPins);



#endif /* SRC_ENCODER_AD36_H_ */
