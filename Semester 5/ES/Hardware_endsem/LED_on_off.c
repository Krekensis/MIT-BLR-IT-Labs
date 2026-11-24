#include <LPC17xx.h>

void delay_ms(unsigned int ms){
    volatile unsigned int i, j;

    for(i = 0; i < ms; i++){
        for(j = 0; j < 20000; j++);
    }
}

int main(void){
    LPC_GPIO2->FIODIR = 0xFFFFFFFF; //LEDs are connected to Port 2, so set all pins of Port 2 as output

    while(1)
    {
        LPC_GPIO2->FIOSET = 0xFFFFFFFF; // Turn on all LEDs
        delay_ms(100);

        LPC_GPIO2->FIOCLR = 0xFFFFFFFF; // Turn off all LEDs
        delay_ms(100);
    }
}