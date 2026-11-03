#include <LPC17xx.H>

int main(void){
	LPC_PINCON->PINSEL1 = 0x00000000;
	LPC_GPIO0->FIODIR = 0X03000000; // 0x02000000 for LED, 0x01000000 for BUZZER

	while(1){
		if(!(LPC_GPIO2->FIOPIN & 0x00000800)){ // Is GP_SW(SW4) is pressed??
			LPC_GPIO0->FIOSET = 0X03000000; //same as above
		}
		else{
			LPC_GPIO0->FIOCLR = 0X03000000;
		}
	}
}