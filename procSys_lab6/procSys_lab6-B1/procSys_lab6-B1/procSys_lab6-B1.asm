/*
 * procSys_lab6_B1.asm
 *
 *  Created: 10/15/2015 9:29:23 PM
 *   Author: Jonathan
 */ 
//Set PORTA and PORTB to outputs
ldi r16, 0xFF
OUT DDRA, r16
OUT DDRB, r16

//load registers with values to be calculated
ldi r16, 0xB4
OUT PORTA, r16
ldi r16, 0x31
OUT PORTB, r16
ldi r16, 0x04

//sum PORTA + 4 store in register
in r17, PORTA
add r16, r17

//multiply register by PORTB
IN r17, PORTB
MUL r16, r17

//send lower byte through PORTC send higher byte through PORTD
OUT PORTC, r0
OUT PORTD, r1

here: jmp here