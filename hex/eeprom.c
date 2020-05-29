#include <xc.h>
#include"eeprom.h"
#include"i2c.h"
#include"uart.h"

#define EEPROM_Addr_R 0xA1
#define EEPROM_Addr_W 0xA0

void eeprom_writeByte(unsigned int addr, unsigned char byte)
{
  i2c_Start();
 
  // Wait Until EEPROM Is IDLE
  while(i2c_writeByte(EEPROM_Addr_W))
    i2c_Restart();
 
  i2c_writeByte(addr>>8);//EEPROM_Addr_W???????
  i2c_writeByte((unsigned char)addr);
  i2c_writeByte(byte);
  i2c_Stop();
}


unsigned char eeprom_readByte(unsigned int addr)
{
  unsigned char byte = 0;
  i2c_Start();
 
  // Wait Until EEPROM Is IDLE
  while(i2c_writeByte(EEPROM_Addr_W))
    i2c_Restart();
 
  i2c_writeByte(addr>>8);//desaparece?

  i2c_writeByte((unsigned char)addr);
  i2c_Restart();
 
  i2c_writeByte(EEPROM_Addr_R);
  byte = i2c_readByte();
  
  i2c_NACK();
  i2c_Stop();
 
  return byte;
}

void writeToEEPROM(char *str){
    int i=0;
    for(i=0; str[i] != '}' ; i++){
        eeprom_writeByte(i,str[i]);
    }
    eeprom_writeByte(i,str[i]);
}

void readFromEEPROM(void){
    int i=0;
    char a;
    for(i=0; a != '}'; i++){
        a = (char)eeprom_readByte(i);
        uart_writeChar(a);
    }
}