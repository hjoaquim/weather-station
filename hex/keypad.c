#include <xc.h>
#include <stdio.h>         // for sprintf
#include <string.h>


#include "keypad.h"

void initKeypad() {

	TRISDbits.RD0 = 1;//setting the PORTD bits as input
	TRISDbits.RD1 = 1;
	TRISDbits.RD2 = 1;
	TRISDbits.RD3 = 1;

	TRISBbits.RB0 = 0;//settinh the PORTB bits as output
	TRISBbits.RB1 = 0;
	TRISBbits.RB2 = 0;

	PORTDbits.RD0 = 1;//setting the PORTD bits
	PORTDbits.RD1 = 1;
	PORTDbits.RD2 = 1;
	PORTDbits.RD3 = 1;

	PORTBbits.RB0 = 0;//settinG the PORTB bits
	PORTBbits.RB1 = 0;
	PORTBbits.RB2 = 0;

}

char keypadScanner() {

	PORTBbits.RB0 = 0;
	PORTBbits.RB1 = 1;
	PORTBbits.RB2 = 1;
	if (PORTDbits.RD0 == 0) {
		delayin(1000)
			while (PORTDbits.RD0 == 0);
		return '1';
	}
	if (PORTDbits.RD1 == 0) {
		delayin(1000)
			while (PORTDbits.RD1 == 0);
		return '4';
	}
	if (PORTDbits.RD2 == 0) {
		delayin(1000)
			while (PORTDbits.RD2 == 0);
		return '7';
	}
	if (PORTDbits.RD3 == 0) {
		delayin(1000)
			while (PORTDbits.RD3 == 0);
		return '*';
	}


	PORTBbits.RB0 = 1;
	PORTBbits.RB1 = 0;
	PORTBbits.RB2 = 1;
	if (PORTDbits.RD0 == 0) {
		delayin(1000)
			while (PORTDbits.RD0 == 0);
		return '2';
	}
	if (PORTDbits.RD1 == 0) {
		delayin(1000)
			while (PORTDbits.RD1 == 0);
		return '5';
	}
	if (PORTDbits.RD2 == 0) {
		delayin(1000)
			while (PORTDbits.RD2 == 0);
		return '8';
	}
	if (PORTDbits.RD3 == 0) {
		delayin(1000)
			while (PORTDbits.RD3 == 0);
		return '0';
	}

	PORTBbits.RB0 = 1;
	PORTBbits.RB1 = 1;
	PORTBbits.RB2 = 0;
	if (PORTDbits.RD0 == 0) {
		delayin(1000)
			while (PORTDbits.RD0 == 0);
		return '3';
	}
	if (PORTDbits.RD1 == 0) {
		delayin(1000)
			while (PORTDbits.RD1 == 0);
		return '6';
	}
	if (PORTDbits.RD2 == 0) {
		delayin(1000)
			while (PORTDbits.RD2 == 0);
		return '9';
	}
	if (PORTDbits.RD3 == 0) {
		delayin(1000)
			while (PORTDbits.RD3 == 0);
		return '+';
	}


	return 'n';
}

char pressedKey() {
	char key = 'n';
	while (key == 'n')
		key = keypadScanner();
	return key;
}
