/*
 * lab5_3_B.asm
 *
 *  Created: 10/5/2015 8:09:41 PM
 *   Author: Jonathan
 */ 
  //start stack pointer at the end of ram
 ldi r16, HIGH(RAMEND)
 out sph, r16
 ldi r16, LOW(RAMEND)
 out spl, r16

 //make B an output
 ldi r16, 0xff
 out DDRB, r16

 //this loop first outs each individual value then sums and shows the output in LEDs, it then flashes all lights before continuing into a new function
 loop: ldi r17, 0b00001010//define registers and numerals to be used
       ldi r18, 0b00001100
       ldi r19, 0b00000101
	   
	   //first addition op
	   ldi r23, 0b10101100
	   add r17, r18
	   OUT PORTB, r23
	   call DELAY
	   out PORTB, r17
	   ldi r17, 0b00001010 //revert r17 back
	   call DELAY
	   out PORTB, r16
	   call DELAY

	   //second addition op
	   ldi r23, 0b11000101
	   add r18,r19
	   out PORTB, r23
	   call DELAY
	   out PORTB, r18
	   ldi r18, 0b00001100 //revert r18 back
	   call DELAY
	   out PORTB, r16
	   call DELAY

	   //third addition op
	   ldi r23, 0b10100101
	   add r17, r19
	   OUT PORTB, r23
	   call DELAY
	   out PORTB, r17
	   ldi r17, 0b00001010 //revert r17 back
	   call DELAY
	   out PORTB, r16
	   call DELAY
	   
	   //first multiplication op
	   ldi r23, 0b01011100
	   mul r18, r19
	   out PORTB, r23
	   call DELAY
	   out PORTB, r0
	   ldi r18, 0b00001100 //revert r18 back
	   call DELAY
	   out PORTB, r16
	   call DELAY

	   //second multiplication op
	   ldi r23, 0b10101100
	   mul r18, r17
	   out PORTB, r23
	   call DELAY
	   out PORTB, r0
	   ldi r18, 0b00001100 //revert r18 back
	   call DELAY
	   out PORTB, r16
	   call DELAY

	   //third multiplication op
	   ldi r23, 0b10100101
	   mul r19, r17
	   out PORTB, r23
	   call DELAY
	   out PORTB, r0
	   call DELAY
	   out PORTB, r16
	   call DELAY
	   rjmp loop //loop back

//delay subroutine
 DELAY:ldi R20,150
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




