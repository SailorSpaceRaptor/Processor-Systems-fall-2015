/*
 * lab4_B3.asm
 *
 *  Created: 9/28/2015 11:19:11 AM
 *   Author: Jonathan
 */ 
 //this application for Processor Systems Fall 2015 takes a byte of data, loads it into Port B, sends it out to Port A, and sends its 2s Compliment to Port C

 ldi r16, 0xff //load register 

 out DDRB, r16 //set portB to output
 
 out DDRA, r16 //set ports A and C to outputs
 out DDRC, r16 
 
 ldi r16, 0xE3 
 out PORTB, r16 //load port B with a byte of data
  
 out PORTA, r16 //send byte of data to port A
 com r16 
 out PORTC, r16 //send compliment of data to port C

 in r20, PORTA //send contents of PORTA to r20
 in r21, PORTC //send contents of PORTC to r21 
 here: jmp here

