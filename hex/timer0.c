#include <xc.h>
#include "timer0.h"

// ***** TIMER_0 FUNCTIONS
////*****************

//timer0 initialization
//input: none
//output: none
void timer0_init() {
    TMR0=0;	//TMR0 interrupt is generated when the TMR0 register overflows from FFh to 00h
    
    T0CS=0; 	// bit 5 -> 0 = Internal instruction cycle clock
    T0SE=0; 	// bit 4 -> 0 = Increment on low-to-high transition on T0CKI pin 
    PSA=0;		// bit 3 -> 0 = Prescaler is assigned to the Timer0 module 
    
	//bits 0-2
	/// 111 -> TMR0 Rate= 1:256
	///		-> WDT Rate = 1:128
	PS0=1;
    PS1=1;
    PS2=1;
	
	TMR0IF = 0; 
	// The flag is set on Overflow
	// Bit TMR0IF must be cleared in software by the Timer0
	// module Interrupt Service Routine before re-enabling
	// this interrupt.
}

//counter
void timer1_init() {
	
    TMR1CS = 1;		//bit 1 -> 0 = Internal clock (FOSC/4)
    
					//timer1 input clock presclae select bits
					// 00 -> 1:1 prescale value
	T1CKPS0 = 0;
    T1CKPS1 = 0;
    
    TMR1 = 0; 		
    
    TMR1ON = 1;
}    