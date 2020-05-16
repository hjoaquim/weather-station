#include <xc.h>
#include <stdio.h>
#include <stdlib.h>

//Custom .h
#include "adc.h"
#include "uart.h"

#pragma config FOSC = HS // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF // Watchdog Timer Enable bit
#pragma config PWRTE = OFF // Power-up Timer Enable bit
#pragma config BOREN = OFF // Brown-out Reset Enable bit
#pragma config LVP = OFF // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit
#pragma config CPD = OFF // Data EEPROM Memory Code Protection bit
#pragma config WRT = OFF // Flash Program Memory Write Enable bits
#pragma config CP = OFF // Flash Program Memory Code Protection bit

//PWM stuff
#define _XTAL_FREQ 20000000
#define TMR2PRESCALE 4
#define PWM_FREQ 4000

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
void pwm_init (void) {
	
	// 1) Set the PWM period by writing to the PR2 register.
	// 2) Set the PWM duty cycle by writing to the CCPR1L register and CCP1CON<5:4> bits.
	// 3) Make the CCP1 pin an output by clearing the TRISC<2> bit.
	// 4) Set the TMR2 prescale value and enable Timer2 by writing to T2CON.
	// 5) Configure the CCP1 module for PWM operation.

	PR2 = (_XTAL_FREQ/(PWM_FREQ * 4 *TMR2PRESCALE)) - 1;
	
	T2CKPS0 = 1;
	T2CKPS1 = 0; 
	TMR2ON = 1; //Configure the Timer module
	
	// CCP1 -> pin 17 -> RC2
	
	CCP1M2 = 1; 
	CCP1M3 = 1;
	
}


void pwm_duty(int duty){
   
   if(duty<1023){
	//PWM Duty Cycle =(CCPR1L:CCP1CON<5:4>) * TOSC * (TMR2 Prescale Value)
    duty = ((float)duty/1023)*(_XTAL_FREQ/(PWM_FREQ*TMR2PRESCALE)); 
    CCP1X = duty & 1; //Store the 1st bit
    CCP1Y = duty & 2; //Store the 0th bit
    CCPR1L = duty>>2;// Store the remining 8 bit
  }
}


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
	s.temperatura = adc_read(2);
}

void vento_read(void){
	
}

void hum_read(void){
	s.humidade = adc_read(1);;
}

void read_all(void){
	hum_read();
	temp_read();
	vento_read();
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
			sprintf(buffer, "Humidity= %d \n" , s.humidade);
			uart_writeText(buffer);
			delayin(3000);
			
		}

		
	}
	
}