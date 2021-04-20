
_main:

;UART.mbas,6 :: 		main:
;UART.mbas,8 :: 		UART1_Init(19200) ' initialize UART at baud rate 19200
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;UART.mbas,9 :: 		Delay_ms(100)' wait for the module to stabilize
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
;UART.mbas,10 :: 		id = 89169    ' assign decimal to the id
	MOVLW      81
	MOVWF      _id+0
	MOVLW      92
	MOVWF      _id+1
	MOVLW      1
	MOVWF      _id+2
	MOVLW      0
	MOVWF      _id+3
;UART.mbas,11 :: 		UART1_Write(id) ' send the id
	MOVLW      81
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;UART.mbas,13 :: 		while(1)
L__main3:
;UART.mbas,14 :: 		UART1_Write_Text("Abdul Kareem")        ' user name
	MOVLW      65
	MOVWF      ?LocalText_main+0
	MOVLW      98
	MOVWF      ?LocalText_main+1
	MOVLW      100
	MOVWF      ?LocalText_main+2
	MOVLW      117
	MOVWF      ?LocalText_main+3
	MOVLW      108
	MOVWF      ?LocalText_main+4
	MOVLW      32
	MOVWF      ?LocalText_main+5
	MOVLW      75
	MOVWF      ?LocalText_main+6
	MOVLW      97
	MOVWF      ?LocalText_main+7
	MOVLW      114
	MOVWF      ?LocalText_main+8
	MOVLW      101
	MOVWF      ?LocalText_main+9
	MOVLW      101
	MOVWF      ?LocalText_main+10
	MOVLW      109
	MOVWF      ?LocalText_main+11
	CLRF       ?LocalText_main+12
	MOVLW      ?LocalText_main+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;UART.mbas,15 :: 		UART1_Write_Text("I love microcontrollers")        ' message
	MOVLW      73
	MOVWF      ?LocalText_main+0
	MOVLW      32
	MOVWF      ?LocalText_main+1
	MOVLW      108
	MOVWF      ?LocalText_main+2
	MOVLW      111
	MOVWF      ?LocalText_main+3
	MOVLW      118
	MOVWF      ?LocalText_main+4
	MOVLW      101
	MOVWF      ?LocalText_main+5
	MOVLW      32
	MOVWF      ?LocalText_main+6
	MOVLW      109
	MOVWF      ?LocalText_main+7
	MOVLW      105
	MOVWF      ?LocalText_main+8
	MOVLW      99
	MOVWF      ?LocalText_main+9
	MOVLW      114
	MOVWF      ?LocalText_main+10
	MOVLW      111
	MOVWF      ?LocalText_main+11
	MOVLW      99
	MOVWF      ?LocalText_main+12
	MOVLW      111
	MOVWF      ?LocalText_main+13
	MOVLW      110
	MOVWF      ?LocalText_main+14
	MOVLW      116
	MOVWF      ?LocalText_main+15
	MOVLW      114
	MOVWF      ?LocalText_main+16
	MOVLW      111
	MOVWF      ?LocalText_main+17
	MOVLW      108
	MOVWF      ?LocalText_main+18
	MOVLW      108
	MOVWF      ?LocalText_main+19
	MOVLW      101
	MOVWF      ?LocalText_main+20
	MOVLW      114
	MOVWF      ?LocalText_main+21
	MOVLW      115
	MOVWF      ?LocalText_main+22
	CLRF       ?LocalText_main+23
	MOVLW      ?LocalText_main+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;UART.mbas,16 :: 		wend
	GOTO       L__main3
L_end_main:
	GOTO       $+0
; end of _main
