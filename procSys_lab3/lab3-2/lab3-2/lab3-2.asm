/*
 * lab3_2.asm
 *
 *  Created: 9/15/2015 1:21:35 PM
 *   Author: Jonathan
 */ 

 /*this program adds 200 to three hard coded numbers in base 10
  *and stores the sums at data memory locations 0x0200, 0x0205, and 0x020A
  *If there is a carry, store that carry in a memory address that is one byte lower
  */
  
  //load register with 200
   ldi r19, 200

   //load carry bit
   ldi r21, 1

  //load registers with numbers (base10) to be used
   ldi r16, 14
   ldi r17, 30
   ldi r18, 68

   //add values and store in memory
   add r16, r19
   sts 0x0200, r16
   add r17, r19
   sts 0x205, r17
   add r18, r19
   sts 0x20A, r18
BRCS STORE
	   	   //this label stores counter bit in SRAM
 STORE:sts 0x209, r21 
here: jmp here






