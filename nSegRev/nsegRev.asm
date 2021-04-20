
_main:

;nsegRev.mbas,5 :: 		main:
;nsegRev.mbas,7 :: 		TRISA = 0X00
	CLRF       TRISA+0
;nsegRev.mbas,8 :: 		TRISD = 0X00
	CLRF       TRISD+0
;nsegRev.mbas,10 :: 		PORTA = 0X3C
	MOVLW      60
	MOVWF      PORTA+0
;nsegRev.mbas,11 :: 		PORTD = 0X37
	MOVLW      55
	MOVWF      PORTD+0
L_end_main:
	GOTO       $+0
; end of _main
