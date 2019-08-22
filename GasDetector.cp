#line 1 "C:/Users/DELL/Desktop/Final project/GasDetector.c"
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;

sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;

sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

int value;

void main(void){
 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"    CSE331" );
 Lcd_Out(2,1,"Gas Detector " );
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);

 while(1){
 value = ADC_read(0);
 if( value > 300 ){
 Lcd_Out(1,1, "Gas detected!" );

 }
 else{
 Lcd_Out(1,1, "No gas detected!" );

 }
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 }
}
