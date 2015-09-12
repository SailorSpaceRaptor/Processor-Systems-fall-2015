/*
 * lab1_2_6.asm
 *
 *  Created: 9/12/2015 2:48:03 PM
 *   Author: Jonathan
 */ 
  ldi r16, 0x43
 sts 0x200, r16
 ldi r17, 0x12
 sts 0x205, r17
 ldi r18, 0x8F
 sts 0x20A, r18
 ldi r19, 10
 sub r16, r19
 sts 0x200, r16
 sub r17, r19
 sts 0x205, r17
 sub r18, r19
 sts 0x20A, r18
 here: jmp here

