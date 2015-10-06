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
	   OUT PORTB, r17 //load first four bit number
	   call DELAY
	   out portB, r18 //load second four bit number
	   call DELAY
	   add r18,r17 //add two numbers
	   out PORTB, r18 //show sum
	   call DELAY
	   out PORTB, r16
	   call DELAY
	   ldi r18, 0b00001100 //second addition operation
	   out PORTB, r18
	   call DELAY
	   out PORTB, r19
	   call DELAY
	   add r19, r18
	   out PORTB, r19
	   call DELAY
	   out PORTB, r16
	   call DELAY
	   ldi r19, 0b00000101
	   out PORTB, r17//third addition operation adds all three
	   call DELAY
	   out PORTB, r18
	   call DELAY
	   out PORTB, r19
	   call DELAY
	   add r19, r17
	   add r19, r18
	   out PORTB, r19
	   call DELAY
	   out PORTB, r16
	   //first multiplication operation
	   ldi r19, 0b00000101
	   out PORTB, r19
	   call DELAY
	   out PORTB, r18
	   call DELAY
	   MUL r19, r18
	   out PORTB, r0
	   call DELAY
	   ldi r19, 0b00000101
	   out PORTB, r16
	   call DELAY
	   out PORTB, r17 //second multiplication operation
	   call DELAY
	   out PORTB, r18
	   MUL r17, r18
	   out PORTB, r17
	   call DELAY
	   out PORTB, r16
	   call DELAY
	   //third multiplication operation
	   out PORTB, r17
	   call DELAY
	   out PORTB, r19
	   call DELAY
	   mul r19, r17
	   out PORTB, r19
	   CALL DELAY
	   out portb, r16
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




