#ifndef EEPROM_H
#define	EEPROM_H

void eeprom_writeByte(unsigned int addr, unsigned char byte);


unsigned char eeprom_readByte(unsigned int addr);

#endif	/* EEPROM_H */