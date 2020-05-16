#include <xc.h>
#include "adc.h"

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