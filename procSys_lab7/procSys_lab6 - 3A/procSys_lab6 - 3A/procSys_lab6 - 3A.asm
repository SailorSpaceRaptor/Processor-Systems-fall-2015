/*
 * procSys_lab6___3A.asm
 *
 *  Created: 10/24/2015 2:16:50 PM
 *   Author: Jonathan
 */ 

 //this application serializes hex 0x38 and sends to PD 1

 //set outputs and value to be sent
 sbi DDRD, 1
 ldi r20, 0x38

 CLC
 ldi r16, 8
 sbi PORTD, 1

 L1: ror r20
     brcs ONE
	 cbi PORTD, 1
	 rjmp NXT
 ONE:sbi PORTD, 1
 NXT: DEC r16
      BRNE L1
	  sbi PORTD, 1
	  
 here: jmp here 

