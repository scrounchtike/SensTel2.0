/*
 * i2c.c
 *
 *  Created on: Apr 7, 2018
 *      Author: Jerome Pare-Lepine, inspired by Xilinx I2C examples
 */

#include "i2c.h"

int I2C_write(XIicPs *i2cinst, u32 ZynqIicAddress, u8 slave_address,	\
				u8 register_offset, u8 byte_count, u8 *write_values)
/*
* \brief       Use the Zynq IIC Controller to write a value to a
*              MAX44000 register at a given offset
*
* \param[in]   ZynqIicAddress    - address of the I2C Controller
* \param[in]   slave_address     - address of the slave peripheral to read from
* \param[in]   register_offset   - offset of register inside the MAX44000
* \param[in]   write_value       - value to be written to MAX44000 register
*
* \return      XST_SUCCESS if operation succeeded
* 			   XST_INVALID_PARAM if the byte count param is larger than the TxBuffer size
*/
{
	int Status = XST_SUCCESS;

	if(byte_count > TX_BUFFER_SZ - 1){
		Status = XST_INVALID_PARAM;
		return Status;
	}

	u8 TxBuffer[TX_BUFFER_SZ]; // Only need this to be size 2, but making larger for future use

	TxBuffer[0] = register_offset;  // Offset of register to write

	for(int i = 0; i < byte_count; i++){
		TxBuffer[i + 1] = write_values[i];
	}

//	TxBuffer[1] = write_value;  // value to write there
	/* TODO:
	 *  Add code to send multiple bytes:
	 *  - Setup function interface to receive multiple tx data bytes;
	 *  - Put, in TxBuffer, write register offst and all the data bytes;
	 *  - Send to the slave address & specified register all the data bytes
	 *  Old: The first byte of TxBuffer contains the offset to the register
	 *  inside the MAX44000. The second byte contains the data to be
	 *  written to that register. If the transfer fails, then
	 *  set Status to XST_FAILURE
	 */
	Status = XIicPs_MasterSendPolled(i2cinst, TxBuffer, 3, slave_address);
	if (Status != XST_SUCCESS) return XST_FAILURE;
	//Wait until bus is idle to start another transfer.
	while (XIicPs_BusIsBusy(i2cinst)) {/* NOP */}

	return(Status);
}

int I2C_read(XIicPs *i2cinst, u32 ZynqIicAddress, u8 slave_address, u8 register_offset, u8 *read_value)
/*
* \brief       Use the Zynq IIC Controller to read a value from a
*              slave register at a given offset
*
* \param[in]   ZynqIicAddress    - address of the I2C Controller
* \param[in]   slave_address     - address of the slave peripheral to read from
* \param[in]   register_offset   - offset of register inside the MAX44000
* \param[in]   *read_value       - pointer to data read from MAX44000 register
*
* \return      XST_SUCCESS if operation succeeded
*/
{
	int Status = XST_SUCCESS, i;
	u8 TxBuffer[3];
	u8 RxBuffer[2];

	TxBuffer[0] = register_offset;
	Status = XIicPs_MasterSendPolled(i2cinst, TxBuffer, 1, slave_address);
	if (Status != XST_SUCCESS) return XST_FAILURE;
	//Wait until bus is idle to start another transfer.
	while (XIicPs_BusIsBusy(i2cinst)) {/* NOP */}


	Status = XIicPs_MasterRecvPolled(i2cinst, read_value, 2, slave_address);
	if (Status != XST_SUCCESS)
		return XST_FAILURE;

	if(Status==XST_SUCCESS)

	for(i = 0; i < 100000; i++){};
	return(Status);
}

void InitI2CPeripherals(XIicPs *i2cinst, u32 Baseaddress)
{
	XIicPs_Config *Config;

	Config = XIicPs_LookupConfig(Baseaddress);
	XIicPs_CfgInitialize(i2cinst, Config, Config->BaseAddress);
	XIicPs_SetSClk(i2cinst, I2C_SPEED);
}
