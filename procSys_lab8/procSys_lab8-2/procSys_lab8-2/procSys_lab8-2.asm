/*
 * procSys_lab8_2.asm
 *
 *  Created: 11/2/2015 8:51:11 PM
 *   Author: Jonathan
 */ 
 //this application lights each individual cathode on the svnSeg in an order
 
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

 loop: 
      ldi r16, C
	  OUT portb, r16
	  CALL DELAY
	  OUT portb, r17
	  CALL DELAY

	  ldi r16, B
	  OUT portb, r16
	  CALL DELAY
	  OUT portb, r17
	  CALL DELAY

	  ldi r16, A
	  OUT portb, r16
	  CALL DELAY
	  OUT portb, r17
	  CALL DELAY

	  ldi r16, F
	  OUT portb, r16
	  CALL DELAY
	  OUT portb, r17
	  CALL DELAY

	  ldi r16, E
	  OUT portb, r16
	  CALL DELAY
	  OUT portb, r17
	  CALL DELAY

	  ldi r16, D
	  OUT portb, r16
	  CALL DELAY
	  OUT portb, r17
	  CALL DELAY

rjmp loop

  //delay subroutine
 DELAY:ldi R20,20
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