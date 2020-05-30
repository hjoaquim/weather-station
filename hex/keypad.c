#include <xc.h>
#include <stdio.h>         // for sprintf
#include <string.h>
#include <stdlib.h>

#include "keypad.h"
#include "uart.h"

void initKeypad() {

	TRISDbits.TRISD0 = 0;//setting the PORTD bits as output
	TRISDbits.TRISD1 = 0;
	TRISDbits.TRISD2 = 0;
	TRISDbits.TRISD3 = 0;

	TRISBbits.TRISB0 = 1;//settinh the PORTB bits as input
	TRISBbits.TRISB1 = 1;
	TRISBbits.TRISB2 = 1;

	PORTDbits.RD0 = 1;//setting the PORTD bits
	PORTDbits.RD1 = 1;
	PORTDbits.RD2 = 1;
	PORTDbits.RD3 = 1;

	PORTBbits.RB0 = 1;//settinG the PORTB bits
	PORTBbits.RB1 = 1;
	PORTBbits.RB2 = 1;

}

void delay(int t) {
	int i = 0;
	for (i; i < t; i++)
		;
}

char keypadScanner() {
	
	
	

	PORTDbits.RD0 = 0;
	PORTDbits.RD1 = 1;
	PORTDbits.RD2 = 1;
	PORTDbits.RD3 = 1;
	delay(20);
	if (PORTBbits.RB0 == 0) {
	
			while (PORTBbits.RB0 == 0);
			PORTBbits.RB0 == 1;
			return '<';

	}
	if (PORTBbits.RB1 == 0) {
			while (PORTBbits.RB1 == 0);
			PORTBbits.RB1 == 1;
		return '0';

	}
	if (PORTBbits.RB2 == 0){

			while (PORTBbits.RB2 == 0);
			PORTBbits.RB2 == 1;
		return '>';

	}

	

	PORTDbits.RD0 = 1;
	PORTDbits.RD1 = 0;
	PORTDbits.RD2 = 1;
	PORTDbits.RD3 = 1;
	delay(20);
	if (PORTBbits.RB0 == 0) {

		while (PORTBbits.RB0 == 0);
		PORTBbits.RB0 == 1;
		return '7';

	}
	if (PORTBbits.RB1 == 0) {

		while (PORTBbits.RB1 == 0);
		PORTBbits.RB1 == 1;
		return '8';

	}
	if (PORTBbits.RB2 == 0) {

		while (PORTBbits.RB2 == 0);
		PORTBbits.RB2 == 1;
		return '9';

	}



	PORTDbits.RD0 = 1;
	PORTDbits.RD1 = 1;
	PORTDbits.RD2 = 0;
	PORTDbits.RD3 = 1;	
	delay(20);
	if (PORTBbits.RB0 == 0) {

		while (PORTBbits.RB0 == 0);
		PORTBbits.RB0 == 1;
		return '4';

	}
	if (PORTBbits.RB1 == 0) {

		while (PORTBbits.RB1 == 0);
		PORTBbits.RB1 == 1;
		return '5';

	}
	if (PORTBbits.RB2 == 0) {

		while (PORTBbits.RB2 == 0);
		PORTBbits.RB2 == 1;
		return '6';

	}

	

	PORTDbits.RD0 = 1;
	PORTDbits.RD1 = 1;
	PORTDbits.RD2 = 1;
	PORTDbits.RD3 = 0;
	delay(20);

	if (PORTBbits.RB0 == 0) {

		while (PORTBbits.RB0 == 0);
		PORTBbits.RB0 == 1;
		return '1';

	}
	if (PORTBbits.RB1 == 0) {

		while (PORTBbits.RB1 == 0);
		PORTBbits.RB1 == 1;
		return '2';

	}
	if (PORTBbits.RB2 == 0) {

		while (PORTBbits.RB2 == 0);
		PORTBbits.RB2 == 1;
		return '3';

	}

	return 'n';
}

char pressedKey() {
	char key = 'n';

	while (key == 'n')
		key = keypadScanner();
	
		uart_writeChar(key);
		//uart_writeChar('+');
		delay(20);
	return key;
}


int password() {
	char user_input[5];
	int i;
	char password[5] = "6666";
	char str_conf[] = "\n{Password OK!}\n";
	char str_neg[] = "\n{Wrong password.}\n";
char init[] = "\n{Insert password:}\n";

	initKeypad();

	uart_writeText(init);

	for (i = 0; i < 4; i++) {
		user_input[i] = pressedKey();
		//uart_writeChar(user_input[i]);
	}
	user_input[4] = '\0';

	if (strcmp(password, user_input) == 0) {

		uart_writeText(str_conf);
		delay(100);
		return 1;
	}else {

	uart_writeText(str_neg);
	}
	return 0;

}