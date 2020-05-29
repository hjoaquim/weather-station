#include <xc.h>
#include "i2c.h"


void i2c_Init(void)
{
	//to configure master mode 
	
  TRISC3 = 1; //SCL pin, clock
  TRISC4 = 1; //SDA pin, data
	
  SSPCON = 0b00101000;
  SSPCON2 = 0;
  SSPSTAT = 0;
  
  SSPADD = (4000000/(4*9600))-1; //clock = 100 000?????????????

  
}

void i2c_Sleep(void)
{
  while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
}

void i2c_Start(void)
{
  i2c_sleep();
  SEN = 1;
}

void i2c_Stop(void)
{
  i2c_sleep();
  PEN = 1;
}

void i2c_Restart(void)
{
  //---[ Initiate I2C Restart Condition Sequence ]---
  i2c_sleep();
  RSEN = 1;
}

char i2c_writeByte(unsigned char data)
{
  i2c_sleep();
  SSPBUF = data;
  while(!SSPIF); // Wait Until Completion
  SSPIF = 0;
  return ACKSTAT;
}
char i2c_readByte(void)
{
  //---[ Receive & Return A Byte ]---
  i2c_sleep();
  RCEN = 1; // Enable & Start Reception
  while(!SSPIF); // Wait Until Completion
  SSPIF = 0; // Clear The Interrupt Flag Bit
  i2c_sleep();
  return SSPBUF; // Return The Received Byte
}
void i2c_ACK(void)
{
  ACKDT = 0; // 0 -> ACK
  i2c_sleep();
  ACKEN = 1; // Send ACK
}
void i2c_NACK(void)
{
  ACKDT = 1; // 1 -> NACK
  i2c_sleep();
  ACKEN = 1; // Send NACK
}