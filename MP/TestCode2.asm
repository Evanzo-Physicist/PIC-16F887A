
_mask:

;TestCode2.mbas,6 :: 		dim temp_holder as integer
;TestCode2.mbas,7 :: 		if character = 0 then
	MOVLW      0
	XORWF      FARG_mask_character+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mask32
	MOVLW      0
	XORWF      FARG_mask_character+0, 0
L__mask32:
	BTFSS      STATUS+0, 2
	GOTO       L__mask2
;TestCode2.mbas,8 :: 		temp_holder = 0x01
	MOVLW      1
	MOVWF      R4+0
	CLRF       R4+1
L__mask2:
;TestCode2.mbas,10 :: 		if character = 1 then
	MOVLW      0
	XORWF      FARG_mask_character+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mask33
	MOVLW      1
	XORWF      FARG_mask_character+0, 0
L__mask33:
	BTFSS      STATUS+0, 2
	GOTO       L__mask5
;TestCode2.mbas,11 :: 		temp_holder = 0x08
	MOVLW      8
	MOVWF      R4+0
	CLRF       R4+1
L__mask5:
;TestCode2.mbas,13 :: 		if character = 2 then
	MOVLW      0
	XORWF      FARG_mask_character+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mask34
	MOVLW      2
	XORWF      FARG_mask_character+0, 0
L__mask34:
	BTFSS      STATUS+0, 2
	GOTO       L__mask8
;TestCode2.mbas,14 :: 		temp_holder = 0x06
	MOVLW      6
	MOVWF      R4+0
	CLRF       R4+1
L__mask8:
;TestCode2.mbas,16 :: 		if character = 3 then
	MOVLW      0
	XORWF      FARG_mask_character+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mask35
	MOVLW      3
	XORWF      FARG_mask_character+0, 0
L__mask35:
	BTFSS      STATUS+0, 2
	GOTO       L__mask11
;TestCode2.mbas,17 :: 		temp_holder = 0x30
	MOVLW      48
	MOVWF      R4+0
	CLRF       R4+1
L__mask11:
;TestCode2.mbas,19 :: 		result = temp_holder
	MOVF       R4+0, 0
	MOVWF      R2+0
	MOVF       R4+1, 0
	MOVWF      R2+1
;TestCode2.mbas,20 :: 		end sub
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
L_end_mask:
	RETURN
; end of _mask

_main:

;TestCode2.mbas,23 :: 		dim a , x as integer ' declare two variables 'a' and 'x'
;TestCode2.mbas,25 :: 		TRISA = 0x00
	CLRF       TRISA+0
;TestCode2.mbas,26 :: 		PORTA=0x00
	CLRF       PORTA+0
;TestCode2.mbas,28 :: 		TRISD = 0x00
	CLRF       TRISD+0
;TestCode2.mbas,29 :: 		PORTD=0x00
	CLRF       PORTD+0
;TestCode2.mbas,30 :: 		while(1)
L__main15:
;TestCode2.mbas,31 :: 		PORTA=0x20 'set port A to 32 bits
	MOVLW      32
	MOVWF      PORTA+0
;TestCode2.mbas,32 :: 		for x = 0 to 3
	CLRF       main_x+0
	CLRF       main_x+1
L__main20:
;TestCode2.mbas,33 :: 		PORTD=mask(x)' set port D to a masked value of the loop counter x
	MOVF       main_x+0, 0
	MOVWF      FARG_mask_character+0
	MOVF       main_x+1, 0
	MOVWF      FARG_mask_character+1
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;TestCode2.mbas,34 :: 		Delay_ms(2000)' delay for 2000 milliseconds
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main24:
	DECFSZ     R13+0, 1
	GOTO       L__main24
	DECFSZ     R12+0, 1
	GOTO       L__main24
	DECFSZ     R11+0, 1
	GOTO       L__main24
	NOP
;TestCode2.mbas,35 :: 		next x
	MOVLW      0
	XORWF      main_x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      3
	XORWF      main_x+0, 0
L__main37:
	BTFSC      STATUS+0, 2
	GOTO       L__main23
	INCF       main_x+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_x+1, 1
	GOTO       L__main20
L__main23:
;TestCode2.mbas,37 :: 		PORTA=0x10 ' set port A to 16 bits
	MOVLW      16
	MOVWF      PORTA+0
;TestCode2.mbas,38 :: 		for x = 0 to 3
	CLRF       main_x+0
	CLRF       main_x+1
L__main26:
;TestCode2.mbas,39 :: 		PORTD=mask(x)' set port D to  a masked value of the loop counter x
	MOVF       main_x+0, 0
	MOVWF      FARG_mask_character+0
	MOVF       main_x+1, 0
	MOVWF      FARG_mask_character+1
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;TestCode2.mbas,40 :: 		Delay_ms(2000)' delay 2000 milliseconds
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main30:
	DECFSZ     R13+0, 1
	GOTO       L__main30
	DECFSZ     R12+0, 1
	GOTO       L__main30
	DECFSZ     R11+0, 1
	GOTO       L__main30
	NOP
;TestCode2.mbas,41 :: 		next x
	MOVLW      0
	XORWF      main_x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVLW      3
	XORWF      main_x+0, 0
L__main38:
	BTFSC      STATUS+0, 2
	GOTO       L__main29
	INCF       main_x+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_x+1, 1
	GOTO       L__main26
L__main29:
;TestCode2.mbas,42 :: 		wend
	GOTO       L__main15
L_end_main:
	GOTO       $+0
; end of _main
