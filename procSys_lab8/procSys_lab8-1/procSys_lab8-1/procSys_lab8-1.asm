/*
 * procSys_lab8_1.asm
 *
 *  Created: 10/27/2015 2:15:37 PM
 *   Author: Jonathan
 */ 

 //this application scrolls through digits 0 to 9 on a svnSeg display

 .EQU ZERO = 0b11000000
 .EQU ONE = 0b11111001
 .EQU TWO = 0b10100100
 .EQU THREE = 0b10110000
 .EQU FOUR = 0b10011001
 .EQU FIVE = 0B10010010
 .EQU SIX = 0b10000010
 .EQU SVN = 0b11111000
 .EQU EIGHT = 0x00
 .EQU NINE = 0b10010000

 //start stack pointer
 ldi r16, HIGH(RAMEND)
 out sph, r16
 ldi r16, LOW(RAMEND)
 out spl, r16

 //make portB output
 ldi r16, 0xFF
 OUT DDRB, r16

 ldi r17, 0xFF
//loop to execute the message
L:      ldi r16, ZERO
        OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, ONE
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, TWO
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, THREE
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, FOUR
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, FIVE
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB,R17
		CALL DELAY
		
		ldi r16, SIX
		OUT PORTB, R16
		CALL DELAY
		
		OUT PORTB, R17
		CALL DELAY
		
		ldi r16, SVN
		OUT PORTB, R16
		CALL DELAY
		
		OUT PORTB, R17
		CALL DELAY

		ldi r16, EIGHT
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, NINE
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB,R17
		CALL DELAY

RJMP L

//delay subroutine
 DELAY:ldi R20,24
L1: ldi R21,200
L2: ldi R22,250
L3: nop
nop
dec R22 
brne L3
dec R21
brne L2
dec R20
brne L1 
ret 
