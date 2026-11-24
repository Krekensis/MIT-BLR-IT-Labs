#include <LPC17xx.h>
#include "lcd.h"
#include <stdio.h>

#define Ref_Vtg     3.300 // ADC reference voltage
#define Full_Scale  0xFFF // Maximum value of a 12-bit ADC: 2^12 - 1 = 4095 

int main(void){
    unsigned int adc_temp;
    unsigned int i;
    float in_vtg;

    /* Buffers used to store formatted strings for the LCD */
    unsigned char vtg[7];
    unsigned char dval[7];
    unsigned char blank[] = "   ";

    unsigned char Msg3[11] = {"ANALOG IP:"};
    unsigned char Msg4[12] = {"ADC OUTPUT:"};

    lcd_init();

    LPC_PINCON->PINSEL3 |= 0xC0000000;
    LPC_SC->PCONP |= (1 << 12);

    temp1 = 0x80;
    lcd_com();
    delay_lcd(800);
    lcd_puts(&Msg3[0]);

    temp1 = 0xC0;
    lcd_com();
    delay_lcd(800);
    lcd_puts(&Msg4[0]);

    while (1)
    {
        /*
         * Configure ADCR and start an ADC conversion:
         * (1 << 5)  selects ADC channel AD0.5
         * (1 << 21) powers up the ADC
         * (1 << 24) starts a conversion now
         */
        LPC_ADC->ADCR = (1 << 5) | (1 << 21) | (1 << 24);

        for (i = 0; i < 2000; i++);

        while ((adc_temp = LPC_ADC->ADGDR) == 0x80000000);

        adc_temp = LPC_ADC->ADGDR;
        adc_temp >>= 4;
        adc_temp &= 0x00000FFF;

        in_vtg = ((float)adc_temp * (float)Ref_Vtg) / (float)Full_Scale;

        /* Convert the voltage and ADC result to strings for the LCD */
        sprintf(vtg, "%3.2fV", in_vtg);
        sprintf(dval, "%x", adc_temp);

        /* Short delay before updating the LCD */
        for (i = 0; i < 2000; i++);

        /* Display the voltage at position 0x8A on the first line */
        temp1 = 0x8A;
        lcd_com();
        delay_lcd(800);
        lcd_puts(&vtg[0]);

        /*
         * Clear the previous ADC value by writing spaces
         * at position 0xCB on the second line.
         */
        temp1 = 0xCB;
        lcd_com();
        lcd_puts(&blank[0]);

        /* Display the hexadecimal ADC result at position 0xCB */
        temp1 = 0xCB;
        lcd_com();
        delay_lcd(800);
        lcd_puts(&dval[0]);

        /* Wait before taking and displaying the next reading */
        for (i = 0; i < 200000; i++);

        /* Clear the string buffers ready for the next reading */
        for (i = 0; i < 7; i++)
            vtg[i] = dval[i] = 0x00;

        /* Reset temporary values before the next loop */
        adc_temp = 0;
        in_vtg = 0;
    }
}