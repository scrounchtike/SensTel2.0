/*
 * fifo.h
 *
 *  Created on: May 15, 2018
 *      Author: Chinook-ELE
 */

#ifndef SRC_FIFO_H_
#define SRC_FIFO_H_

typedef struct{
     char * buf;
     int head;
     int tail;
     int size;
}sFifo_t;

void fifo_init(sFifo_t * f, char * buf, int size);
int fifo_read(sFifo_t * f, void * buf, int nbytes);
int fifo_write(sFifo_t * f, const void * buf, int nbytes);
void fifo_reset(sFifo_t * f);

#endif /* SRC_FIFO_H_ */
