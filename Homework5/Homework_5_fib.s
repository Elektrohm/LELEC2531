/************* CODE SECTION *************/
@Name Théo Denis
.text   @ the following is executable assembly

@ Ensure code section is 4-byte aligned:
.balign 4

@ main is the entry point and must be global
.global main
B main          @ begin at main

/************* MAIN SECTION *************/
main:
	MOV  R0, #8  		@ n = 8
	MOV  R1, #1			@ old = 1
	MOV  R2, #0			@ cur = 0
	CMP  R0, #0			@ n == 0 ?
	BEQ  done
loop:
	ADD  R2, R2, R1     @ Fn = F_{n-1} + F_{n-2}
	SUB  R1, R2, R1     @ F_{n-1} = F_n - F_{n-2}
	SUBS R0, R0, #1		@ n = n-1
	BNE  loop			@ infinite loop
done:
	MOV  R0, R2         @ return value
	BX   LR	     		@ exit cleanly

.end     @ end of code