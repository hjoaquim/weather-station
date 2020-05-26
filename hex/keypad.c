#include <xc.h>
#include <stdio.h>         // for sprintf
#include <string.h>


#include "keypad.h"
#include "uart.h"

void initKeypad() {

	TRISDbits.TRISD0 = 1;//setting the PORTD bits as input
	TRISDbits.TRISD1 = 1;
	TRISDbits.TRISD2 = 1;
	TRISDbits.TRISD3 = 1;

	TRISBbits.TRISB0 = 0;//settinh the PORTB bits as output
	TRISBbits.TRISB1 = 0;
	TRISBbits.TRISB2 = 0;

	PORTDbits.RD0 = 1;//setting the PORTD bits
	PORTDbits.RD1 = 1;
	PORTDbits.RD2 = 1;
	PORTDbits.RD3 = 1;

	PORTBbits.RB0 = 0;//settinG the PORTB bits
	PORTBbits.RB1 = 0;
	PORTBbits.RB2 = 0;

}

void delayin(long int t) {
	int i = 0;
	for (i; i < t; i++)
		;
}

char keypadScanner() {

	PORTBbits.RB0 = 0;
	PORTBbits.RB1 = 1;
	PORTBbits.RB2 = 1;
	if (PORTDbits.RD0 == 0) {
		delayin(100);
			while (PORTDbits.RD0 == 0);
		return '1';
	}
	if (PORTDbits.RD1 == 0) {
		delayin(100);
			while (PORTDbits.RD1 == 0);
		return '4';
	}
	if (PORTDbits.RD2 == 0) {
		delayin(100);
			while (PORTDbits.RD2 == 0);
		return '7';
	}
	if (PORTDbits.RD3 == 0) {
		delayin(100);
			while (PORTDbits.RD3 == 0);
		return '*';
	}


	PORTBbits.RB0 = 1;
	PORTBbits.RB1 = 0;
	PORTBbits.RB2 = 1;
	if (PORTDbits.RD0 == 0) {
		delayin(100);
			while (PORTDbits.RD0 == 0);
		return '2';
	}
	if (PORTDbits.RD1 == 0) {
		delayin(100);
			while (PORTDbits.RD1 == 0);
		return '5';
	}
	if (PORTDbits.RD2 == 0) {
		delayin(100);
			while (PORTDbits.RD2 == 0);
		return '8';
	}
	if (PORTDbits.RD3 == 0) {
		delayin(100);
			while (PORTDbits.RD3 == 0);
		return '0';
	}

	PORTBbits.RB0 = 1;
	PORTBbits.RB1 = 1;
	PORTBbits.RB2 = 0;
	if (PORTDbits.RD0 == 0) {
		delayin(100);
			while (PORTDbits.RD0 == 0);
		return '3';
	}
	if (PORTDbits.RD1 == 0) {
		delayin(100);
			while (PORTDbits.RD1 == 0);
		return '6';
	}
	if (PORTDbits.RD2 == 0) {
		delayin(100);
			while (PORTDbits.RD2 == 0);
		return '9';
	}
	if (PORTDbits.RD3 == 0) {
		delayin(100);
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


int password() {
	char user_input[5];
	int i;
	char password[5] = "6666";
	char str_conf[] = "Password correta!!";
	char str_neg[] = "Password incorreta!!";
	char init[] = "Introduza Password!!!";

	initKeypad();

	uart_writeText(init);
	
	for (i = 0; i < 4; i++) {
		user_input[i] = pressedKey();
	}
	user_input[4] = '\0';

	if (strcmp(password, user_input)) {

		uart_writeText(str_conf);
		delayin(100);
		return 1;
	}

	uart_writeText(str_neg);

	return 0;

}