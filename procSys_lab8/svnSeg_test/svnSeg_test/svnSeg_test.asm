/*
 * svnSeg_test.asm
 *
 *  Created: 10/27/2015 1:22:15 PM
 *   Author: Jonathan
 */ 

 //this application tests the svn seg in the kit by spelling out the word "Thriller"

 .EQU T = 0b11111000
 .EQU H = 0b10001001
 .EQU R = 0b10101111
 .EQU I = 0b11111011
 .EQU L = 0b11111001
 .EQU E = 0b10000110

 //set stack pointer
 ldi r16, HIGH(RAMEND)
 out sph, r16
 ldi r16, LOW(RAMEND)
 out spl, r16

 //set portB as output
 ldi r16, 0xFF
 OUT DDRB, r16

 ldi r17, 0xFF
//loop to execute the message
THRILL: ldi r16, T
        OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, H
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, R
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, I
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, L
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB, R17
		CALL DELAY

		ldi r16, L
		OUT PORTB, R16
		CALL DELAY

		OUT PORTB,R17
		CALL DELAY
		
		ldi r16, E
		OUT PORTB, R16
		CALL DELAY
		
		OUT PORTB, R17
		CALL DELAY
		
		ldi r16, R
		OUT PORTB, R16
		CALL DELAY
		
		OUT PORTB, R17
		CALL DELAY
RJMP THRILL

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
