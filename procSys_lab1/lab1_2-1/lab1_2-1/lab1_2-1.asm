/*
 * lab1_2_1.asm
 *
 *  Created: 9/12/2015 3:25:18 PM
 *   Author: Jonathan
 */ 
 ldi r16, 0x04
 sts 0x000, r16
 ldi r17, 0x3D
 sts 0x001, r17
 ldi r18, 0x00
 sts 0x002, r18
 mov r2, r0
 mov r0, r1
 mov r1, r2
 here: jmp here


