#include <xc.h>
#include <stdio.h>         // for sprintf

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



// ***** UART FUNCTIONS
////*****************

//uart2 initialization 
//input: none
//output: none
void uart_init (void){
	
	//Assinchcronous 8 bit -> high speed
	BRGH = 1; 	  //high speed
	SPBRG = 25;   //BR = 9600 at Fosc = 4 MHz
	SYNC  = 0;    // Asynchronous
    SPEN  = 1;    // Enable serial port pins
	
	//**Select 8-bit mode**//  
    TX9   = 0;    // 8-bit reception selected
    RX9   = 0;    // 8-bit reception mode selected
	
	//**Transmission & reception**//
	CREN = 1;     //Enables Continuous Reception
    TXEN = 1;     //Enables Transmission
	
}

//write char to uart
//input: char you want to write in the console
//output: none (writes to console)
void uart_writeChar(char ch){
	
	// TRMT: Transmit Shift Register Status bit
	// 1 = TSR empty
	// 0 = TSR full
	
  while(!TRMT);
  TXREG=ch;
	
}

//write text
//input: string you want to write in the console
//output: none (writes to console)
void uart_writeText(char *str){
	int i;
	for(i=0; str[i] != '\0' ; i++){ 			
		uart_writeChar(str[i]);
	}
}

//read char
//input: none
//output: readed char
char uart_read(void){
	
	/*
	RCIF: USART Receive Interrupt Flag bit
	1 = The USART receive buffer is full
	0 = The USART receive buffer is empty
	*/
	
	while(!RCIF);
	return RCREG;
	
}

//read string/text
//input: string to store readed value
//output: none
void uart_readText(char *str){
	
	int i=0;
	str[i] = uart_read(); 
	
	while(str[i] != '\n' && str[i] != '\0' && str[i]!= '\r'){
		i++;
		str[i]=uart_read();
	}
	str[i]='\0'; //adding the end of string
				 // (no need to return since it's string -> writing directly in the memory)
}

////*****************
////*****************



// ***** ADC FUNCTIONS
////*****************

//adc initialization
//input: none
//output: none
void adcInit(void){
	ADCON0=0;						// sampling freq=osc_freq/2,ADC off initially;
	ADCON1=0;						// all pins as analog
	ADCON0bits.ADON=1;				// ADC ON
}

//digital (read) and convertition to analog
//input: int -> channel to read
//output: measured value in digital
int adc_read(int channel){
	ADCON1bits.ADFM =1;							// right shifted results
	
	ADCON0bits.CHS=channel;						// get channel to convert
	
	ADCON0bits.GO_nDONE=1;           			// Start ADC conversion
	while(ADCON0bits.GO_nDONE);            		// Wait for the conversion to complete
												// GO_DONE bit will be cleared once conversion is complete

	return((ADRESH<<8) + ADRESL);  				// return right justified 10-bit result
												//ADRESH -> A/D Result High Register
												//ADRESL -> A/D Result Low Register 													
}
////*********************
// **********************


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
	
	char outro[] = "\nentra na func\n";
	
	if (flag == 0){
		PORTCbits.RC5 = 0;	// heater OFF
	}
	if (flag == 1){
		PORTCbits.RC5 = 1;	// heater ON
	}
	
	uart_writeText(outro);
}

////******************************
////******************************

// ***** READ DATA
////**************
void temp_read(void){
	s.temperatura = (5* adc_read(2) * 100/1023);
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

		////
		aux = PORTCbits.RC0;
		sprintf(buffer, "Impulsos= %d \n" , aux);
		uart_writeText(buffer);
		delayin(3000);
		///
		
		read_all();
		buffer[0] = '\0';

		
		if (!PORTBbits.RB3){		// RB3 button pressed
			delayin(2000);
			if(heater_flag){
				heater_flag =0;
				heater(heater_flag);
			}
			else{
				heater_flag =1;
				heater(heater_flag);
			}
			
			
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
