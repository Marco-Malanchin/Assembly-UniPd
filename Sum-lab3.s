.text
@ Semplice funzione che calcola (r0+r1)^2 e salva il risultato in r0
sum_square: add r2, r0, r1
	    push {r2, lr}
	    mul r0, r2, r2
	    pop {r2, lr}
	    mov pc, lr
	

.global main
main:	mov r0, #5
	mov r1, #3
	push {r0-r1, lr}
	bl sum_square
	nop
	pop {r0-r1, lr}
	mov pc,lr
