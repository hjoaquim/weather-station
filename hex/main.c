#include <xc.h>
#include <stdio.h>
#include <stdlib.h>

//Custom .h
#include "adc.h"
#include "uart.h"
#include "pwm.h"

#pragma config FOSC = HS // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF // Watchdog Timer Enable bit
#pragma config PWRTE = OFF // Power-up Timer Enable bit
#pragma config BOREN = OFF // Brown-out Reset Enable bit
#pragma config LVP = OFF // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit
#pragma config CPD = OFF // Data EEPROM Memory Code Protection bit
#pragma config WRT = OFF // Flash Program Memory Write Enable bits
#pragma config CP = OFF // Flash Program Memory Code Protection bit

typedef struct _Data{
	
	int temperatura;
	int humidade;
	int v_vento;
	
} Data;

Data s;


void delayin(long int t){
	int i=0;
	for(i; i<t ;i++)
		;
}


// ***** GENERAL PURPOSE FUNCTIONS
////******************************


void init_sys(void){
	
	uart_init();
	adcInit();
	pwm_init();
	
	TRISBbits.TRISB3 = 1; 			// RB3 button
	TRISCbits.TRISC5 = 0; 			// define RC5 (heater) as output
	
	
	TRISCbits.TRISC0 = 1;			// sensor infra-vermelho -> contador de impulsos -> velocidade da ventoinha
	TRISCbits.TRISC2 = 0;           // ventoinha as output
	PORTCbits.RC2 = 1;				// ventoinha ON
	
	s.temperatura = 0;
	s.v_vento = 0;
	s.humidade =0;
	
}

void heater(int flag){
	if (flag == 0){
		PORTCbits.RC5 = 0;	// heater OFF
	}
	if (flag == 1){
		PORTCbits.RC5 = 1;	// heater ON
	}
}

////******************************
////******************************

// ***** READ DATA
////**************
void temp_read(void){
	int x,y;
	x = adc_read(2);
	y=(0.4814*x+0.4706);
	s.temperatura = y;
}

void wind_read(void){
	
}

void hum_read(void){
	s.humidade = (0.09862*adc_read(1));
}

void read_all(void){
	hum_read();
	temp_read();
	wind_read();
	pwm_duty(adc_read(0));
}


////**************
////**************
 


int main(void){

	init_sys();
	int heater_flag = 0;
	
	char str_aux[] = "\nHello world!\n";
	
	char buffer[];

	uart_writeText(str_aux);
	
	int aux=0;
	
	while (1){

		// //
		// aux = PORTCbits.RC0;
		// sprintf(buffer, "Impulsos= %d \n" , aux);
		// uart_writeText(buffer);
		// delayin(3000);
		// /
		
		read_all();
		buffer[0] = '\0';

		
		if (!PORTBbits.RB3){		// RB3 button pressed
			
			while (!PORTBbits.RB3){
				delayin(2000);
			}
			
			if(heater_flag==1){
				heater_flag =0;
				heater(heater_flag);
			}
			
			else{
				heater_flag =1;
				heater(heater_flag);
			}			
		}

		if (!PORTBbits.RB4){

			while (!PORTBbits.RB4){
			delayin(2000);
			}
			
			buffer[0] = '\0';
			sprintf(buffer, "Temperature= %d \n" , s.temperatura);
			uart_writeText(buffer);
			delayin(3000);

			buffer[0] = '\0';
			sprintf(buffer, "Humidity= %d %%\n" , s.humidade);
			uart_writeText(buffer);
			delayin(3000);
			
		}

		
	}
	
}