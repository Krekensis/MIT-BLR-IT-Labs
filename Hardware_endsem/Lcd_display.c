#include <LPC17xx.h>

#define DATA (0x0F << 23)
#define RS   (1 << 27)
#define EN   (1 << 28)

void delay(void)
{
    volatile unsigned int i;
    for(i = 0; i < 50000; i++);
}
void lcd_nibble(unsigned int n)
{
    LPC_GPIO0->FIOCLR = DATA;
    LPC_GPIO0->FIOSET = (n & 0x0F) << 23;

    LPC_GPIO0->FIOSET = EN;
    delay();
    LPC_GPIO0->FIOCLR = EN;
    delay();
}
void lcd_cmd(unsigned int cmd)
{
    LPC_GPIO0->FIOCLR = RS;

    lcd_nibble(cmd >> 4);
    lcd_nibble(cmd);
    delay();
}
void lcd_data(unsigned int data)
{
    LPC_GPIO0->FIOSET = RS;

    lcd_nibble(data >> 4);
    lcd_nibble(data);
    delay();
}

int main(void)
{
    unsigned int i;
    char msg[] = "HELLO";

    SystemInit();

    LPC_PINCON->PINSEL1 &= ~0x03FFF000;
    LPC_GPIO0->FIODIR |= DATA | RS | EN;

    LPC_GPIO0->FIOCLR = RS | EN;
    delay();

    // Initialize LCD in 4-bit mode
    lcd_nibble(0x03);
    lcd_nibble(0x03);
    lcd_nibble(0x03);
    lcd_nibble(0x02);

    lcd_cmd(0x28);  // 4-bit, 2-line mode
    lcd_cmd(0x0C);  // Display ON
    lcd_cmd(0x06);  // Increment cursor
    lcd_cmd(0x01);  // Clear display
    lcd_cmd(0x80);  // First line

    for(i = 0; msg[i] != '\0'; i++)
    {
        lcd_data(msg[i]);
    }

    while(1);
}