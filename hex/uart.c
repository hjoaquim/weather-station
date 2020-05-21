#include <xc.h>
#include "uart.h"

// ***** UART FUNCTIONS
////*****************

//uart2 initialization 
//input: none
//output: none
void uart_init (void){
	
	//Assinchcronous 8 bit -> high speed
	BRGH = 1; 	  //high speed
	SPBRG = 25;   //BR = 9600 at Fosc = 4 MHz
	SYNC  = 0;    // Asynchronous
    SPEN  = 1;    // Enable serial port pins
	
	//**Select 8-bit mode**//  
    TX9   = 0;    // 8-bit reception selected
    RX9   = 0;    // 8-bit reception mode selected
	
	//**Transmission & reception**//
	CREN = 1;     //Enables Continuous Reception
    TXEN = 1;     //Enables Transmission
	
}

//write char to uart
//input: char you want to write in the console
//output: none (writes to console)
void uart_writeChar(char ch){
	
	// TRMT: Transmit Shift Register Status bit
	// 1 = TSR empty
	// 0 = TSR full
	
  while(!TRMT);
  TXREG=ch;
	
}

//write text
//input: string you want to write in the console
//output: none (writes to console)
void uart_writeText(char *str){
	int i;
	for(i=0; str[i] != '\0' ; i++){ 			
		uart_writeChar(str[i]);
	}
}

//read char
//input: none
//output: readed char
char uart_read(void){
	
	/*
	RCIF: USART Receive Interrupt Flag bit
	1 = The USART receive buffer is full
	0 = The USART receive buffer is empty
	*/
	
	while(!RCIF);
	return RCREG;
	
}

//read string/text
//input: string to store readed value
//output: none
void uart_readText(char *str){
	
	int i=0;
	str[i] = uart_read(); 
	
	while(str[i] != '\n' && str[i] != '\0' && str[i]!= '\r'){
		i++;
		str[i]=uart_read();
	}
	str[i]='\0'; //adding the end of string
				 // (no need to return since it's string -> writing directly in the memory)
}


void addNewline(void) {
    uart_writeChar('\n');
	uart_writeChar('\r');
}


