
_main:

;NLCD.mbas,4 :: 		main:
;NLCD.mbas,6 :: 		TRISB = 0X00    ' Data lines
	CLRF       TRISB+0
;NLCD.mbas,7 :: 		TRISD = 0X00    ' Control signal for PORTD pins
	CLRF       TRISD+0
;NLCD.mbas,10 :: 		while(1)
L__main2:
;NLCD.mbas,13 :: 		PORTD = 0x01 ' first segment
	MOVLW      1
	MOVWF      PORTD+0
;NLCD.mbas,14 :: 		PORTB =  0x5C    ' display char 'n' in portB
	MOVLW      92
	MOVWF      PORTB+0
;NLCD.mbas,15 :: 		Delay_Ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	NOP
;NLCD.mbas,17 :: 		PORTD = 0x02 ' second segment
	MOVLW      2
	MOVWF      PORTD+0
;NLCD.mbas,18 :: 		PORTB =  0x5C    ' display char 'n' in portB
	MOVLW      92
	MOVWF      PORTB+0
;NLCD.mbas,19 :: 		Delay_Ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	NOP
;NLCD.mbas,21 :: 		PORTD = 0x04 ' third  segment
	MOVLW      4
	MOVWF      PORTD+0
;NLCD.mbas,22 :: 		PORTB =  0x5C    ' display char 'n' in portB
	MOVLW      92
	MOVWF      PORTB+0
;NLCD.mbas,23 :: 		Delay_Ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main8:
	DECFSZ     R13+0, 1
	GOTO       L__main8
	DECFSZ     R12+0, 1
	GOTO       L__main8
	NOP
;NLCD.mbas,25 :: 		PORTD = 0x08 ' forth segment
	MOVLW      8
	MOVWF      PORTD+0
;NLCD.mbas,26 :: 		PORTB =  0x5C    ' display char 'n' in portB
	MOVLW      92
	MOVWF      PORTB+0
;NLCD.mbas,27 :: 		Delay_Ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	DECFSZ     R12+0, 1
	GOTO       L__main9
	NOP
;NLCD.mbas,28 :: 		wend
	GOTO       L__main2
L_end_main:
	GOTO       $+0
; end of _main
