/*
 * procSys_final.c
 *
 * Created: 12/7/2015 9:08:54 PM
 *  Author: Jonathan
 */ 

#include <avr/io.h>
#include "util\delay.h"
#include "LCD_driver.h"
#include <avr/interrupt.h>
#include <math.h>
volatile char str [100];
volatile int count;
volatile int dist;
volatile int LED;
float totaltimer;
float timer;

int main()                                    // Main function
{
	
	DDRB = 0b11111110;// Set PINB0 to an input
		
	LCD_Init();//initialize the LCD
	
	// enable interrupts
	PCMSK1 |= (1<<PINB0);
	EIMSK |= (1<<PCIE1);
	TCCR0A |= (1<<CS02);
	TIMSK0 |= (1<<OCIE0A);
	TIMSK1 |= (1<<OCIE1A);
	DDRB = 0b11111111;
	PORTB = 0x00;
	_delay_us(2);
	PORTB = 0x01;
	_delay_us(5);
	DDRB = 0x04;
	sei();

	while(1)
	{
		//wait for interrupt
		
	}//end while
}//end main

ISR(PCINT1_vect) {
	count++; //increment counter when pin changes
	if (count == 3) // first portion of the wave
	{
		TCNT0 = 0;   // resetting the clock to time how long the pulse lasts
	}
	if (count == 4) // pulse ends
	{
		TCCR0A = TCCR0A & (0<<CS02);  //disabling timer0 in order to use the values obtained to calculate distance
		dist = (TCNT0*.216);  //inches
		
		sprintf(str, "%d IN", dist);
		LCD_puts(str);    //displays distance
		
		
		if ((dist >= 5) && (dist <= 30))  //when distance is greater then 2 or less than 30
		{
			PORTB = PORTB | (1<<PB2);  /// pin 2 will be high, writing to the port
			_delay_ms(100);
			PORTB = 0x00;    // turning off and generate variable delay
			for  (LED=0;LED<dist;LED++) /// as distance increases, it will cycle through this delay loop more and more
			{
				_delay_ms(100);
			}
		} //end case 1
	
	 if(dist < 5 )
		{
			PORTB = PORTB | (1<<PB2);
			stepCounterclk();	
		} //end case 2
	
	if(dist > 30)
		{
		  stepClkwise();
		}//end case 3
		
		TCNT0 = 0;
		TCCR0A = TCCR0A | (1<<CS02);
		count = 0;     /// resetting all values and the clock
		return 0; // returning to the top
		
	}//end if(count == 4)
} //end isr


void stepCounterclk()
{
	DDRB = 0xFF;
	volatile int steps[] = {48,96,192,144};
    PORTB = PORTB | (1<<PB2);
		
	  for(int z = 3; z >= 0; z--)
	  {
		  PORTB = PORTB | (1<<PB2);
		  PORTB = steps[z];
		  PORTB = PORTB | (1<<PB2);
		  delayRoutine(); //delayRoutine set for 100 ms normal mode
		  PORTB = 0x02;
		  PORTB = PORTB | (1<<PB2);
		  delayRoutine();
		  PORTB = PORTB | (1<<PB2);
	  }
} //end stepCounterclk

void stepClkwise()
{
	DDRB = 0xFF;
	volatile int steps[] = {48,96,192,144};
		
		   for(int z = 0; z <= 3; z++)
		   {
			   PORTB = steps[z];
			   delayRoutine(); //delayRoutine set for 100 ms normal mode
			   PORTB  = 0x00;
			   delayRoutine();
		   }
}//end stepClkwise

void delayRoutine() //this function creates a 100ms delay using timer1 in normal mode
{
	TCNT1H = 0xCF;
	TCNT1L = 0x2C;
	
	TCCR1A = 0x00; //normal mode
	TCCR1B = 0x02; //prescaler of 8
	
	while((TIFR1&(0x1<<TOV1))==0); //wait for TOV1 to roll over
	
	TCCR1B = 0;
	TIFR1 = 0x1 << TOV1;	
}//end delay routine