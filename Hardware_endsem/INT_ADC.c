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

    /* Text labels displayed on the LCD */
    unsigned char Msg3[11] = {"ANALOG IP:"};
    unsigned char Msg4[12] = {"ADC OUTPUT:"};

    /* Initialize the LCD */
    lcd_init();

    /* Select P1.31 as the ADC input pin AD0.5 */
    LPC_PINCON->PINSEL3 |= 0xC0000000;

    /* Enable power to the ADC peripheral */
    LPC_SC->PCONP |= (1 << 12);

    /* Display "ANALOG IP:" at the start of the first LCD line */
    temp1 = 0x80;
    lcd_com();
    delay_lcd(800);
    lcd_puts(&Msg3[0]);

    /* Display "ADC OUTPUT:" at the start of the second LCD line */
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

        /* Short delay to allow time for the conversion */
        for (i = 0; i < 2000; i++);

        /*
         * Wait for the ADC conversion to complete.
         * ADGDR contains the conversion status and result.
         */
        while ((adc_temp = LPC_ADC->ADGDR) == 0x80000000);

        /* Read the ADC global data register */
        adc_temp = LPC_ADC->ADGDR;

        /* Move the 12-bit ADC result from bits 15:4 down to bits 11:0 */
        adc_temp >>= 4;

        /* Keep only the 12-bit result */
        adc_temp &= 0x00000FFF;

        /* Convert the ADC result to an input voltage */
        in_vtg = ((float)adc_temp * (float)Ref_Vtg)
                 / (float)Full_Scale;

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