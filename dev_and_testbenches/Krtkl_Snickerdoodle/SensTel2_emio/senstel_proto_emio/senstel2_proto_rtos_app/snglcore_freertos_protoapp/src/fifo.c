/*
 * fifo.c
 *
 *  Created on: May 15, 2018
 *      Author: Jerome Pare-Lepine, general implementation found from the web
 */


//==============================================================================
// INCLUDES
//==============================================================================
#include "fifo.h"


//==============================================================================
// FUNCTION DEFINITIONS
//==============================================================================
void fifo_init(sFifo_t * f, char * buf, int size){
     f->head = 0;
     f->tail = 0;
     f->size = size;
     f->buf = buf;
}


int fifo_read(sFifo_t * f, void * buf, int nbytes){
     int i;
     char * p;
     p = buf;
     for(i=0; i < nbytes; i++){
          if( f->tail != f->head ){ //see if any data is available
               *p++ = f->buf[f->tail];  //grab a byte from the buffer
               f->tail++;  //increment the tail
               if( f->tail == f->size ){  //check for wrap-around
                    f->tail = 0;
               }
          } else {
               return i; //number of bytes read
          }
     }
     return nbytes;
}

int fifo_write(sFifo_t * f, const void * buf, int nbytes){
int i;
const char * p;
p = buf;
	for(i=0; i < nbytes; i++){
	   //first check to see if there is space in the buffer
	   if( (f->head + 1 == f->tail) ||
			( (f->head + 1 == f->size) && (f->tail == 0) )){
			 return i; //no more room
	   } else {
		   f->buf[f->head] = *p++;
		   f->head++;  //increment the head
		   if( f->head == f->size ){  //check for wrap-around
				f->head = 0;
		   }
	   }
	}
	return nbytes;
}

void fifo_reset(sFifo_t * f){
    f->head = 0;
    f->tail = 0;
}

