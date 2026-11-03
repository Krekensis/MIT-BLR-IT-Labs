#include <LPC17xx.h>
#include "lcd.h"
unsigned long int temp1;

int main()
{
    char Msg[] = "HELLO";

    lcd_init();

    temp1 = 0x80;       // First line, first position
    lcd_com();

    lcd_puts(&Msg[0]);  // Display HELLO

    while(1);
}