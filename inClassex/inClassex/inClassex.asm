/*
 * inClassex.asm
 *
 *  Created: 10/16/2015 10:11:45 AM
 *   Author: tuf72637
 */ 


.EQU volt = 5

//set Y register
ldi r29, 0x02 //set Y high
ldi r28, 0x00 //set Y low

//load values
ldi r17, volt
ldi r18, 3

//take v^2, store in reg
L1: mov r19, r17
    mul r19, r17
    mov r21, r1
    mov r20, r0

	//take 3*v^2 store in reg
	mul r18, r20
    mov r21, r1
    mov r20, r0

	//take 2 * v store in reg
	ldi r18, 2
	mul r17, r18
    mov r23, r1
	mov r22, r0

	//subtract product 1 and product 2 add difference and 5 
	sub r20, r22
    ldi r18, 5
    add r20, r18

	//send to sram and increment location dec volt
    st Y+, r20
    dec r17
	BRNE L1

here: jmp here