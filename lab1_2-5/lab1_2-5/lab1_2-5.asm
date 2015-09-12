/*
 * lab1_2_5.asm
 *
 *  Created: 9/12/2015 2:36:57 PM
 *   Author: Jonathan
 */ 
 ldi r16, 0x43
 sts 0x200, r16
 ldi r17, 0x12
 sts 0x201, r17
 ldi r18, 0x8F
 sts 0x202, r18
 ldi r19, 5
 add r16, r19
 sts 0x200, r16
 add r17, r19
 sts 0x201, r17
 add r18, r19
 sts 0x202, r18
 here: jmp here
  


