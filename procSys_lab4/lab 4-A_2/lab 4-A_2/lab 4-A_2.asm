/*
 * lab_4_A_2.asm
 *
 *  Created: 9/26/2015 1:58:53 PM
 *   Author: Jonathan
 */ 

 //Data space reservation for num1, num2 and sum 
 .dseg 
 .org 0x200 
 num1: .byte 4 
 num2: .byte 4 
 sum: .byte 4

 //Code starts here
  .cseg 
  .org 0x00

  /* Add your code here*/ 
  //Load two sets of 4 bytes number, num1 and num2 to the data location 
  //num1 = 0x0200, num1+1 = 0x0201, num1+2 = 0x0202, num1+3 = 0x0203 
  //num2 = 0x0204, so on. 
  ldi r16, $00 
  ldi r17, $02
  out sph, r17
  out spl, r16//Use directive instead of using direct addresses


  EQU num1 = 0x30
  EQU num2 = 0x4A
  ldi r18, num1
  ldi r19, num2

  push r18
  push r19
  

  jmp start

  .org 0xF6 
  start: lds r0,num1 ; fetch the lsb of num1 
  lds r1,num2 ; fetch the lsb of num2 
  add r0,r1 ; add the lsbs of two numbers

  /* Add your code here*/ 
  push r0 //push summation value onto stack

  lds r0,num1+1 ; fetch the second lsb of num1 
  lds r1,num2+1 ; fetch the second lsb of num2 
  adc r0,r1 ; add two bytes together 
  sts sum+1,r0 ; save the sum of second lsbs

  /* Add your code here*/ 
  pop sum //push summation value onto stack

  //pop each summation byte to store at the data location sum

  // end of the program