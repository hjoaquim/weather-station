#include <xc.h>
#include "pwm.h"

//PWM stuff
#define _XTAL_FREQ 20000000
#define TMR2PRESCALE 4
#define PWM_FREQ 4000

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