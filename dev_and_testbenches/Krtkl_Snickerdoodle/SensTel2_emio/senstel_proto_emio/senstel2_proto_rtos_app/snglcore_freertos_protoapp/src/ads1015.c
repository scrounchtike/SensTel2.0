/*
 * ads1015.c
 *
 *  Created on: Apr 7, 2018
 *      Author: Jerome Pare-Lepine, mostly taken from Adafruit's example codebase
 */

#include "xil_types.h"
#include "ads1015.h"
#include "xparameters.h"




/*
 * @brief	Read an ADC value using the ADS1015 Adafruit breakout through i2c
 */
s16 readADCSingleEnded(XIicPs *inst, u32 ZynqIicAddress, u8 channel){
	adsGain_t gain = GAIN_ONE;
	u16 config = 0;
	u8 w_value[2];
	u8 r_value[2];


	// Set to default values
	config = ADS1015_REG_CONFIG_CQUE_NONE    | // Disable the comparator (default val)
						ADS1015_REG_CONFIG_CLAT_NONLAT  | // Non-latching (default val)
						ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
						ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
						ADS1015_REG_CONFIG_DR_1600SPS   | // 1600 samples per second (default)
						ADS1015_REG_CONFIG_MODE_SINGLE; // Single-shot mode (default)
	// Set PGA/Voltage range
	config |= gain;

	// Select a single input channel (can also be setup as differential)
	switch (channel)
	{
		case (0):
		  config |= ADS1015_REG_CONFIG_MUX_SINGLE_0;
		  break;
		case (1):
		  config |= ADS1015_REG_CONFIG_MUX_SINGLE_1;
		  break;
		case (2):
		  config |= ADS1015_REG_CONFIG_MUX_SINGLE_2;
		  break;
		case (3):
		  config |= ADS1015_REG_CONFIG_MUX_SINGLE_3;
		  break;
	}

	// Set 'start single-conversion' bit
	config |= ADS1015_REG_CONFIG_OS_SINGLE;

	// Dividing the config value into 2 bytes
	w_value[0] = (u8) config & 0x00FF;
	w_value[1] = (u8) ((config & 0xFF00) >> 8);

	I2C_write(inst, XPAR_XIICPS_1_DEVICE_ID, ADS1015_ADDRESS, ADS1015_REG_POINTER_CONFIG, 2, w_value);

	// Wait for the conversion to be complete
	//delay(m_conversionDelay);
	for(int i = 0; i < 100000; i++){};	// Makeshift delay, may need adjusting TODO: Swap for real delay

	// Read the conversion results
	// Shift 12-bit results right 4 bits for the ADS1015

	I2C_read(inst, XPAR_XIICPS_1_DEVICE_ID, ADS1015_ADDRESS, ADS1015_REG_POINTER_CONVERT, r_value);
//	*read_value = RxBuffer[0] | (RxBuffer[1] << 8);
	return ( (s16) r_value[1] | ( ( (s16) r_value[0] ) << 8) ) >> 4;
//	return readRegister(m_i2cAddress, ADS1015_REG_POINTER_CONVERT) >> m_bitShift;
}


