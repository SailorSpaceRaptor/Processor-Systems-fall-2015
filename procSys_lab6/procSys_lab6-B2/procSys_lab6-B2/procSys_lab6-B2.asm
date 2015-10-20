/*
 * procSys_lab6_B2.asm
 *
 *  Created: 10/17/2015 4:47:42 PM
 *   Author: Jonathan
 */ 

 //this application sums PORTA and PORTB then divides by 2 and stores the answer in PORTC

 //define num, denom, and quotient
 .DEF NUM = R20
 .DEF DENOM = R21
 .DEF QUOT = R22

 //Set PORTA and PORTB to outputs 
 ldi r16, 0xFF
 OUT DDRA,R16
 OUT DDRB,R16

 //load registers with values to be calculated
 ldi r16, 0x86
 out PORTA, r16
 ldi r16, 0x5A
 out PORTB, r16
 ldi r16, 2 //counter

 //sum PORTA and PORTB
 in r17, PORTA
 in r18, PORTB
 add r17,r18

 //quotient algorithm
 MOV NUM, r17
 ldi DENOM, 2
 CLR QUOT

 L1: INC QUOT
     SUB NUM,DENOM
	 BRCC L1

DEC QUOT
ADD NUM, DENOM

//send quotient to PORTC
out PORTC, QUOT

here:jmp here
