#include <xc.h>
#include"eeprom.h"
#include"uart.h"


void writeToEEPROM(char *str){
    int i=0;
	
    for(i=0; str[i] != '}' ; i++){
        eeprom_write(i,str[i]);
    }
    eeprom_write(i,str[i]);
}

void readFromEEPROM(void){
    int i=0;
    char byte;

    for(i=0; byte != '}'; i++){
		
        byte = (char)eeprom_read(i);
        uart_writeChar(byte);
    }
}