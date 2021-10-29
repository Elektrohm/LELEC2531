/************* CODE SECTION *************/
@Name Théo Denis
@Floating Point Addition
.text   @ the following is executable assembly                   

@ Ensure code section is 4-byte aligned: 
.balign 4

@ main is the entry point and must be global 
.global main    
b main          @ begin at main 

/************* FPNUMS ******************/
@ These addresses contain the two fp numbers to be added 

fpNum0:  .word   0x3f010000
fpNum1:  .word   0x477fffb0

 
/************* MAIN SECTION *************/
main:
    ldr r0, fpNum0      @ r0 = fpNum0  
    ldr r1, fpNum1      @ r1 = fpNum1 

@ Your Code goes here:
@ masking and shifting down exponents 
    LSR r2, r0, #23		@ r2[7:0] = exponent of r0
    LSR r3, r1, #23		@ r3[7:0] = exponent of r1
    
@ masking and appending leading 1 
/* can be perform with orr-ing with leading 1 and then shifting 
   left to delete exponent and sign bits */ 
    ORR r4, r0, #0x00800000
    ORR r5, r1, #0x00800000
    LSL r4, r4, #8		@ r4[31:8] = mantissa of r0
    LSL r5, r5, #8		@ r5[31:8] = mantissa of r1

@ comparing exponents and setting based on value
    SUBS r6, r2, r3 		@ r6 = r2 - r3 if r2 > r3
    MOVGE r7, r2		@ r7 = r2 if r2 >= r3
    MOVLT r7, r3		@ r7 = r3 if r2 < r3

@ right shifting mantissa by difference of exponents
    LSRGT r5, r5, r6		@ r5 = r5 >> r6
    SUBLT r6, r3, r2		@ r6 = r3 - r2 if r3 > r2
    LSRLT r4, r4, r6		@ r4 = r4 >> r6 
    
@ summing mantissas 
    ADDS  r8, r4, r5		@ r8 = r4 + r5

@ normalize the result in case of overflowing
    LSRCS r8, r8, #1		@ r8 = r8 >> 1
    ADDCS  r7, r7, #1 		@ r7 += 1
    
@ rounding result, do nothing because trunc is fine

@ strip leading 1 and merge everything 
@ R8 = mantissa, R7 = exponent, sign = 0 because work with positive
    LSL r8, r8, #1		@ r8 = r8 << 1 strip leading 1
    LSR r8, r8, #9		@ r8[22:0] = mantissa
    LSL r7, r7, #23		@ r7[31:23] = biased exponent
    ORR r0, r7, r8		@ r0 = sum in IEEE754 
    
    bx lr
.end     @ end of code