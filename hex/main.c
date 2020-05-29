#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

//Custom .h
#include "adc.h"
#include "uart.h"
#include "pwm.h"
#include "timer0.h"
#include "keypad.h"
#include "i2c.h"
#include "eeprom.h"

#pragma config FOSC = HS // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF // Watchdog Timer Enable bit
#pragma config PWRTE = OFF // Power-up Timer Enable bit
#pragma config BOREN = OFF // Brown-out Reset Enable bit
#pragma config LVP = OFF // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit
#pragma config CPD = OFF // Data EEPROM Memory Code Protection bit
#pragma config WRT = OFF // Flash Program Memory Write Enable bits
#pragma config CP = OFF // Flash Program Memory Code Protection bit

#define STR_MAX 50

void delayin(long int t) {
	int i = 0;
	for (i; i < t; i++)
		;
}


typedef struct _Data{
	
	int temperature;
	int humidity;
	int wind;
	
} Data;

Data s;
Data last_risk;

typedef struct _Wind{
	int n_pulse;					//n of pulses
	int time_counter;				//time
} Wind;

Wind wind;

// ***** GENERAL PURPOSE FUNCTIONS
////******************************

void init_sys(void){
	
	uart_init();
	adcInit();
	pwm_init();
	timer0_init();
	init_flags();
	
	
	TRISBbits.TRISB4 = 1; 			// RB4 button
	TRISBbits.TRISB3 = 1; 			// RB3 button
	TRISCbits.TRISC5 = 0; 			// define RC5 (heater) as output
	
	
	TRISCbits.TRISC0 = 1;			// sensor infra-vermelho -> contador de impulsos -> velocidade da ventoinha
	TRISCbits.TRISC2 = 0;           // ventoinha as output
	PORTCbits.RC2 = 1;				// ventoinha ON

	s.temperature = 0;
	s.wind = 0;
	s.humidity =0;
	
	wind.n_pulse =0;
	wind.time_counter =0;
	
	last_risk.temperature = 0;
	last_risk.wind = 0;
	last_risk.humidity =0;

	
	
}



void heater(int flag){
	if (flag == 0){
		PORTCbits.RC5 = 0;	// heater OFF
	}
	if (flag == 1){
		PORTCbits.RC5 = 1;	// heater ON
	}
}



// send updates with temperature, humidity and wind velocity to MR
// send update each minute
void sendMsg1(void){
	char msg[STR_MAX];
	
	addNewline();
	msg[0] = '\0';
	sprintf(msg,"{ \"T\": %d, \"H\": %d, \"W\": %d }", s.temperature, s.humidity, s.wind);
	uart_writeText(msg);
	delayin(300);
}

void sendMsg2(void){
	char msg[STR_MAX];
	
	addNewline();
	msg[0] = '\0';
	sprintf(msg,"{ \"Warning\" : 1, \"T\": %d, \"H\": %d, \"W\": %d }", s.temperature, s.humidity, s.wind);
	uart_writeText(msg);
	delayin(300);
}

// detect risk situation accordingly with the limit values provided
void isRisk(int temp, int hum, int wvel){
	if( s.temperature > temp && s.humidity < hum && s.wind > wvel ){
		if(last_risk.temperature != s.temperature || last_risk.humidity != s.humidity || last_risk.wind != s.wind){
			
			// activate a LED and/or buzzer to sinalize

			sendMsg2(); //send the same as in the msg1 but imidiately since it's a risk situation
			
			last_risk.temperature = s.temperature;
			last_risk.humidity = s.humidity ;
			last_risk.wind = s.wind;
		}
	}
	//deactivate LED if there is any risk
}

////******************************
////******************************

// ***** READ DATA
////**************
void temp_read(void){
	int x;
	float y;
	x = adc_read(2);
	y=(0.4814*x + 0.4706);
	s.temperature = (int)y;
}

void wind_read(void){
	s.wind = wind.n_pulse;
}

void hum_read(void){
	s.humidity = (int)(0.09862*adc_read(1));
}

void read_all(void){
	hum_read();
	temp_read();
	//wind_read();
	pwm_duty(adc_read(0));
}


////**************
////************** 

int send_flag = 0;

int main(void){
	
	init_sys();
	int heater_flag = 0;
	char user_input;
	
	//values for risk situation
	int t1= 35;
	int h1= 30;
	int w1= 300;
	
	char str[STR_MAX];

	//6666
	if (password()) {

		

		while (1) {

			
			
			read_all();
			isRisk(t1, h1, w1);


			if (!PORTBbits.RB3) {		// RB3 button pressed --> heater

				while (!PORTBbits.RB3) {
					delayin(2000);


				}

				if (heater_flag == 1) {
					heater_flag = 0;
					heater(heater_flag);


				}

				else {
					heater_flag = 1;
					heater(heater_flag);


				}
			}

			if (send_flag == 1) {
				sendMsg1();
				send_flag = 0;


			}
			else{
				
				
				user_input = uart_read();
				switch(user_input){
					case 'L': t1 = 25; h1= 40; w1=50;break;
					case 'M': t1 = 30; h1= 30; w1=150;break;
					case 'H': t1 = 35; h1= 20; w1=300;break;
				}
				
				sprintf(str,"\nnew values\n t= %d ; h= %d, w=%d\n", h1, t1, w1);
				uart_writeText(str);
				
			}
		}
	}
	
}


int last_val = 0;
void __interrupt() interrupt_service() {

	if (INTF == 1) {
		//inerrupt externo
	}
	
	if(PORTCbits.RC0 && last_val==0)
		wind.n_pulse++;
	
	last_val = PORTCbits.RC0;
	
    if(TMR0IF == 1) {
        TMR0IF = 0;
        wind.time_counter++;

        if (wind.time_counter == 58*15) {
            wind_read();
			send_flag = 1;			
			wind.time_counter=0;
			wind.n_pulse=0;
            TMR1 = 0;
            TMR0 = 0;
        }
    }
}

