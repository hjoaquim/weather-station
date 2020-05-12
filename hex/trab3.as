opt subtitle "Microchip MPLAB XC8 C Compiler v2.10 (Free license) build 20190730164152 Og9 "

opt pagewidth 120

	opt flic

	processor	16F877A
opt include "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\16f877a.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 54 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
INDF equ 00h ;# 
# 61 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR0 equ 01h ;# 
# 68 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PCL equ 02h ;# 
# 75 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
STATUS equ 03h ;# 
# 161 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
FSR equ 04h ;# 
# 168 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTA equ 05h ;# 
# 218 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTB equ 06h ;# 
# 280 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTC equ 07h ;# 
# 342 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTD equ 08h ;# 
# 404 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTE equ 09h ;# 
# 436 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 456 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
INTCON equ 0Bh ;# 
# 534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 596 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 636 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 643 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 650 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 657 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
T1CON equ 010h ;# 
# 732 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR2 equ 011h ;# 
# 739 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
T2CON equ 012h ;# 
# 810 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPBUF equ 013h ;# 
# 817 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPCON equ 014h ;# 
# 887 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR1 equ 015h ;# 
# 894 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR1L equ 015h ;# 
# 901 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR1H equ 016h ;# 
# 908 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCP1CON equ 017h ;# 
# 966 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
RCSTA equ 018h ;# 
# 1061 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TXREG equ 019h ;# 
# 1068 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1075 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1082 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1089 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1096 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1154 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1161 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1257 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1327 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISA equ 085h ;# 
# 1377 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISB equ 086h ;# 
# 1439 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISC equ 087h ;# 
# 1501 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISD equ 088h ;# 
# 1563 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISE equ 089h ;# 
# 1620 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1682 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1722 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PCON equ 08Eh ;# 
# 1756 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1818 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PR2 equ 092h ;# 
# 1825 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPADD equ 093h ;# 
# 1832 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 2001 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TXSTA equ 098h ;# 
# 2082 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SPBRG equ 099h ;# 
# 2089 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2159 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2224 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2231 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2290 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2297 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2304 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2311 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2318 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2363 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EECON2 equ 018Dh ;# 
# 54 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
INDF equ 00h ;# 
# 61 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR0 equ 01h ;# 
# 68 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PCL equ 02h ;# 
# 75 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
STATUS equ 03h ;# 
# 161 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
FSR equ 04h ;# 
# 168 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTA equ 05h ;# 
# 218 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTB equ 06h ;# 
# 280 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTC equ 07h ;# 
# 342 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTD equ 08h ;# 
# 404 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PORTE equ 09h ;# 
# 436 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 456 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
INTCON equ 0Bh ;# 
# 534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 596 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 636 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 643 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 650 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 657 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
T1CON equ 010h ;# 
# 732 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TMR2 equ 011h ;# 
# 739 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
T2CON equ 012h ;# 
# 810 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPBUF equ 013h ;# 
# 817 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPCON equ 014h ;# 
# 887 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR1 equ 015h ;# 
# 894 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR1L equ 015h ;# 
# 901 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR1H equ 016h ;# 
# 908 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCP1CON equ 017h ;# 
# 966 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
RCSTA equ 018h ;# 
# 1061 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TXREG equ 019h ;# 
# 1068 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1075 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1082 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1089 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1096 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1154 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1161 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1257 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1327 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISA equ 085h ;# 
# 1377 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISB equ 086h ;# 
# 1439 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISC equ 087h ;# 
# 1501 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISD equ 088h ;# 
# 1563 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TRISE equ 089h ;# 
# 1620 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1682 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1722 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PCON equ 08Eh ;# 
# 1756 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1818 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
PR2 equ 092h ;# 
# 1825 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPADD equ 093h ;# 
# 1832 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 2001 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
TXSTA equ 098h ;# 
# 2082 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
SPBRG equ 099h ;# 
# 2089 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2159 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2224 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2231 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2290 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2297 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2304 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2311 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2318 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2363 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic16f877a.h"
EECON2 equ 018Dh ;# 
	FNCALL	_main,_delayin
	FNCALL	_main,_heater
	FNCALL	_main,_init_sys
	FNCALL	_main,_read_all
	FNCALL	_main,_sprintf
	FNCALL	_main,_uart_writeText
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_read_all,_adc_read
	FNCALL	_read_all,_hum_read
	FNCALL	_read_all,_pwm_duty
	FNCALL	_read_all,_temp_read
	FNCALL	_read_all,_vento_read
	FNCALL	_temp_read,___awdiv
	FNCALL	_temp_read,___wmul
	FNCALL	_temp_read,_adc_read
	FNCALL	_pwm_duty,___awtoft
	FNCALL	_pwm_duty,___ftdiv
	FNCALL	_pwm_duty,___ftmul
	FNCALL	_pwm_duty,___fttol
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	___awtoft,___ftpack
	FNCALL	_hum_read,_adc_read
	FNCALL	_init_sys,_adcInit
	FNCALL	_init_sys,_pwm_init
	FNCALL	_init_sys,_uart_init
	FNCALL	_heater,_uart_writeText
	FNCALL	_uart_writeText,_uart_writeChar
	FNROOT	_main
	global	heater@F948
	global	main@F961
psect	idataBANK1,class=CODE,space=0,delta=2,noexec
global __pidataBANK1
__pidataBANK1:
	file	"trab3.c"
	line	210

;initializer for heater@F948
	retlw	0Ah
	retlw	065h
	retlw	06Eh
	retlw	074h
	retlw	072h
	retlw	061h
	retlw	020h
	retlw	06Eh
	retlw	061h
	retlw	020h
	retlw	066h
	retlw	075h
	retlw	06Eh
	retlw	063h
	retlw	0Ah
	retlw	low(0)
	line	257

;initializer for main@F961
	retlw	0Ah
	retlw	048h
	retlw	065h
	retlw	06Ch
	retlw	06Ch
	retlw	06Fh
	retlw	020h
	retlw	077h
	retlw	06Fh
	retlw	072h
	retlw	06Ch
	retlw	064h
	retlw	021h
	retlw	0Ah
	retlw	low(0)
	global	_dpowers
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\doprnt.c"
	line	358
_dpowers:
	retlw	01h
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	064h
	retlw	0

	retlw	0E8h
	retlw	03h

	retlw	010h
	retlw	027h

	global __end_of_dpowers
__end_of_dpowers:
	global	_dpowers
	global	_s
	global	_PORTBbits
_PORTBbits	set	0x6
	global	_PORTCbits
_PORTCbits	set	0x7
	global	_CCPR1L
_CCPR1L	set	0x15
	global	_ADRESH
_ADRESH	set	0x1E
	global	_ADCON0bits
_ADCON0bits	set	0x1F
	global	_ADCON0
_ADCON0	set	0x1F
	global	_TXREG
_TXREG	set	0x19
	global	_CCP1Y
_CCP1Y	set	0xBC
	global	_CCP1X
_CCP1X	set	0xBD
	global	_CCP1M3
_CCP1M3	set	0xBB
	global	_CCP1M2
_CCP1M2	set	0xBA
	global	_TMR2ON
_TMR2ON	set	0x92
	global	_T2CKPS1
_T2CKPS1	set	0x91
	global	_T2CKPS0
_T2CKPS0	set	0x90
	global	_CREN
_CREN	set	0xC4
	global	_RX9
_RX9	set	0xC6
	global	_SPEN
_SPEN	set	0xC7
	global	_TRISCbits
_TRISCbits	set	0x87
	global	_TRISBbits
_TRISBbits	set	0x86
	global	_PR2
_PR2	set	0x92
	global	_ADRESL
_ADRESL	set	0x9E
	global	_ADCON1bits
_ADCON1bits	set	0x9F
	global	_ADCON1
_ADCON1	set	0x9F
	global	_SPBRG
_SPBRG	set	0x99
	global	_TRMT
_TRMT	set	0x4C1
	global	_TXEN
_TXEN	set	0x4C5
	global	_TX9
_TX9	set	0x4C6
	global	_SYNC
_SYNC	set	0x4C4
	global	_BRGH
_BRGH	set	0x4C2
	
STR_2:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	61	;'='
	retlw	32	;' '
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	10
	retlw	0
psect	strings
	
STR_1:	
	retlw	73	;'I'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	117	;'u'
	retlw	108	;'l'
	retlw	115	;'s'
	retlw	111	;'o'
	retlw	115	;'s'
	retlw	61	;'='
	retlw	32	;' '
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	10
	retlw	0
psect	strings
	
STR_3:	
	retlw	72	;'H'
	retlw	117	;'u'
	retlw	109	;'m'
	retlw	105	;'i'
	retlw	100	;'d'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	121	;'y'
	retlw	61	;'='
	retlw	32	;' '
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	10
	retlw	0
