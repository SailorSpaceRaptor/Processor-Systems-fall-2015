/*
 * lab3_1.asm
 *
 *  Created: 9/15/2015 12:47:03 PM
 *   Author: Jonathan
 */ 

 //activity 1: this project loads SRAM with hex values and moves them from 0x100 ~ 0x102 to 0x200 ~ 0x202

 //load registers with values and port them to 0x100 ~ 0x102
 ldi r16, $A7
 sts 0x100, r16
 ldi r17, $69
 sts 0x101, r17
 ldi r18, $32
 sts 0x102, r18
 
 //load memory with values
 sts 0x200, r16
 sts 0x201, r17
 sts 0x202, r18

 //end progam and wait
 here: jmp here

