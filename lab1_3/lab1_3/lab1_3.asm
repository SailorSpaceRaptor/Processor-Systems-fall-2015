/*
 * lab1_3.asm
 *
 *  Created: 9/13/2015 12:14:38 PM
 *   Author: Jonathan
 */ 
 ldi r20, 0x05
 ldi r21, 0x0B
 ldi r22, 0x14
 ldi r23, 0x0E
 com r20
 com r21
 com r22
 com r23
 here: jmp here