psect	strings
; #config settings
global __CFG_FOSC$HS
__CFG_FOSC$HS equ 0x0
global __CFG_WDTE$OFF
__CFG_WDTE$OFF equ 0x0
global __CFG_PWRTE$OFF
__CFG_PWRTE$OFF equ 0x0
global __CFG_BOREN$OFF
__CFG_BOREN$OFF equ 0x0
global __CFG_LVP$OFF
__CFG_LVP$OFF equ 0x0
global __CFG_CPD$OFF
__CFG_CPD$OFF equ 0x0
global __CFG_WRT$OFF
__CFG_WRT$OFF equ 0x0
global __CFG_CP$OFF
__CFG_CP$OFF equ 0x0
	file	"trab3.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_s:
       ds      6

psect	dataBANK1,class=BANK1,space=1,noexec
global __pdataBANK1
__pdataBANK1:
	file	"trab3.c"
	line	210
heater@F948:
       ds      16

psect	dataBANK1
	file	"trab3.c"
	line	257
main@F961:
       ds      15

	file	"trab3.as"
	line	#
global btemp
psect inittext,class=CODE,delta=2
global init_fetch0,btemp
;	Called with low address in FSR and high address in W
init_fetch0:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram0
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram0:
	fcall init_fetch0
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram0
; Initialize objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
global init_ram0, __pidataBANK1
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK1+31)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram0
	line	#
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_delayin:	; 1 bytes @ 0x0
?_uart_init:	; 1 bytes @ 0x0
??_uart_init:	; 1 bytes @ 0x0
?_uart_writeChar:	; 1 bytes @ 0x0
??_uart_writeChar:	; 1 bytes @ 0x0
?_adcInit:	; 1 bytes @ 0x0
??_adcInit:	; 1 bytes @ 0x0
?_pwm_init:	; 1 bytes @ 0x0
??_pwm_init:	; 1 bytes @ 0x0
?_init_sys:	; 1 bytes @ 0x0
??_init_sys:	; 1 bytes @ 0x0
?_temp_read:	; 1 bytes @ 0x0
?_vento_read:	; 1 bytes @ 0x0
??_vento_read:	; 1 bytes @ 0x0
?_hum_read:	; 1 bytes @ 0x0
?_read_all:	; 1 bytes @ 0x0
	global	?_adc_read
?_adc_read:	; 2 bytes @ 0x0
?_main:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	uart_writeChar@ch
uart_writeChar@ch:	; 1 bytes @ 0x0
	global	adc_read@channel
adc_read@channel:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	global	delayin@t
delayin@t:	; 4 bytes @ 0x0
	ds	1
?_uart_writeText:	; 1 bytes @ 0x1
	global	uart_writeText@str
uart_writeText@str:	; 2 bytes @ 0x1
	ds	1
??_adc_read:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
??_uart_writeText:	; 1 bytes @ 0x3
??_hum_read:	; 1 bytes @ 0x3
	global	?___wmul
?___wmul:	; 2 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x3
	ds	1
??_delayin:	; 1 bytes @ 0x4
??___lwdiv:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
??___ftpack:	; 1 bytes @ 0x5
	global	uart_writeText@i
uart_writeText@i:	; 2 bytes @ 0x5
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
?_heater:	; 1 bytes @ 0x7
??___wmul:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	global	heater@flag
heater@flag:	; 2 bytes @ 0x7
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x7
	ds	1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x8
	global	delayin@i
delayin@i:	; 2 bytes @ 0x8
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	1
??_heater:	; 1 bytes @ 0x9
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x9
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x9
	ds	1
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	1
??___awtoft:	; 1 bytes @ 0xB
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0xB
	ds	1
??___lwmod:	; 1 bytes @ 0xC
	ds	1
??___awdiv:	; 1 bytes @ 0xD
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0xD
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
??_temp_read:	; 1 bytes @ 0xE
??_read_all:	; 1 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x0
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x0
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x0
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x0
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x0
	global	heater@outro
heater@outro:	; 16 bytes @ 0x0
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x1
	ds	1
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x2
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x2
	ds	1
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x3
	ds	2
??_sprintf:	; 1 bytes @ 0x5
	ds	1
??___ftdiv:	; 1 bytes @ 0x6
	ds	2
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x8
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x9
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0xA
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0xA
	ds	1
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0xB
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0xB
	ds	2
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0xD
	ds	1
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0xE
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0xF
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x10
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x10
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x13
	ds	3
??___ftmul:	; 1 bytes @ 0x16
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x1A
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x1B
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x1E
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x1F
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x20
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x20
	ds	4
??___fttol:	; 1 bytes @ 0x24
	ds	4
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x28
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x29
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x2D
	ds	1
?_pwm_duty:	; 1 bytes @ 0x2E
	global	pwm_duty@duty
pwm_duty@duty:	; 2 bytes @ 0x2E
	ds	2
??_pwm_duty:	; 1 bytes @ 0x30
	ds	2
??_main:	; 1 bytes @ 0x32
	ds	4
	global	main@buffer
main@buffer:	; 0 bytes @ 0x36
	global	main@str_aux
main@str_aux:	; 15 bytes @ 0x36
	ds	15
	global	main@aux
main@aux:	; 2 bytes @ 0x45
	ds	2
	global	main@heater_flag
main@heater_flag:	; 2 bytes @ 0x47
	ds	2
;!
;!Data Sizes:
;!    Strings     48
;!    Constant    10
;!    Data        31
;!    BSS         6
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     14      14
;!    BANK0            80     73      79
;!    BANK1            80      0      31
;!    BANK3            96      0       0
;!    BANK2            96      0       0

