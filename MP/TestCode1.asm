
_main:

;TestCode1.mbas,5 :: 		main:
;TestCode1.mbas,6 :: 		TRISB=0x00
	CLRF       TRISB+0
;TestCode1.mbas,7 :: 		PORTB=0x00
	CLRF       PORTB+0
;TestCode1.mbas,8 :: 		TRISD=0x00
	CLRF       TRISD+0
;TestCode1.mbas,9 :: 		PORTD=0x00
	CLRF       PORTD+0
;TestCode1.mbas,10 :: 		while(1)
L__main2:
;TestCode1.mbas,11 :: 		PORTB=0xF0 ' State 1
	MOVLW      240
	MOVWF      PORTB+0
;TestCode1.mbas,12 :: 		PORTD=0X0F ' State 1
	MOVLW      15
	MOVWF      PORTD+0
;TestCode1.mbas,13 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
	NOP
;TestCode1.mbas,14 :: 		PORTB=0x03  ' State 2
	MOVLW      3
	MOVWF      PORTB+0
;TestCode1.mbas,15 :: 		PORTD=0XC0  ' State 2
	MOVLW      192
	MOVWF      PORTD+0
;TestCode1.mbas,16 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
	NOP
;TestCode1.mbas,17 :: 		wend
	GOTO       L__main2
L_end_main:
	GOTO       $+0
; end of _main
