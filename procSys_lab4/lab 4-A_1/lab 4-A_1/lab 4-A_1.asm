/*
 * lab_4_A_1.asm
 *
 *  Created: 9/22/2015 1:33:00 PM
 *   Author: Jonathan
 */ 

//This application first sets stack pointer to $19D and then puts values into 
//$19D, $19C, $19B, $19A, $199, and $198 it then pops each stack location into registers r20 - r25

//initialize stack pointer at $19D
ldi r16, $9D 
ldi r17, $01
out sph, r17
out spl, r16   

//load values into registers
ldi r18, $42
ldi r19, $05
ldi r20, $20
ldi r21, $0A
ldi r22, $0E
ldi r23, $0B 

//push values onto stack (increments)
push r18
push r19
push r20
push r21
push r22
push r23

//pop values off the stack (decrements)
pop r20
pop r21
pop r22
pop r23
pop r24
pop r25

here: jmp here

