
_main:

;GasDetector.c,19 :: 		void main(void){
;GasDetector.c,20 :: 		ADC_Init(); // it will initialize the adc module of pic16f877a microcontroller
	CALL       _ADC_Init+0
;GasDetector.c,21 :: 		Lcd_Init(); // Initialize LCD
	CALL       _Lcd_Init+0
;GasDetector.c,22 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;GasDetector.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;GasDetector.c,24 :: 		Lcd_Out(1,1,"    CSE331" );
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_GasDetector+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;GasDetector.c,25 :: 		Lcd_Out(2,1,"Gas Detector " ); // Write text in first
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_GasDetector+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;GasDetector.c,26 :: 		delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;GasDetector.c,27 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;GasDetector.c,29 :: 		while(1){
L_main1:
;GasDetector.c,30 :: 		value = ADC_read(0); // It will read the gas value of sensor
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _value+0
	MOVF       R0+1, 0
	MOVWF      _value+1
;GasDetector.c,31 :: 		if( value > 300 ){
	MOVLW      128
	XORLW      1
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       R0+0, 0
	SUBLW      44
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;GasDetector.c,32 :: 		Lcd_Out(1,1, "Gas detected!" );
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_GasDetector+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;GasDetector.c,34 :: 		}
	GOTO       L_main4
L_main3:
;GasDetector.c,36 :: 		Lcd_Out(1,1, "No gas detected!" );
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_GasDetector+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;GasDetector.c,38 :: 		}
L_main4:
;GasDetector.c,39 :: 		delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;GasDetector.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;GasDetector.c,41 :: 		}
	GOTO       L_main1
;GasDetector.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
