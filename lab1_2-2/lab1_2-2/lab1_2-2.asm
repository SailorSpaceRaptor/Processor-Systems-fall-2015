/*
 * lab1_2_2.asm
 *
 *  Created: 9/12/2015 3:42:29 PM
 *   Author: Jonathan
 */ 
 ldi r16, 0x04
 sts 0x0200, r16
 ldi r17, 0x3D
 sts 0x0201, r17
 ldi r18, 0x00
 mov r18, r16
 mov r16, r17
 sts 0x0201, r16
 mov r17, r18
 sts 0x0200, r17
 clr r18
 here: jmp here

