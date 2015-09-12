/*
 * lab1_2_7.asm
 *
 *  Created: 9/12/2015 2:56:48 PM
 *   Author: Jonathan
 */ 
 ldi r16, 0x43
 sts 0x200, r16
 ldi r17, 0x12
 sts 0x201, r17
 ldi r18, 0x8F
 sts 0x202, r18
 ldi r19, 0
 add r19, r16
 add r19, r17
 add r19, r18
 sts 0x210, r19
 here: jmp here


