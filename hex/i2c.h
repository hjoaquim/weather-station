#ifndef I2C_H
#define	I2C_H




void i2c_Init(void);

void i2c_Sleep(void);

void i2c_Start(void);

void i2c_Stop(void);

void i2c_Restart(void);

char i2c_writeByte(unsigned char data);

char i2c_readByte(void);

void i2c_ACK(void);

void i2c_NACK(void);


#endif	/* I2C_H */