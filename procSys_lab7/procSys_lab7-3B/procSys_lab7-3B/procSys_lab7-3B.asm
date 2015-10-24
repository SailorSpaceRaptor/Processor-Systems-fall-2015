/*
 * procSys_lab7_3B.asm
 *
 *  Created: 10/24/2015 2:41:24 PM
 *   Author: Jonathan
 */ 


  //this application serializes hex 0x38 and sends to PORTD, when a 1 is sent, PD1 goes high, when a 0 is sent, PD4 goes high

  //set stack
 ldi r16, HIGH(RAMEND)
 out sph, r16
 ldi r16, LOW(RAMEND)
 out spl, r16

 //set outputs and value to be sent
 sbi DDRD, 1
 sbi DDRD, 4
 ldi r18, 0x38

 CLC
 ldi r16, 8
 sbi PORTD, 1

 L: ror r18
     brcs ONE
	 cbi PORTD, 1
	 sbi PORTD, 4
	 CALL DELAY
	 cbi PORTD, 4
	 CALL DELAY
	 rjmp NXT
 ONE:
     cbi PORTD, 4
     sbi PORTD, 1
	 CALL DELAY
	 cbi PORTD, 1
	 CALL DELAY  
 NXT: 
     DEC r16
     BRNE L
	  sbi PORTD, 1
	  
 here: jmp here 

 //delay subroutine
 DELAY:ldi R20,50
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