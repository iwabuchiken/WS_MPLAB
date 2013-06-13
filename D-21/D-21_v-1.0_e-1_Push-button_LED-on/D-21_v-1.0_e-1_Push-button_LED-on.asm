;e-1_p1_t1

	list		p=10f200
	#include	<p10f200.inc>
	
	__CONFIG	_CP_OFF & _WDT_OFF & _MCLRE_OFF & _IntRC_OSC

CNT1		EQU	0x10
CNT2		EQU	0x11
CNT3		EQU	0x12

			ORG	0x000

main
			movwf		OSCCAL
			bcf			OSCCAL,FOSC4
			
			movlw		b'11111110'
			TRIS		GPIO
			
main_loop
			btfss		GPIO,3
			
			call		Btn_Off
			
			bcf			GPIO,0
			
			goto		main_loop

Btn_Off
			bsf			GPIO,0
			goto		main_loop
			
			END
