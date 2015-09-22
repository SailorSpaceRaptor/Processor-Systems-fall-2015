/*
 * lab3_6.asm
 *
 *  Created: 9/21/2015 6:42:53 PM
 *   Author: Jonathan
 */ 
//this application writes a sequence of instructions to add three numbers stored at 0x0100, 0x0101 and 0c0102 and stores the sum at data memory location 0x0110

//load registers with data and store in sram
ldi r16, $10
sts 0x100, r16
ldi r17, $EA
sts 0x0105, r17
ldi r18, $36
sts 0x010A, r18

//load dummy register for addition, not necessary, more just stylistic choice
ldi r19, $00

//additions
add r19, r16
add r19, r17
adc r19, r18 //final addition requires carry because total comes out to decimal 304
sts 0x0110, r19

here: jmp here

