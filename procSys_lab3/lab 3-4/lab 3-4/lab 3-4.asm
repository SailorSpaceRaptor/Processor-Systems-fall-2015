/*
 * lab_3_4.asm
 *
 *  Created: 9/21/2015 7:03:56 PM
 *   Author: Jonathan
 */ 
 //this application adds 5 to data memory locations at 0x100, 0x101, 0x102, stores data and adds 5

 //load data into SRAM
 ldi r16,$51
 sts 0x100,r16
 ldi r16,$68
 sts 0x101,r16
 ldi r16,$05
 sts 0x102,r16

 //load counter
 ldi r17,3

 //use temp storage for memory location
 ldi xl,$00
 ldi xh,$01

 //this loop cycles through memory locations, 
 loop: ld r20,X
 ldi r25,5 //load register for use with adding
 add r20,r25 //add r25 to register X
 st X,r20 //temp store value of r20
 inc xl //increment xl by one to move onto next memory place
 dec r17 //decrement counter
 brne loop //if counter is not zero, 
 here: jmp here