;!
;!Pointer List with Targets:
;!
;!    sprintf@f	PTR const unsigned char  size(1) Largest target is 18
;!		 -> STR_3(CODE[15]), STR_2(CODE[18]), STR_1(CODE[15]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 0
;!		 -> main@buffer(BANK0[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(BANK0[2]), 
;!
;!    uart_writeText@str	PTR unsigned char  size(2) Largest target is 16
;!		 -> main@buffer(BANK0[0]), main@str_aux(BANK0[15]), heater@outro(BANK0[16]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    _sprintf->___lwmod
;!    ___lwmod->___lwdiv
;!    _temp_read->___awdiv
;!    ___wmul->_adc_read
;!    ___awdiv->___wmul
;!    _pwm_duty->___awtoft
;!    ___fttol->___awtoft
;!    ___ftmul->___awtoft
;!    ___ftdiv->___awtoft
;!    ___awtoft->___ftpack
;!    _hum_read->_adc_read
;!    _heater->_uart_writeText
;!    _uart_writeText->_uart_writeChar
;!
;!Critical Paths under _main in BANK0
;!
;!    _read_all->_pwm_duty
;!    _temp_read->___awdiv
;!    _pwm_duty->___fttol
;!    ___fttol->___ftmul
;!    ___ftmul->___ftdiv
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                23    23      0   12854
;!                                             50 BANK0     23    23      0
;!                            _delayin
;!                             _heater
;!                           _init_sys
;!                           _read_all
;!                            _sprintf
;!                     _uart_writeText
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             22    17      5    1438
;!                                              0 BANK0     14     9      5
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              6     2      4     287
;!                                              8 COMMON     6     2      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              8     4      4     290
;!                                              0 COMMON     8     4      4
;! ---------------------------------------------------------------------------------
;! (1) _read_all                                             0     0      0    9791
;!                           _adc_read
;!                           _hum_read
;!                           _pwm_duty
;!                          _temp_read
;!                         _vento_read
;! ---------------------------------------------------------------------------------
;! (2) _vento_read                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _temp_read                                            0     0      0     862
;!                            ___awdiv
;!                             ___wmul
;!                           _adc_read
;! ---------------------------------------------------------------------------------
;! (3) ___wmul                                               6     2      4     220
;!                                              3 COMMON     6     2      4
;!                           _adc_read (ARG)
;! ---------------------------------------------------------------------------------
;! (3) ___awdiv                                              9     5      4     428
;!                                              9 COMMON     5     1      4
;!                                              0 BANK0      4     4      0
;!                             ___wmul (ARG)
;!                           _adc_read (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _pwm_duty                                             4     2      2    8501
;!                                             46 BANK0      4     2      2
;!                           ___awtoft
;!                            ___ftdiv
;!                            ___ftmul
;!                            ___fttol
;!                           _adc_read (ARG)
;! ---------------------------------------------------------------------------------
;! (3) ___fttol                                             14    10      4     316
;!                                             32 BANK0     14    10      4
;!                           ___awtoft (ARG)
;!                            ___ftdiv (ARG)
;!                            ___ftmul (ARG)
;! ---------------------------------------------------------------------------------
;! (3) ___ftmul                                             16    10      6    2793
;!                                             16 BANK0     16    10      6
;!                           ___awtoft (ARG)
;!                            ___ftdiv (ARG)
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (3) ___ftdiv                                             16    10      6    2747
;!                                              0 BANK0     16    10      6
;!                           ___awtoft (ARG)
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (3) ___awtoft                                             6     3      3    2492
;!                                              8 COMMON     6     3      3
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (4) ___ftpack                                             8     3      5    2337
;!                                              0 COMMON     8     3      5
;! ---------------------------------------------------------------------------------
;! (2) _hum_read                                             0     0      0     214
;!                           _adc_read
;! ---------------------------------------------------------------------------------
;! (3) _adc_read                                             3     1      2     214
;!                                              0 COMMON     3     1      2
;! ---------------------------------------------------------------------------------
;! (1) _init_sys                                             0     0      0       0
;!                            _adcInit
;!                           _pwm_init
;!                          _uart_init
;! ---------------------------------------------------------------------------------
;! (2) _uart_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _pwm_init                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _adcInit                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _heater                                              22    20      2     629
;!                                              7 COMMON     6     4      2
;!                                              0 BANK0     16    16      0
;!                     _uart_writeText
;! ---------------------------------------------------------------------------------
;! (1) _uart_writeText                                       6     4      2     432
;!                                              1 COMMON     6     4      2
;!                     _uart_writeChar
;! ---------------------------------------------------------------------------------
;! (2) _uart_writeChar                                       1     1      0      22
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _delayin                                             10     6      4     302
;!                                              0 COMMON    10     6      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _delayin
;!   _heater
;!     _uart_writeText
;!       _uart_writeChar
;!   _init_sys
;!     _adcInit
;!     _pwm_init
;!     _uart_init
;!   _read_all
;!     _adc_read
;!     _hum_read
;!       _adc_read
;!     _pwm_duty
;!       ___awtoft
;!         ___ftpack
;!       ___ftdiv
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftpack (ARG)
;!       ___ftmul
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftdiv (ARG)
;!           ___awtoft (ARG)
;!             ___ftpack
;!           ___ftpack (ARG)
;!         ___ftpack (ARG)
;!       ___fttol
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftdiv (ARG)
;!           ___awtoft (ARG)
;!             ___ftpack
;!           ___ftpack (ARG)
;!         ___ftmul (ARG)
;!           ___awtoft (ARG)
;!             ___ftpack
;!           ___ftdiv (ARG)
;!             ___awtoft (ARG)
;!               ___ftpack
;!             ___ftpack (ARG)
;!           ___ftpack (ARG)
;!       _adc_read (ARG)
;!     _temp_read
;!       ___awdiv
;!         ___wmul (ARG)
;!           _adc_read (ARG)
;!         _adc_read (ARG)
;!       ___wmul
;!         _adc_read (ARG)
;!       _adc_read
;!     _vento_read
;!   _sprintf
;!     ___lwdiv
;!     ___lwmod
;!       ___lwdiv (ARG)
;!   _uart_writeText
;!     _uart_writeChar
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BANK3               60      0       0       9        0.0%
;!BITBANK3            60      0       0       8        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!BANK2               60      0       0      11        0.0%
;!BITBANK2            60      0       0      10        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               50      0      1F       7       38.8%
;!BITBANK1            50      0       0       6        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     49      4F       5       98.8%
;!BITBANK0            50      0       0       4        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      E       E       1      100.0%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      7C      12        0.0%
;!ABS                  0      0      7C       3        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%
;!EEDATA             100      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 254 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  str_aux        15   54[BANK0 ] unsigned char [15]
;;  heater_flag     2   71[BANK0 ] int 
;;  aux             2   69[BANK0 ] int 
;;  buffer          0   54[BANK0 ] unsigned char [0]
;; Return value:  Size  Location     Type
;;                  2  143[None  ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      19       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      23       0       0       0
;;Total ram usage:       23 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_delayin
;;		_heater
;;		_init_sys
;;		_read_all
;;		_sprintf
;;		_uart_writeText
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"trab3.c"
	line	254
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"trab3.c"
	line	254
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	callstack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	256
	
l1689:	
	fcall	_init_sys
	line	257
	
l1691:	
	clrf	(main@heater_flag)
	clrf	(main@heater_flag+1)
	line	259
	
l1693:	
	movlw	(main@str_aux)&0ffh
	movwf	fsr0
	movlw	low(main@F961)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	15
	movwf	((??_main+0)+0+2)
u1740:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u1740
	
	line	263
	
l1695:	
	movlw	(low(main@str_aux|((0x0)<<8))&0ffh)
	movwf	(uart_writeText@str)
	movlw	(0x0)
	movwf	(uart_writeText@str+1)
	fcall	_uart_writeText
	line	265
	
l1697:	
	line	270
	
l1699:	
	movf	(7),w	;volatile
	andlw	(1<<1)-1
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(main@aux)
	movf	1+(??_main+0)+0,w
	movwf	(main@aux+1)
	line	271
	
l1701:	
	movlw	low(main@buffer)
	movwf	(sprintf@sp)
	movlw	high(main@buffer)
	movwf	((sprintf@sp))+1
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(sprintf@f)
	movf	(main@aux+1),w
	movwf	1+(?_sprintf)+03h
	movf	(main@aux),w
	movwf	0+(?_sprintf)+03h
	fcall	_sprintf
	line	272
	
l1703:	
	movlw	low(main@buffer)
	movwf	(uart_writeText@str)
	movlw	high(main@buffer)
	movwf	((uart_writeText@str))+1
	fcall	_uart_writeText
	line	273
	
l1705:	
	movlw	0
	movwf	(delayin@t+3)
	movlw	0
	movwf	(delayin@t+2)
	movlw	0Bh
	movwf	(delayin@t+1)
	movlw	0B8h
	movwf	(delayin@t)

	fcall	_delayin
	line	276
	
l1707:	
	fcall	_read_all
	line	277
	
l1709:	
	banksel	main@buffer
	clrf	(main@buffer)&07fh
	line	280
	
l1711:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(6),3	;volatile
	goto	u1751
	goto	u1750
u1751:
	goto	l1699
u1750:
	line	281
	
l1713:	
	movlw	0
	movwf	(delayin@t+3)
	movlw	0
	movwf	(delayin@t+2)
	movlw	07h
	movwf	(delayin@t+1)
	movlw	0D0h
	movwf	(delayin@t)

	fcall	_delayin
	line	282
	
l1715:	
	movf	((main@heater_flag)),w
iorwf	((main@heater_flag+1)),w
	btfsc	status,2
	goto	u1761
	goto	u1760
u1761:
	goto	l1721
u1760:
	line	283
	
l1717:	
	clrf	(main@heater_flag)
	clrf	(main@heater_flag+1)
	line	284
	
l1719:	
	movlw	0
	movwf	(heater@flag)
	movwf	(heater@flag+1)
	fcall	_heater
	line	285
	goto	l1725
	line	287
	
l1721:	
	movlw	01h
	movwf	(main@heater_flag)
	movlw	0
	movwf	((main@heater_flag))+1
	line	288
	
l1723:	
	movlw	01h
	movwf	(heater@flag)
	movlw	0
	movwf	((heater@flag))+1
	fcall	_heater
	line	292
	
l1725:	
	movlw	low(main@buffer)
	movwf	(sprintf@sp)
	movlw	high(main@buffer)
	movwf	((sprintf@sp))+1
	movlw	(low((((STR_2)-__stringbase)|8000h)))&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(sprintf@f)
	movf	(_s+1),w
	movwf	1+(?_sprintf)+03h
	movf	(_s),w
	movwf	0+(?_sprintf)+03h
	fcall	_sprintf
	line	293
	
l1727:	
	movlw	low(main@buffer)
	movwf	(uart_writeText@str)
	movlw	high(main@buffer)
	movwf	((uart_writeText@str))+1
	fcall	_uart_writeText
	line	294
	
l1729:	
	movlw	0
	movwf	(delayin@t+3)
	movlw	0
	movwf	(delayin@t+2)
	movlw	0Bh
	movwf	(delayin@t+1)
	movlw	0B8h
	movwf	(delayin@t)

	fcall	_delayin
	line	296
	
l1731:	
	banksel	main@buffer
	clrf	(main@buffer)&07fh
	line	298
	
l1733:	
	movlw	low(main@buffer)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@sp)
	movlw	high(main@buffer)
	movwf	((sprintf@sp))+1
	movlw	(low((((STR_3)-__stringbase)|8000h)))&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(sprintf@f)
	movf	1+(_s)+02h,w
	movwf	1+(?_sprintf)+03h
	movf	0+(_s)+02h,w
	movwf	0+(?_sprintf)+03h
	fcall	_sprintf
	line	299
	
l1735:	
	movlw	low(main@buffer)
	movwf	(uart_writeText@str)
	movlw	high(main@buffer)
	movwf	((uart_writeText@str))+1
	fcall	_uart_writeText
	line	300
	
l1737:	
	movlw	0
	movwf	(delayin@t+3)
	movlw	0
	movwf	(delayin@t+2)
	movlw	0Bh
	movwf	(delayin@t+1)
	movlw	0B8h
	movwf	(delayin@t)

	fcall	_delayin
	goto	l1699
	global	start
	ljmp	start
	opt callstack 0
	line	304
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,90
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 505 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              2    0[BANK0 ] PTR unsigned char 
;;		 -> main@buffer(0), 
;;  f               1    2[BANK0 ] PTR const unsigned char 
;;		 -> STR_3(15), STR_2(18), STR_1(15), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  val             2   11[BANK0 ] unsigned int 
;;  cp              2    0        PTR const unsigned char 
;;  len             2    0        unsigned int 
;;  c               1   13[BANK0 ] unsigned char 
;;  prec            1   10[BANK0 ] char 
;;  flag            1    9[BANK0 ] unsigned char 
;;  ap              1    8[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      14       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext1
__ptext1:	;psect for function _sprintf
psect	text1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\doprnt.c"
	line	505
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
;incstack = 0
	opt	callstack 6
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	550
	
l1631:	
	movlw	(low(?_sprintf|((0x0)<<8)+03h))&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	553
	goto	l1683
	line	555
	
l1633:	
		movlw	37
	xorwf	((sprintf@c)),w
	btfsc	status,2
	goto	u1671
	goto	u1670
u1671:
	goto	l1639
u1670:
	line	558
	
l1635:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	bsf	status,7
	btfss	(sprintf@sp+1),0
	bcf	status,7
	movf	(??_sprintf+0)+0,w
	movwf	indf
	
l1637:	
	movlw	01h
	addwf	(sprintf@sp),f
	skipnc
	incf	(sprintf@sp+1),f
	movlw	0
	addwf	(sprintf@sp+1),f
	line	559
	goto	l1683
	line	565
	
l1639:	
	clrf	(sprintf@flag)
	line	661
	
l1643:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(sprintf@c)
	; Switch size 1, requested type "simple"
; Number of cases is 3, Range of values is 0 to 105
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l1685
	xorlw	100^0	; case 100
	skipnz
	goto	l1645
	xorlw	105^100	; case 105
	skipnz
	goto	l1645
	goto	l1683
	opt asmopt_pop

	line	1285
	
l1645:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@val+1)
	
l1647:	
	movlw	low(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1287
	
l1649:	
	btfss	(sprintf@val+1),7
	goto	u1681
	goto	u1680
u1681:
	goto	l1655
u1680:
	line	1288
	
l1651:	
	movlw	low(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1289
	
l1653:	
	comf	(sprintf@val),f
	comf	(sprintf@val+1),f
	incf	(sprintf@val),f
	skipnz
	incf	(sprintf@val+1),f
	line	1331
	
l1655:	
	clrf	(sprintf@c)
	incf	(sprintf@c),f
	line	1332
	
l1661:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((((_dpowers)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+1)+0
	fcall	stringdir
	movwf	(??_sprintf+1)+0+1
	movf	1+(??_sprintf+1)+0,w
	subwf	(sprintf@val+1),w
	skipz
	goto	u1695
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@val),w
u1695:
	skipnc
	goto	u1691
	goto	u1690
u1691:
	goto	l1665
u1690:
	goto	l1667
	line	1331
	
l1665:	
	movlw	low(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
		movlw	5
	xorwf	((sprintf@c)),w
	btfss	status,2
	goto	u1701
	goto	u1700
u1701:
	goto	l1661
u1700:
	line	1464
	
l1667:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u1711
	goto	u1710
u1711:
	goto	l1673
u1710:
	line	1465
	
l1669:	
	movlw	low(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	bsf	status,7
	btfss	(sprintf@sp+1),0
	bcf	status,7
	movf	(??_sprintf+0)+0,w
	movwf	indf
	
l1671:	
	movlw	01h
	addwf	(sprintf@sp),f
	skipnc
	incf	(sprintf@sp+1),f
	movlw	0
	addwf	(sprintf@sp+1),f
	line	1498
	
l1673:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1500
	goto	l1681
	line	1515
	
l1675:	
	movlw	0Ah
	movwf	(___lwmod@divisor)
	movlw	0
	movwf	((___lwmod@divisor))+1
	movf	(sprintf@prec),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((((_dpowers)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	movwf	(___lwdiv@divisor)
	fcall	stringdir
	movwf	(___lwdiv@divisor+1)
	movf	(sprintf@val+1),w
	movwf	(___lwdiv@dividend+1)
	movf	(sprintf@val),w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(___lwmod@dividend+1)
	movf	(0+(?___lwdiv)),w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	movwf	(??_sprintf+1)+0
	movf	(??_sprintf+1)+0,w
	movwf	(sprintf@c)
	line	1550
	
l1677:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	bsf	status,7
	btfss	(sprintf@sp+1),0
	bcf	status,7
	movf	(??_sprintf+0)+0,w
	movwf	indf
	
l1679:	
	movlw	01h
	addwf	(sprintf@sp),f
	skipnc
	incf	(sprintf@sp+1),f
	movlw	0
	addwf	(sprintf@sp+1),f
	line	1500
	
l1681:	
	movlw	low(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
		incf	(((sprintf@prec))),w
	btfss	status,2
	goto	u1721
	goto	u1720
u1721:
	goto	l1675
u1720:
	line	553
	
l1683:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@c)
	movf	(((sprintf@c))),w
	btfss	status,2
	goto	u1731
	goto	u1730
u1731:
	goto	l1633
u1730:
	line	1564
	
l1685:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bsf	status,7
	btfss	(sprintf@sp+1),0
	bcf	status,7
	clrf	indf
	line	1567
	
l262:	
	return
	opt callstack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
	signat	_sprintf,4698
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[COMMON] unsigned int 
;;  dividend        2   10[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\lwmod.c"
	line	5
global __ptext2
__ptext2:	;psect for function ___lwmod
psect	text2
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	callstack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	12
	
l1563:	
	movf	((___lwmod@divisor)),w
iorwf	((___lwmod@divisor+1)),w
	btfsc	status,2
	goto	u1571
	goto	u1570
u1571:
	goto	l1581
u1570:
	line	13
	
l1565:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	14
	goto	l1571
	line	15
	
l1567:	
	movlw	01h
	
u1585:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u1585
	line	16
	
l1569:	
	movlw	low(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	line	14
	
l1571:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u1591
	goto	u1590
u1591:
	goto	l1567
u1590:
	line	19
	
l1573:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u1605
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u1605:
	skipc
	goto	u1601
	goto	u1600
u1601:
	goto	l1577
u1600:
	line	20
	
l1575:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	21
	
l1577:	
	movlw	01h
	
u1615:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u1615
	line	22
	
l1579:	
	movlw	01h
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u1621
	goto	u1620
u1621:
	goto	l1573
u1620:
	line	24
	
l1581:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	25
	
l684:	
	return
	opt callstack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\lwdiv.c"
	line	5
global __ptext3
__ptext3:	;psect for function ___lwdiv
psect	text3
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	callstack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	13
	
l1537:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	14
	
l1539:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u1501
	goto	u1500
u1501:
	goto	l1559
u1500:
	line	15
	
l1541:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	16
	goto	l1547
	line	17
	
l1543:	
	movlw	01h
	
u1515:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u1515
	line	18
	
l1545:	
	movlw	low(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	line	16
	
l1547:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u1521
	goto	u1520
u1521:
	goto	l1543
u1520:
	line	21
	
l1549:	
	movlw	01h
	
u1535:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u1535
	line	22
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u1545
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u1545:
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l1555
u1540:
	line	23
	
l1551:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	24
	
l1553:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	26
	
l1555:	
	movlw	01h
	
u1555:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u1555
	line	27
	
l1557:	
	movlw	01h
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u1561
	goto	u1560
u1561:
	goto	l1549
u1560:
	line	29
	
l1559:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	30
	
l674:	
	return
	opt callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_read_all

;; *************** function _read_all *****************
;; Defined at:
;;		line 241 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_adc_read
;;		_hum_read
;;		_pwm_duty
;;		_temp_read
;;		_vento_read
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	file	"trab3.c"
	line	241
global __ptext4
__ptext4:	;psect for function _read_all
psect	text4
	file	"trab3.c"
	line	241
	global	__size_of_read_all
	__size_of_read_all	equ	__end_of_read_all-_read_all
	
_read_all:	
;incstack = 0
	opt	callstack 4
; Regs used in _read_all: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	242
	
l1625:	
	fcall	_hum_read
	line	243
	fcall	_temp_read
	line	244
	
l1627:	
	fcall	_vento_read
	line	245
	
l1629:	
	movlw	0
	movwf	(adc_read@channel)
	movwf	(adc_read@channel+1)
	fcall	_adc_read
	movf	(1+(?_adc_read)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(pwm_duty@duty+1)
	movf	(0+(?_adc_read)),w
	movwf	(pwm_duty@duty)
	fcall	_pwm_duty
	line	246
	
l139:	
	return
	opt callstack 0
GLOBAL	__end_of_read_all
	__end_of_read_all:
	signat	_read_all,89
	global	_vento_read

;; *************** function _vento_read *****************
;; Defined at:
;;		line 233 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_read_all
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	233
global __ptext5
__ptext5:	;psect for function _vento_read
psect	text5
	file	"trab3.c"
	line	233
	global	__size_of_vento_read
	__size_of_vento_read	equ	__end_of_vento_read-_vento_read
	
_vento_read:	
;incstack = 0
	opt	callstack 6
; Regs used in _vento_read: []
	line	235
	
l133:	
	return
	opt callstack 0
GLOBAL	__end_of_vento_read
	__end_of_vento_read:
	signat	_vento_read,89
	global	_temp_read

;; *************** function _temp_read *****************
;; Defined at:
;;		line 229 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		___wmul
;;		_adc_read
;; This function is called by:
;;		_read_all
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	line	229
global __ptext6
__ptext6:	;psect for function _temp_read
psect	text6
	file	"trab3.c"
	line	229
	global	__size_of_temp_read
	__size_of_temp_read	equ	__end_of_temp_read-_temp_read
	
_temp_read:	
;incstack = 0
	opt	callstack 5
; Regs used in _temp_read: [wreg+status,2+status,0+pclath+cstack]
	line	230
	
l1533:	
	movlw	0FFh
	movwf	(___awdiv@divisor)
	movlw	03h
	movwf	((___awdiv@divisor))+1
	movlw	02h
	movwf	(adc_read@channel)
	movlw	0
	movwf	((adc_read@channel))+1
	fcall	_adc_read
	movf	(1+(?_adc_read)),w
	movwf	(___wmul@multiplier+1)
	movf	(0+(?_adc_read)),w
	movwf	(___wmul@multiplier)
	movlw	0F4h
	movwf	(___wmul@multiplicand)
	movlw	01h
	movwf	((___wmul@multiplicand))+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(___awdiv@dividend+1)
	movf	(0+(?___wmul)),w
	movwf	(___awdiv@dividend)
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(_s+1)
	movf	(0+(?___awdiv)),w
	movwf	(_s)
	line	231
	
l130:	
	return
	opt callstack 0
GLOBAL	__end_of_temp_read
	__end_of_temp_read:
	signat	_temp_read,89
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    3[COMMON] unsigned int 
;;  multiplicand    2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    7[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/100
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temp_read
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext7
__ptext7:	;psect for function ___wmul
psect	text7
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
;incstack = 0
	opt	callstack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	43
	
l1273:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	45
	
l1275:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u1031
	goto	u1030
u1031:
	goto	l266
u1030:
	line	46
	
l1277:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l266:	
	line	47
	movlw	01h
	
u1045:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u1045
	line	48
	
l1279:	
	movlw	01h
	
u1055:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u1055
	line	49
	
l1281:	
	movf	((___wmul@multiplier)),w
iorwf	((___wmul@multiplier+1)),w
	btfss	status,2
	goto	u1061
	goto	u1060
u1061:
	goto	l1275
u1060:
	line	52
	
l1283:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	53
	
l268:	
	return
	opt callstack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___awdiv

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    9[COMMON] int 
;;  dividend        2   11[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    2[BANK0 ] int 
;;  sign            1    1[BANK0 ] unsigned char 
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    9[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       4       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temp_read
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\awdiv.c"
	line	5
global __ptext8
__ptext8:	;psect for function ___awdiv
psect	text8
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
;incstack = 0
	opt	callstack 5
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	13
	
l1287:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(___awdiv@sign)
	line	14
	
l1289:	
	btfss	(___awdiv@divisor+1),7
	goto	u1071
	goto	u1070
u1071:
	goto	l1295
u1070:
	line	15
	
l1291:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	16
	
l1293:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	18
	
l1295:	
	btfss	(___awdiv@dividend+1),7
	goto	u1081
	goto	u1080
u1081:
	goto	l1301
u1080:
	line	19
	
l1297:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	20
	
l1299:	
	movlw	low(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	line	22
	
l1301:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	23
	
l1303:	
	movf	((___awdiv@divisor)),w
iorwf	((___awdiv@divisor+1)),w
	btfsc	status,2
	goto	u1091
	goto	u1090
u1091:
	goto	l1323
u1090:
	line	24
	
l1305:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	25
	goto	l1311
	line	26
	
l1307:	
	movlw	01h
	
u1105:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u1105
	line	27
	
l1309:	
	movlw	low(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	line	25
	
l1311:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u1111
	goto	u1110
u1111:
	goto	l1307
u1110:
	line	30
	
l1313:	
	movlw	01h
	
u1125:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u1125
	line	31
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u1135
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u1135:
	skipc
	goto	u1131
	goto	u1130
u1131:
	goto	l1319
u1130:
	line	32
	
l1315:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	33
	
l1317:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	35
	
l1319:	
	movlw	01h
	
u1145:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u1145
	line	36
	
l1321:	
	movlw	01h
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u1151
	goto	u1150
u1151:
	goto	l1313
u1150:
	line	38
	
l1323:	
	movf	((___awdiv@sign)),w
	btfsc	status,2
	goto	u1161
	goto	u1160
u1161:
	goto	l1327
u1160:
	line	39
	
l1325:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	40
	
l1327:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	41
	
l449:	
	return
	opt callstack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
	signat	___awdiv,8314
	global	_pwm_duty

;; *************** function _pwm_duty *****************
;; Defined at:
;;		line 178 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;  duty            2   46[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___awtoft
;;		___ftdiv
;;		___ftmul
;;		___fttol
;; This function is called by:
;;		_read_all
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"trab3.c"
	line	178
global __ptext9
__ptext9:	;psect for function _pwm_duty
psect	text9
	file	"trab3.c"
	line	178
	global	__size_of_pwm_duty
	__size_of_pwm_duty	equ	__end_of_pwm_duty-_pwm_duty
	
_pwm_duty:	
;incstack = 0
	opt	callstack 4
; Regs used in _pwm_duty: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	180
	
l1523:	
	movf	(pwm_duty@duty+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(03h)^80h
	subwf	btemp+1,w
	skipz
	goto	u1475
	movlw	0FFh
	subwf	(pwm_duty@duty),w
u1475:

	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l117
u1470:
	line	182
	
l1525:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(pwm_duty@duty+1),w
	movwf	(___awtoft@c+1)
	movf	(pwm_duty@duty),w
	movwf	(___awtoft@c)
	fcall	___awtoft
	movf	(0+(?___awtoft)),w
	movwf	(___ftdiv@f1)
	movf	(1+(?___awtoft)),w
	movwf	(___ftdiv@f1+1)
	movf	(2+(?___awtoft)),w
	movwf	(___ftdiv@f1+2)
	movlw	0xc0
	movwf	(___ftdiv@f2)
	movlw	0x7f
	movwf	(___ftdiv@f2+1)
	movlw	0x44
	movwf	(___ftdiv@f2+2)
	fcall	___ftdiv
	movf	(0+(?___ftdiv)),w
	movwf	(___ftmul@f2)
	movf	(1+(?___ftdiv)),w
	movwf	(___ftmul@f2+1)
	movf	(2+(?___ftdiv)),w
	movwf	(___ftmul@f2+2)
	movlw	0x40
	movwf	(___ftmul@f1)
	movlw	0x9c
	movwf	(___ftmul@f1+1)
	movlw	0x44
	movwf	(___ftmul@f1+2)
	fcall	___ftmul
	movf	(0+(?___ftmul)),w
	movwf	(___fttol@f1)
	movf	(1+(?___ftmul)),w
	movwf	(___fttol@f1+1)
	movf	(2+(?___ftmul)),w
	movwf	(___fttol@f1+2)
	fcall	___fttol
	movf	(1+(?___fttol)),w
	movwf	(pwm_duty@duty+1)
	movf	(0+(?___fttol)),w
	movwf	(pwm_duty@duty)
	line	183
	
l1527:	
	btfsc	(pwm_duty@duty),0
	goto	u1481
	goto	u1480
	
u1481:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(189/8),(189)&7	;volatile
	goto	u1494
u1480:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(189/8),(189)&7	;volatile
u1494:
	line	184
	
l1529:	
	bcf	(188/8),(188)&7	;volatile
	line	185
	
l1531:	
	movf	(pwm_duty@duty+1),w
	movwf	(??_pwm_duty+0)+0+1
	movf	(pwm_duty@duty),w
	movwf	(??_pwm_duty+0)+0
	rlf	(??_pwm_duty+0)+1,w
	rrf	(??_pwm_duty+0)+1,f
	rrf	(??_pwm_duty+0)+0,f
	rlf	(??_pwm_duty+0)+1,w
	rrf	(??_pwm_duty+0)+1,f
	rrf	(??_pwm_duty+0)+0,f
	movf	0+(??_pwm_duty+0)+0,w
	movwf	(21)	;volatile
	line	187
	
l117:	
	return
	opt callstack 0
GLOBAL	__end_of_pwm_duty
	__end_of_pwm_duty:
	signat	_pwm_duty,4217
	global	___fttol

;; *************** function ___fttol *****************
;; Defined at:
;;		line 44 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3   32[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   41[BANK0 ] unsigned long 
;;  exp1            1   45[BANK0 ] unsigned char 
;;  sign1           1   40[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   32[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      14       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_pwm_duty
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\fttol.c"
	line	44
global __ptext10
__ptext10:	;psect for function ___fttol
psect	text10
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\fttol.c"
	line	44
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
;incstack = 0
	opt	callstack 5
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l1441:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	(((___fttol@exp1))),w
	btfss	status,2
	goto	u1361
	goto	u1360
u1361:
	goto	l1447
u1360:
	line	50
	
l1443:	
	movlw	high highword(0)
	movwf	(?___fttol+3)
	movlw	low highword(0)
	movwf	(?___fttol+2)
	movlw	high(0)
	movwf	(?___fttol+1)
	movlw	low(0)
	movwf	(?___fttol)

	goto	l562
	line	51
	
l1447:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u1375:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u1370:
	addlw	-1
	skipz
	goto	u1375
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l1449:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l1451:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l1453:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l1455:	
	movlw	08Eh
	subwf	(___fttol@exp1),f
	line	56
	
l1457:	
	btfss	(___fttol@exp1),7
	goto	u1381
	goto	u1380
u1381:
	goto	l1467
u1380:
	line	57
	
l1459:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u1391
	goto	u1390
u1391:
	goto	l1465
u1390:
	goto	l1443
	line	60
	
l1465:	
	movlw	01h
u1405:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u1405

	line	61
	movlw	low(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u1411
	goto	u1410
u1411:
	goto	l1465
u1410:
	goto	l1475
	line	63
	
l1467:	
	movlw	low(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u1421
	goto	u1420
u1421:
	goto	l569
u1420:
	goto	l1443
	line	66
	
l1473:	
	movlw	01h
	movwf	(??___fttol+0)+0
u1435:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u1435
	line	67
	movlw	01h
	subwf	(___fttol@exp1),f
	line	68
	
l569:	
	line	65
	movf	((___fttol@exp1)),w
	btfss	status,2
	goto	u1441
	goto	u1440
u1441:
	goto	l1473
u1440:
	line	70
	
l1475:	
	movf	((___fttol@sign1)),w
	btfsc	status,2
	goto	u1451
	goto	u1450
u1451:
	goto	l1479
u1450:
	line	71
	
l1477:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	line	72
	
l1479:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
l562:	
	return
	opt callstack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
	signat	___fttol,4220
	global	___ftmul

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 62 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   16[BANK0 ] float 
;;  f2              3   19[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   27[BANK0 ] unsigned um
;;  sign            1   31[BANK0 ] unsigned char 
;;  cntr            1   30[BANK0 ] unsigned char 
;;  exp             1   26[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   16[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_pwm_duty
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\ftmul.c"
	line	62
global __ptext11
__ptext11:	;psect for function ___ftmul
psect	text11
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\ftmul.c"
	line	62
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
;incstack = 0
	opt	callstack 4
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	67
	
l1385:	
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	(((___ftmul@exp))),w
	btfss	status,2
	goto	u1241
	goto	u1240
u1241:
	goto	l1391
u1240:
	line	68
	
l1387:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l541
	line	69
	
l1391:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	(((___ftmul@sign))),w
	btfss	status,2
	goto	u1251
	goto	u1250
u1251:
	goto	l1397
u1250:
	line	70
	
l1393:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l541
	line	71
	
l1397:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	72
	
l1399:	
	movf	0+(___ftmul@f1)+02h,w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@sign)
	line	73
	
l1401:	
	movf	0+(___ftmul@f2)+02h,w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	xorwf	(___ftmul@sign),f
	line	74
	
l1403:	
	movlw	low(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	75
	
l1405:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	77
	
l1407:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	78
	
l1409:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	79
	
l1411:	
	movlw	low(0)
	movwf	(___ftmul@f3_as_product)
	movlw	high(0)
	movwf	(___ftmul@f3_as_product+1)
	movlw	low highword(0)
	movwf	(___ftmul@f3_as_product+2)
	line	134
	
l1413:	
	movlw	low(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	line	136
	
l1415:	
	btfss	(___ftmul@f1),(0)&7
	goto	u1261
	goto	u1260
u1261:
	goto	l1419
u1260:
	line	137
	
l1417:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u1271
	addwf	(___ftmul@f3_as_product+1),f
u1271:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u1272
	addwf	(___ftmul@f3_as_product+2),f
u1272:

	line	138
	
l1419:	
	movlw	01h
u1285:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u1285

	line	139
	
l1421:	
	movlw	01h
u1295:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u1295
	line	140
	
l1423:	
	movlw	01h
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u1301
	goto	u1300
u1301:
	goto	l1415
u1300:
	line	143
	
l1425:	
	movlw	low(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	line	145
	
l1427:	
	btfss	(___ftmul@f1),(0)&7
	goto	u1311
	goto	u1310
u1311:
	goto	l1431
u1310:
	line	146
	
l1429:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u1321
	addwf	(___ftmul@f3_as_product+1),f
u1321:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u1322
	addwf	(___ftmul@f3_as_product+2),f
u1322:

	line	147
	
l1431:	
	movlw	01h
u1335:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u1335

	line	148
	
l1433:	
	movlw	01h
u1345:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u1345

	line	149
	
l1435:	
	movlw	01h
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u1351
	goto	u1350
u1351:
	goto	l1427
u1350:
	line	156
	
l1437:	
	movf	(___ftmul@f3_as_product),w
	movwf	(___ftpack@arg)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(___ftpack@arg+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(___ftpack@arg+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftpack@exp)
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	(___ftpack@sign)
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	line	157
	
l541:	
	return
	opt callstack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
	signat	___ftmul,8315
	global	___ftdiv

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 56 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3    0[BANK0 ] float 
;;  f1              3    3[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   11[BANK0 ] float 
;;  sign            1   15[BANK0 ] unsigned char 
;;  exp             1   14[BANK0 ] unsigned char 
;;  cntr            1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    0[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_pwm_duty
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\ftdiv.c"
	line	56
global __ptext12
__ptext12:	;psect for function ___ftdiv
psect	text12
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\ftdiv.c"
	line	56
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
;incstack = 0
	opt	callstack 4
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
l1343:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@exp)
	movf	(((___ftdiv@exp))),w
	btfss	status,2
	goto	u1181
	goto	u1180
u1181:
	goto	l1349
u1180:
	line	64
	
l1345:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l526
	line	65
	
l1349:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	movf	(((___ftdiv@sign))),w
	btfss	status,2
	goto	u1191
	goto	u1190
u1191:
	goto	l1355
u1190:
	line	66
	
l1351:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l526
	line	67
	
l1355:	
	movlw	low(0)
	movwf	(___ftdiv@f3)
	movlw	high(0)
	movwf	(___ftdiv@f3+1)
	movlw	low highword(0)
	movwf	(___ftdiv@f3+2)
	line	68
	
l1357:	
	movlw	low(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	69
	
l1359:	
	movf	0+(___ftdiv@f1)+02h,w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftdiv@sign)
	line	70
	movf	0+(___ftdiv@f2)+02h,w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	xorwf	(___ftdiv@sign),f
	line	71
	movlw	low(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	72
	
l1361:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	73
	
l1363:	
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	74
	
l1365:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	75
	
l1367:	
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	76
	
l1369:	
	movlw	low(018h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftdiv@cntr)
	line	78
	
l1371:	
	movlw	01h
u1205:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u1205
	line	79
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u1215
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u1215
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u1215:
	skipc
	goto	u1211
	goto	u1210
u1211:
	goto	l1377
u1210:
	line	80
	
l1373:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	81
	
l1375:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	83
	
l1377:	
	movlw	01h
u1225:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u1225
	line	84
	
l1379:	
	movlw	01h
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u1231
	goto	u1230
u1231:
	goto	l1371
u1230:
	line	85
	
l1381:	
	movf	(___ftdiv@f3),w
	movwf	(___ftpack@arg)
	movf	(___ftdiv@f3+1),w
	movwf	(___ftpack@arg+1)
	movf	(___ftdiv@f3+2),w
	movwf	(___ftpack@arg+2)
	movf	(___ftdiv@exp),w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftpack@exp)
	movf	(___ftdiv@sign),w
	movwf	(??___ftdiv+1)+0
	movf	(??___ftdiv+1)+0,w
	movwf	(___ftpack@sign)
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	line	86
	
l526:	
	return
	opt callstack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
	signat	___ftdiv,8315
	global	___awtoft

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 32 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    8[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    8[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_pwm_duty
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\awtoft.c"
	line	32
global __ptext13
__ptext13:	;psect for function ___awtoft
psect	text13
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\awtoft.c"
	line	32
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
;incstack = 0
	opt	callstack 4
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l1331:	
	clrf	(___awtoft@sign)
	line	37
	
l1333:	
	btfss	(___awtoft@c+1),7
	goto	u1171
	goto	u1170
u1171:
	goto	l1339
u1170:
	line	38
	
l1335:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	
l1337:	
	clrf	(___awtoft@sign)
	incf	(___awtoft@sign),f
	line	41
	
l1339:	
	movf	(___awtoft@c),w
	movwf	(___ftpack@arg)
	movf	(___awtoft@c+1),w
	movwf	(___ftpack@arg+1)
	clrf	(___ftpack@arg+2)
	movlw	low(08Eh)
	movwf	(??___awtoft+0)+0
	movf	(??___awtoft+0)+0,w
	movwf	(___ftpack@exp)
	movf	(___awtoft@sign),w
	movwf	(??___awtoft+1)+0
	movf	(??___awtoft+1)+0,w
	movwf	(___ftpack@sign)
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	line	42
	
l468:	
	return
	opt callstack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
	signat	___awtoft,4219
	global	___ftpack

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 62 in file "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___awtoft
;;		___ftdiv
;;		___ftmul
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\float.c"
	line	62
global __ptext14
__ptext14:	;psect for function ___ftpack
psect	text14
	file	"C:\Program Files (x86)\Microchip\xc8\v2.10\pic\sources\c90\common\float.c"
	line	62
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
;incstack = 0
	opt	callstack 4
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l1227:	
	movf	((___ftpack@exp)),w
	btfsc	status,2
	goto	u891
	goto	u890
u891:
	goto	l1231
u890:
	
l1229:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u901
	goto	u900
u901:
	goto	l1237
u900:
	line	65
	
l1231:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l474
	line	67
	
l1235:	
	movlw	low(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u915:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u915

	line	66
	
l1237:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u921
	goto	u920
u921:
	goto	l1235
u920:
	goto	l478
	line	71
	
l1239:	
	movlw	low(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l1241:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l1243:	
	movlw	01h
u935:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u935

	line	74
	
l478:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u941
	goto	u940
u941:
	goto	l1239
u940:
	goto	l1247
	line	76
	
l1245:	
	movlw	01h
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u955:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u955
	line	75
	
l1247:	
	btfsc	(___ftpack@arg+1),(15)&7
	goto	u961
	goto	u960
u961:
	goto	l485
u960:
	
l1249:	
	movlw	low(02h)
	subwf	(___ftpack@exp),w
	skipnc
	goto	u971
	goto	u970
u971:
	goto	l1245
u970:
	
l485:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u981
	goto	u980
u981:
	goto	l486
u980:
	line	80
	
l1251:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l486:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l1253:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u995:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u990:
	addlw	-1
	skipz
	goto	u995
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l1255:	
	movf	((___ftpack@sign)),w
	btfsc	status,2
	goto	u1001
	goto	u1000
u1001:
	goto	l487
u1000:
	line	84
	
l1257:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l487:	
	line	85
	line	86
	
l474:	
	return
	opt callstack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
	signat	___ftpack,12411
	global	_hum_read

;; *************** function _hum_read *****************
;; Defined at:
;;		line 237 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_adc_read
;; This function is called by:
;;		_read_all
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	file	"trab3.c"
	line	237
global __ptext15
__ptext15:	;psect for function _hum_read
psect	text15
	file	"trab3.c"
	line	237
	global	__size_of_hum_read
	__size_of_hum_read	equ	__end_of_hum_read-_hum_read
	
_hum_read:	
;incstack = 0
	opt	callstack 5
; Regs used in _hum_read: [wreg+status,2+status,0+pclath+cstack]
	line	238
	
l1535:	
	movlw	01h
	movwf	(adc_read@channel)
	movlw	0
	movwf	((adc_read@channel))+1
	fcall	_adc_read
	movf	(1+(?_adc_read)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(_s)+02h
	movf	(0+(?_adc_read)),w
	movwf	0+(_s)+02h
	line	239
	
l136:	
	return
	opt callstack 0
GLOBAL	__end_of_hum_read
	__end_of_hum_read:
	signat	_hum_read,89
	global	_adc_read

;; *************** function _adc_read *****************
;; Defined at:
;;		line 137 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;  channel         2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temp_read
;;		_hum_read
;;		_read_all
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	line	137
global __ptext16
__ptext16:	;psect for function _adc_read
psect	text16
	file	"trab3.c"
	line	137
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
;incstack = 0
	opt	callstack 5
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	138
	
l1263:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(159)^080h,7	;volatile
	line	140
	
l1265:	
	movf	(adc_read@channel),w
	movwf	(??_adc_read+0)+0
	rlf	(??_adc_read+0)+0,f
	rlf	(??_adc_read+0)+0,f
	rlf	(??_adc_read+0)+0,f
	bcf	status, 5	;RP0=0, select bank0
	movf	(31),w	;volatile
	xorwf	(??_adc_read+0)+0,w
	andlw	not (((1<<3)-1)<<3)
	xorwf	(??_adc_read+0)+0,w
	movwf	(31)	;volatile
	line	142
	
l1267:	
	bsf	(31),2	;volatile
	line	143
	
l107:	
	btfsc	(31),2	;volatile
	goto	u1021
	goto	u1020
u1021:
	goto	l107
u1020:
	line	146
	
l1269:	
	movf	(30),w	;volatile
	movwf	(?_adc_read+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(?_adc_read)
	line	149
	
l110:	
	return
	opt callstack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
	signat	_adc_read,4218
	global	_init_sys

;; *************** function _init_sys *****************
;; Defined at:
;;		line 190 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_adcInit
;;		_pwm_init
;;		_uart_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	line	190
global __ptext17
__ptext17:	;psect for function _init_sys
psect	text17
	file	"trab3.c"
	line	190
	global	__size_of_init_sys
	__size_of_init_sys	equ	__end_of_init_sys-_init_sys
	
_init_sys:	
;incstack = 0
	opt	callstack 6
; Regs used in _init_sys: [wreg+status,2+status,0+pclath+cstack]
	line	192
	
l1591:	
	fcall	_uart_init
	line	193
	
l1593:	
	fcall	_adcInit
	line	194
	
l1595:	
	fcall	_pwm_init
	line	196
	
l1597:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(134)^080h,3	;volatile
	line	197
	
l1599:	
	bcf	(135)^080h,5	;volatile
	line	200
	
l1601:	
	bsf	(135)^080h,0	;volatile
	line	201
	
l1603:	
	bcf	(135)^080h,2	;volatile
	line	202
	
l1605:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(7),2	;volatile
	line	204
	
l1607:	
	clrf	(_s)
	clrf	(_s+1)
	line	205
	
l1609:	
	clrf	0+(_s)+04h
	clrf	1+(_s)+04h
	line	206
	
l1611:	
	clrf	0+(_s)+02h
	clrf	1+(_s)+02h
	line	208
	
l120:	
	return
	opt callstack 0
GLOBAL	__end_of_init_sys
	__end_of_init_sys:
	signat	_init_sys,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 43 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/100
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_sys
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	line	43
global __ptext18
__ptext18:	;psect for function _uart_init
psect	text18
	file	"trab3.c"
	line	43
	global	__size_of_uart_init
	__size_of_uart_init	equ	__end_of_uart_init-_uart_init
	
_uart_init:	
;incstack = 0
	opt	callstack 6
; Regs used in _uart_init: [wreg]
	line	46
	
l1483:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1218/8)^080h,(1218)&7	;volatile
	line	47
	
l1485:	
	movlw	low(019h)
	movwf	(153)^080h	;volatile
	line	48
	
l1487:	
	bcf	(1220/8)^080h,(1220)&7	;volatile
	line	49
	
l1489:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(199/8),(199)&7	;volatile
	line	52
	
l1491:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1222/8)^080h,(1222)&7	;volatile
	line	53
	
l1493:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(198/8),(198)&7	;volatile
	line	56
	
l1495:	
	bsf	(196/8),(196)&7	;volatile
	line	57
	
l1497:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1221/8)^080h,(1221)&7	;volatile
	line	59
	
l75:	
	return
	opt callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_pwm_init

;; *************** function _pwm_init *****************
;; Defined at:
;;		line 156 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_sys
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	line	156
global __ptext19
__ptext19:	;psect for function _pwm_init
psect	text19
	file	"trab3.c"
	line	156
	global	__size_of_pwm_init
	__size_of_pwm_init	equ	__end_of_pwm_init-_pwm_init
	
_pwm_init:	
;incstack = 0
	opt	callstack 6
; Regs used in _pwm_init: [wreg]
	line	164
	
l1511:	
	movlw	low(023h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	166
	
l1513:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(144/8),(144)&7	;volatile
	line	167
	
l1515:	
	bcf	(145/8),(145)&7	;volatile
	line	168
	
l1517:	
	bsf	(146/8),(146)&7	;volatile
	line	172
	
l1519:	
	bsf	(186/8),(186)&7	;volatile
	line	173
	
l1521:	
	bsf	(187/8),(187)&7	;volatile
	line	175
	
l113:	
	return
	opt callstack 0
GLOBAL	__end_of_pwm_init
	__end_of_pwm_init:
	signat	_pwm_init,89
	global	_adcInit

;; *************** function _adcInit *****************
;; Defined at:
;;		line 128 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : B00/100
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_sys
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=0
	line	128
global __ptext20
__ptext20:	;psect for function _adcInit
psect	text20
	file	"trab3.c"
	line	128
	global	__size_of_adcInit
	__size_of_adcInit	equ	__end_of_adcInit-_adcInit
	
_adcInit:	
;incstack = 0
	opt	callstack 6
; Regs used in _adcInit: [status,2]
	line	129
	
l1507:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(31)	;volatile
	line	130
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	131
	
l1509:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(31),0	;volatile
	line	132
	
l104:	
	return
	opt callstack 0
GLOBAL	__end_of_adcInit
	__end_of_adcInit:
	signat	_adcInit,89
	global	_heater

;; *************** function _heater *****************
;; Defined at:
;;		line 210 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;  flag            2    7[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  outro          16    0[BANK0 ] unsigned char [16]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/2700000
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0      16       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         6      16       0       0       0
;;Total ram usage:       22 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_uart_writeText
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=0
	line	210
global __ptext21
__ptext21:	;psect for function _heater
psect	text21
	file	"trab3.c"
	line	210
	global	__size_of_heater
	__size_of_heater	equ	__end_of_heater-_heater
	
_heater:	
;incstack = 0
	opt	callstack 5
; Regs used in _heater: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	212
	
l1613:	
	movlw	(heater@outro)&0ffh
	movwf	fsr0
	movlw	low(heater@F948)
	movwf	(??_heater+0)+0
	movf	fsr0,w
	movwf	((??_heater+0)+0+1)
	movlw	16
	movwf	((??_heater+0)+0+2)
u1640:
	movf	(??_heater+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_heater+0)+0+3)
	incf	(??_heater+0)+0,f
	movf	((??_heater+0)+0+1),w
	movwf	fsr0
	
	movf	((??_heater+0)+0+3),w
	movwf	indf
	incf	((??_heater+0)+0+1),f
	decfsz	((??_heater+0)+0+2),f
	goto	u1640
	
	line	214
	
l1615:	
	movf	((heater@flag)),w
iorwf	((heater@flag+1)),w
	btfss	status,2
	goto	u1651
	goto	u1650
u1651:
	goto	l1619
u1650:
	line	215
	
l1617:	
	bcf	(7),5	;volatile
	line	217
	
l1619:	
		decf	((heater@flag)),w
iorwf	((heater@flag+1)),w
	btfss	status,2
	goto	u1661
	goto	u1660
u1661:
	goto	l1623
u1660:
	line	218
	
l1621:	
	bsf	(7),5	;volatile
	line	221
	
l1623:	
	movlw	(low(heater@outro|((0x0)<<8))&0ffh)
	movwf	(uart_writeText@str)
	movlw	(0x0)
	movwf	(uart_writeText@str+1)
	fcall	_uart_writeText
	line	222
	
l127:	
	return
	opt callstack 0
GLOBAL	__end_of_heater
	__end_of_heater:
	signat	_heater,4217
	global	_uart_writeText

;; *************** function _uart_writeText *****************
;; Defined at:
;;		line 78 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;  str             2    1[COMMON] PTR unsigned char 
;;		 -> main@buffer(0), main@str_aux(15), heater@outro(16), 
;; Auto vars:     Size  Location     Type
;;  i               2    5[COMMON] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_uart_writeChar
;; This function is called by:
;;		_heater
;;		_main
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=0
	line	78
global __ptext22
__ptext22:	;psect for function _uart_writeText
psect	text22
	file	"trab3.c"
	line	78
	global	__size_of_uart_writeText
	__size_of_uart_writeText	equ	__end_of_uart_writeText-_uart_writeText
	
_uart_writeText:	
;incstack = 0
	opt	callstack 6
; Regs used in _uart_writeText: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	80
	
l1499:	
	clrf	(uart_writeText@i)
	clrf	(uart_writeText@i+1)
	goto	l1505
	line	81
	
l1501:	
	movf	(uart_writeText@i),w
	addwf	(uart_writeText@str),w
	movwf	(??_uart_writeText+0)+0
	movf	(uart_writeText@i+1),w
	skipnc
	incf	(uart_writeText@i+1),w
	addwf	(uart_writeText@str+1),w
	movwf	1+(??_uart_writeText+0)+0
	movf	0+(??_uart_writeText+0)+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_uart_writeText+0)+0,0
	bcf	status,7
	movf	indf,w
	fcall	_uart_writeChar
	line	80
	
l1503:	
	movlw	01h
	addwf	(uart_writeText@i),f
	skipnc
	incf	(uart_writeText@i+1),f
	movlw	0
	addwf	(uart_writeText@i+1),f
	
l1505:	
	movf	(uart_writeText@i),w
	addwf	(uart_writeText@str),w
	movwf	(??_uart_writeText+0)+0
	movf	(uart_writeText@i+1),w
	skipnc
	incf	(uart_writeText@i+1),w
	addwf	(uart_writeText@str+1),w
	movwf	1+(??_uart_writeText+0)+0
	movf	0+(??_uart_writeText+0)+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_uart_writeText+0)+0,0
	bcf	status,7
	movf	(indf),w
	btfss	status,2
	goto	u1461
	goto	u1460
u1461:
	goto	l1501
u1460:
	line	83
	
l87:	
	return
	opt callstack 0
GLOBAL	__end_of_uart_writeText
	__end_of_uart_writeText:
	signat	_uart_writeText,4217
	global	_uart_writeChar

;; *************** function _uart_writeChar *****************
;; Defined at:
;;		line 64 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_writeText
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	line	64
global __ptext23
__ptext23:	;psect for function _uart_writeChar
psect	text23
	file	"trab3.c"
	line	64
	global	__size_of_uart_writeChar
	__size_of_uart_writeChar	equ	__end_of_uart_writeChar-_uart_writeChar
	
_uart_writeChar:	
;incstack = 0
	opt	callstack 6
; Regs used in _uart_writeChar: [wreg]
	movwf	(uart_writeChar@ch)
	line	70
	
l1259:	
	
l78:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1217/8)^080h,(1217)&7	;volatile
	goto	u1011
	goto	u1010
u1011:
	goto	l78
u1010:
	line	71
	
l1261:	
	movf	(uart_writeChar@ch),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	73
	
l81:	
	return
	opt callstack 0
GLOBAL	__end_of_uart_writeChar
	__end_of_uart_writeChar:
	signat	_uart_writeChar,4217
	global	_delayin

;; *************** function _delayin *****************
;; Defined at:
;;		line 29 in file "trab3.c"
;; Parameters:    Size  Location     Type
;;  t               4    0[COMMON] long 
;; Auto vars:     Size  Location     Type
;;  i               2    8[COMMON] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, btemp+1
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:        10       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	line	29
global __ptext24
__ptext24:	;psect for function _delayin
psect	text24
	file	"trab3.c"
	line	29
	global	__size_of_delayin
	__size_of_delayin	equ	__end_of_delayin-_delayin
	
_delayin:	
;incstack = 0
	opt	callstack 7
; Regs used in _delayin: [wreg+status,2+btemp+1]
	line	30
	
l1585:	
	clrf	(delayin@i)
	clrf	(delayin@i+1)
	line	31
	goto	l1589
	
l1587:	
	movlw	01h
	addwf	(delayin@i),f
	skipnc
	incf	(delayin@i+1),f
	movlw	0
	addwf	(delayin@i+1),f
	
l1589:	
	movf	(delayin@i),w
	movwf	((??_delayin+0)+0)
	movf	(delayin@i+1),w
	movwf	((??_delayin+0)+0+1)
	movlw	0
	btfsc	((??_delayin+0)+0+1),7
	movlw	255
	movwf	((??_delayin+0)+0+2)
	movwf	((??_delayin+0)+0+3)
	movf	3+(??_delayin+0)+0,w
	xorlw	80h
	movwf	btemp+1
	movf	(delayin@t+3),w
	xorlw	80h
	subwf	btemp+1,w
	
	skipz
	goto	u1633
	movf	(delayin@t+2),w
	subwf	2+(??_delayin+0)+0,w
	skipz
	goto	u1633
	movf	(delayin@t+1),w
	subwf	1+(??_delayin+0)+0,w
	skipz
	goto	u1633
	movf	(delayin@t),w
	subwf	0+(??_delayin+0)+0,w
u1633:
	skipc
	goto	u1631
	goto	u1630
u1631:
	goto	l1587
u1630:
	line	33
	
l72:	
	return
	opt callstack 0
GLOBAL	__end_of_delayin
	__end_of_delayin:
	signat	_delayin,4217
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
