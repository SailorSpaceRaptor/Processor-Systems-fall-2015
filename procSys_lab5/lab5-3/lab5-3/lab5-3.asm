/*
 * lab5_3.asm
 *
 *  Created: 10/5/2015 12:15:25 PM
 *   Author: Jonathan
 */ 

 //this application uses PWM to toggle all the bits of I/O register port every second

 //start stack pointer at the end of ram
 ldi r16, HIGH(RAMEND)
 out sph, r16
 ldi r16, LOW(RAMEND)
 out spl, r16

 //set up portB as output
 ldi r16, 0xFF
 out DDRB, r16
 
 //set up counter and two loops
 INF_LOOP: ldi r17, 8
 ldi r16, 0b00000001
 LOOP: out PORTB, r16
 call DELAY
 lsl r16
 out PORTB, r16
 dec r17
 BRNE LOOP
 rjmp INF_LOOP
  
DELAY:ldi R20,32
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
