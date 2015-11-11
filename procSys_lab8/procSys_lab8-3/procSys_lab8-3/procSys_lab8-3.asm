/*
 * procSys_lab8_3.asm
 *
 *  Created: 11/2/2015 9:11:00 PM
 *   Author: Jonathan
 */ 

 //this application integrates the previous two activities into one

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
 .EQU C = 0b11111011
 .EQU B = 0b11111101
 .EQU A = 0b11111110
 .EQU F = 0b11011111
 .EQU E = 0b11101111
 .EQU D = 0b11110111

  //set stack pointer
 ldi r16, HIGH(RAMEND)
 out SPH, r16
 ldi r16, LOW(RAMEND)
 out SPL, r16

 //set portB as output
 ldi r16, 0xFF
 OUT DDRB, r16

 ldi r17, 0xFF

 
//loop to execute the message
L:      ldi r16, ZERO
        OUT PORTB, R16
		CALL DELAY2

		OUT PORTB, R17
		CALL DELAY2

		ldi r16, ONE
		OUT PORTB, R16
		CALL DELAY2

		OUT PORTB, R17
		CALL DELAY2

		ldi r16, TWO
		OUT PORTB, R16
		CALL DELAY2

		OUT PORTB, R17
		CALL DELAY2

		ldi r16, THREE
		OUT PORTB, R16
		CALL DELAY2

		OUT PORTB, R17
		CALL DELAY2

		ldi r16, FOUR
		OUT PORTB, R16
		CALL DELAY2

		OUT PORTB, R17
		CALL DELAY2

		ldi r16, FIVE
		OUT PORTB, R16
		CALL DELAY2

		OUT PORTB,R17
		CALL DELAY2
		
		ldi r16, SIX
		OUT PORTB, R16
		CALL DELAY2
		
		OUT PORTB, R17
		CALL DELAY2
		
		ldi r16, SVN
		OUT PORTB, R16
		CALL DELAY2
		
		OUT PORTB, R17
		CALL DELAY2

		ldi r16, EIGHT
		OUT PORTB, R16
		CALL DELAY2

		OUT PORTB, R17
		CALL DELAY2

		ldi r16, NINE
		OUT PORTB, R16
		CALL DELAY2

		OUT PORTB,R17
		CALL DELAY2
 
  loop: 
      ldi r16, C
	  OUT portb, r16
	  CALL DELAY1
	  OUT portb, r17
	  CALL DELAY1

	  ldi r16, B
	  OUT portb, r16
	  CALL DELAY1
	  OUT portb, r17
	  CALL DELAY1

	  ldi r16, A
	  OUT portb, r16
	  CALL DELAY1
	  OUT portb, r17
	  CALL DELAY1

	  ldi r16, F
	  OUT portb, r16
	  CALL DELAY1
	  OUT portb, r17
	  CALL DELAY1

	  ldi r16, E
	  OUT portb, r16
	  CALL DELAY1
	  OUT portb, r17
	  CALL DELAY1

	  ldi r16, D
	  OUT portb, r16
	  CALL DELAY1
	  OUT portb, r17
	  CALL DELAY1

rjmp L
 
 
 
 //delay subroutine (1s)
 DELAY2:ldi R20,24
L1A: ldi R21,200
L2A: ldi R22,250
L3A: nop
nop
dec R22 
brne L3A
dec R21
brne L2A
dec R20
brne L1A 
ret
 
   //delay1 subroutine (.5 s)
 DELAY1:ldi R20,15
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