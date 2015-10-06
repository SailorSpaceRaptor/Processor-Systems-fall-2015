/*
 * bitTest.asm
 *
 *  Created: 10/5/2015 2:52:44 PM
 *   Author: Jonathan
 */ 
 ldi r18, 0xff
 out DDRB, r18
 ldi r17, 8
 INF_LOOP: ldi r16, 0b00000001
 out PORTB, r16
 LOOP:lsl r16
 out PORTB, r16
 dec r17
 BRNE LOOP
 rjmp INF_LOOP