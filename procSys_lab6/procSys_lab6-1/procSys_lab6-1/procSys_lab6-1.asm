/*
 * procSys_lab6_1.asm
 *
 *  Created: 10/15/2015 11:17:39 AM
 *   Author: Jonathan
 */ 

 //this application copies bits 1,2, and 3 from PINB and moves them to portD

 ldi r16, HIGH(RAMEND)
 OUT SPH, R16
 ldi r16, LOW(RAMEND)
 OUT SPL, R16

 //set B and D to OUTPUT
 ldi r16, 0xff
 ldi r17, 0x00
 out DDRB, r17
 out DDRD, r16

 //load bits into PINB
 SBI PINB, 1
 SBI PINB, 2
 SBI PINB, 3

 //set B to output
 out DDRB, r16
 
 //move bits from PINB to PORTD
 IN r20, PORTB
 lsr r20
 OUT PORTD, R20

 here: jmp here