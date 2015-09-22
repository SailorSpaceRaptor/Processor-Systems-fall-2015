/*
 * lab3_5.asm
 * 
 *  Created: 9/21/2015 6:14:35 PM
 *   Author: Jonathan
 */ 

 //this application subtracts 5 from data memory locations at 0x0100, 0x0105, and 0x010A storing the result in the same location
 

 
 //load values into registers then load into data space
 ldi r17, $71
 sts 0x0100, r17
 ldi r18, $F8
 sts 0x0105, r18
 ldi r19, $05
 sts 0x010A, r19

 //subtract 5 from each value and store in memory space
 subi r17, 5
 sts 0x0100, r17
 subi r18, 5
 sts 0x0105, r18
 subi r19, 5
 sts 0x010A, r19

 here: jmp here
