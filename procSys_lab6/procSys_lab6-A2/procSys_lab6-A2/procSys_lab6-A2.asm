/*
 * procSys_lab6_A2.asm
 *
 *  Created: 10/15/2015 8:10:36 PM
 *   Author: Jonathan
 */ 


 //this application copies bits 1 and 6 of PINB to bits 0 and 2 of portD
 OUT DDRB, r16
 ldi r17, 0b01000010
 ldi r18, 6 //make counter

 //lsl r17 6 times
 L1: OUT PINB, r17
	 lsr r17
	 dec r18
	 BRNE L1

//turn B into output
ldi r16, 0xFF
out DDRB, r16

//clear unwanted bits
CBI PORTB, 6
CBI PORTB, 5
CBI PORTB, 4
CBI PORTB, 3

//send PINB to PORTD
IN r20, PORTB
OUT PORTD, r20

here: jmp here 
     