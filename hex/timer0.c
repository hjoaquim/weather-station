#include <xc.h>
#include "timer0.h"

// ***** TIMER_0 FUNCTIONS
////*****************

//timer0 initialization
//input: none
//output: none
void timer0_init() {
    TMR0=0;	//TMR0 interrupt is generated when the TMR0 register overflows from FFh to 00h
    
    T0CS=0;
    T0SE=0; 
    PSA=0;
    PS0=1;
    PS1=1;
    PS2=1;
}