/*
 * procSys_lab6_A3.asm
 *
 *  Created: 10/18/2015 1:53:44 PM
 *   Author: Jonathan
 */ 

 //set stack pointer
 ldi r16, HIGH(RAMEND)
 OUT sph, r16
 ldi r16, LOW(RAMEND)
 OUT spl, r16

 //set inputs and outputs
 ldi r16, 0xFF
 OUT DDRB, r16
 OUT DDRD, r17
 OUT PORTD, r16 //set pull up

 CASE: SBIS PIND, 0
        CALL F1

        SBIS PIND, 1
        CALL F2

        SBIS PIND, 2
        CALL F3

        SBIS PIND, 3
        CALL F4
RJMP CASE
 

 //function 1
 F1: ldi r16, 0x45
     OUT PORTB, r16
	 CALL DELAY
     ROR r16
     OUT PORTB, r16
	 CALL DELAY
     ROR r16
     OUT PORTB, r16
	 CALL DELAY
     ROR r16
     OUT PORTB, r16
	 CALL DELAY
	 SBIC PIND, 0
	 RET
	 RJMP F1
 
 //function 2
 F2: ldi r16, 0x45
     OUT PORTB, r16
	 CALL DELAY
     ROL r16
     OUT PORTB, r16
	 CALL DELAY
     ROL r16
     OUT PORTB, r16
	 CALL DELAY
     ROL r16
     OUT PORTB, r16
	 CALL DELAY
	 SBIC PIND, 1
	 RET
	 RJMP F2
 
 //function 3
 F3: CLR r2
     OUT PORTB, r2
	 CALL DELAY
     LDI r21, 0xFF
     OUT PORTB, r21
	 CALL DELAY
     EOR r2, r21
     OUT PORTB, r2
	 CALL DELAY
	 SBIC PIND, 2
	 RET
	 RJMP F3

 //function 4
F4: CLR R10
    COM R10
    OUT PORTB, R10
	CALL DELAY
    LDI R16, 0xAA
    OUT PORTB, R16
	CALL DELAY
    EOR R10, R16
    OUT PORTB, r10
	CALL DELAY
	SBIC PIND, 3
	RET
	RJMP F4

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

  
