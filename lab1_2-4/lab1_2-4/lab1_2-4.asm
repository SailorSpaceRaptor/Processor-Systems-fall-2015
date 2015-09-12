/*
 * lab1_2_4.asm
 *
 *  Created: 9/12/2015 3:08:01 PM
 *   Author: Jonathan
 */ 
 ldi r16, 1
 sts 0x200, r16
 ldi r17, 3
 sts 0x205, r17
 ldi r18, 5
 sts 0x20A, r18
 here: jmp here

