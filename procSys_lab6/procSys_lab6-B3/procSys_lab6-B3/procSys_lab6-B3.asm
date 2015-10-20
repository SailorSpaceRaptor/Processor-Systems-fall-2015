/*
 * procSys_lab6_B3.asm
 *
 *  Created: 10/18/2015 1:21:05 PM
 *   Author: Jonathan
 */ 

 //this application calculates (PORTA + 4) * PORTB and sends results through PORTC and PORTD, numerals are signed numbers

//Set PORTA and PORTB to outputs
ldi r16, 0xFF
OUT DDRA, r16
OUT DDRB, r16

//load registers with values to be calculated
ldi r16, 34
NEG r16 //2s comp to make 34 negative
OUT PORTA, r16
ldi r16, 0xA7
OUT PORTB, r16
ldi r16, 0x04

//sum PORTA + 4 store in register
in r17, PORTA
add r16, r17

//multiply register by PORTB
IN r17, PORTB
MULS r16, r17 //MULS is signed multiplication

//send lower byte through PORTC send higher byte through PORTD
OUT PORTC, r0
OUT PORTD, r1

here: jmp here