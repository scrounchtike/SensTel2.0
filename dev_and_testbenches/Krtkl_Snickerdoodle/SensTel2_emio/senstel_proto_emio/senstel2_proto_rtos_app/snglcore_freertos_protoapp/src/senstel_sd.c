/*
 * senstel_sd.c
 *
 *  Created on: May 8, 2018
 *      Author: Chinook-ELE
 */

#include <stdio.h>
#include "xparameters.h"	/* SDK generated parameters */
#include "xsdps.h"		/* SD device driver */
#include "diskio.h"
#include "xil_printf.h"
#include "ff.h"
#include "senstel_sd.h"
#include "senstel_sd_filesys_config.h"

void vGetDbConfig(xSdDb_t *FsDatabase)
{
	FsDatabase->ulFilesOpen = 0;
	FsDatabase->ulBytesWritten = 0;
	//TODO: Add session start timestamp in fname and dirname
//	sprintf(fname, ACQ_FNAME);
//	FsDatabase->xFsFiles->fname = fname;
	//	FsDatabase->xFsFiles->xAcqFileName = ACQ_FNAME;
//	sprintf(FsDatabase->xFsFiles->xAcqFileName, ACQ_FNAME);
	FsDatabase->xFsFiles->xAcqFileName = ACQ_FNAME;
//	sprintf(FsDatabase->xFsFiles->xLogFileName, LOG_FNAME);
	FsDatabase->xFsFiles->xLogFileName = LOG_FNAME;
//	sprintf(FsDatabase->xPath, PATH_NAME);
	FsDatabase->xPath = PATH_NAME;
//	sprintf(FsDatabase->xDirName, DIR_NAME);
	FsDatabase->xFilesDirName = DIR_NAME;
}

int ulMountFs(FATFS *ffs, FIL *file)
{
	FRESULT Res;
	BYTE ini_s;

	ini_s = disk_initialize(XPAR_PS7_SD_1_DEVICE_ID);

	/*
	 * To test logical drive 0, Path should be "0:/"
	 * For logical drive 1, Path should be "1:/"
	 */
	TCHAR *Path = "0:/";

	/*
	 * Register volume work area, initialize device
	 */
	Res = f_mount(ffs,
			Path,
			1);

	if (Res != FR_OK) {
		return XST_FAILURE;
	}

	/*
	 * Path - Path to logical driver, 0 - FDISK format.
	 * 0 - Cluster size is automatically determined based on Vol size.
	 */
	Res = f_mkfs(Path, 0, 0);
	if (Res != FR_OK) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int ulOpenFile(FIL *file)
{
	FRESULT Res;
	TCHAR *fname = "ACQ1.txt";

	Res = f_open(
			file,
			fname,
			FA_CREATE_ALWAYS | FA_WRITE | FA_READ
			);

	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Pointer to beginning of file.
	 */
	Res = f_lseek(file, 0);
	if (Res) {
		return XST_FAILURE;
	}


	return XST_SUCCESS;
}

//TODO: Format data buffer here or have them submit me a string
//int ulDumpToFile(FIL *File, char* buffer, u16 buflength)
int ulDumpToFile(FIL *File, u32 *data)
{
	FRESULT Res;

	/*
	 * Write data to file.
	 */
	Res = f_printf(File, "This is: %d", &data);
//	Res = f_write(File, (const void*)SourceAddress, FileSize,
//			&NumBytesWritten);
	if (Res < 0) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int ulCloseFiles(FIL *file)
{
	FRESULT Res;

	Res = f_close(file);
	if(Res < 0) return XST_FAILURE;
	return XST_SUCCESS;
}


int ulUnmountFs(FATFS *ffs)
{
	FRESULT Res;

	Res = f_mount(NULL, "", 1);
	if (Res < 0) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
