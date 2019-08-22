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
  ADC_Init(); // it will initialize the adc module of pic16f877a microcontroller
  Lcd_Init(); // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR); // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
  Lcd_Out(1,1,"    CSE331" );
  Lcd_Out(2,1,"Gas Detector " ); // Write text in first
  delay_ms(1000);
  Lcd_Cmd(_LCD_CLEAR); // Clear display

  while(1){
    value = ADC_read(0); // It will read the gas value of sensor
    if( value > 300 ){
        Lcd_Out(1,1, "Gas detected!" );
      //  Lcd_Out(2,1, "Value: " );
    }
    else{
        Lcd_Out(1,1, "No gas detected!" );
       // Lcd_Out(2,1, "Value:" );
    }
    delay_ms(1000);
    Lcd_Cmd(_LCD_CLEAR);
  }
}