/*
 * lab4_B_1.asm
 *
 *  Created: 9/26/2015 2:16:12 PM
 *   Author: Jonathan
 */ 

.ORG 0
LDI R16,HIGH(RAMEND)  ;load SPH
OUT SPH,R16
LDI R16,LOW(RAMEND)  ;load SPL
OUT SPL,R16
LDI  R20,0xFF ;R20 = 0xFF
OUT  DDRA,R20  ;DDRA = R20 (Port A output)
LDI R21, 0xFF 
OUT DDRB, R21 ;DDRB = R21 (Port B output)
LDI r22, 0xFF
OUT DDRC, R22 ;DDRC = R22 (Port C output)
BACK:
 LDI  R16,0x55  ;load R16 with 0x55
OUT PORTA, R16  ;send 55H to port A
OUT  PORTB,R16  ;send 55H to port B
OUT PORTC, R16  ;send 55H to port C
CALL DELAY  ;time delay
LDI  R16,0xAA  ;load R16 with 0xAA
OUT  PORTA, R16 ;send 0xAA to port A
OUT  PORTB,R16  ;send 0xAA to port B
OUT PORTC, R16 ; send 0xAA to port C
CALL DELAY  ;time delay
RJMP BACK  ;keep doing this indefinitely
;——————  this is the delay  subroutine
DELAY:
LDI  R20,0x03 ;R20 = 03,the counter
AGAIN:
NOP	 ;no operation wastes clock cycles
NOP
DEC  R20
BRNE AGAIN  ;repeat until R20 becomes 0
RET	 ;return to caller

