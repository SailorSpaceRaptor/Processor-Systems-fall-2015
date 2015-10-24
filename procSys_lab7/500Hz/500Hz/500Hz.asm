/*
 * _500Hz.asm
 *
 *  Created: 10/24/2015 12:53:13 PM
 *   Author: Jonathan
 */ 

  INIT:
// initialize the data ports - set all data ports as inputs
	ldi r16,0
	out DDRB,r16
	
	sbi DDRB, PB5

 .equ COUNT = 1022	// count
OUTERLOOP:	// outer loop
	ldi r16,COUNT%256	// r16, r17 off time count
	ldi r17,COUNT/256
	ldi r18,COUNT%256	// r18, r19 on time count
	ldi r19,COUNT/256
OFF_LOOP:
	subi r16,1	// decrement off time count
	sbci r17,0	// upper byte
	brne OFF_LOOP	// loop until zero
	sbi PORTB, PB5 //set PB5 to '1' 
ON_LOOP:
	subi r18,1	// decrement off time count
	sbci r19,0	// upper byte
	brne ON_LOOP	// loop until zero
	cbi PORTB, PB5 //set PB5 to '0'
               rjmp OUTERLOOP	// loop forever