/*
 * procSys_lab6_B4.asm
 *
 *  Created: 10/18/2015 3:25:10 PM
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
 RJMP CASE

 //function 1
 F1: LDI R16, 10
     LDI R17, 20
     LDI R18, 0xB9
     MUL R16, R17
     ADD R16, R18
     OUT PORTB, R0
     call DELAY
     OUT PORTB, R1
     call DELAY
	 SBIC PIND, 0
	 RET
rjmp F1

 //function 2
 F2: LDI R19, 19
     SUBI R19, 10
     LDI R30, 0xA5
     MUL R30, R19
     OUT PORTB, R0
     call DELAY
     OUT PORTB, R1
     call DELAY
	 SBIC PIND, 1
	 RET
rjmp F2

 //delay subroutine
 DELAY:ldi R20,75
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