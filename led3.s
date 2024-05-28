.bss

@ subroutine a disposizione
@ set_gpio : inizializza la GPIO
@ read_slides : leggere il valore impostato nei 4 switch e lo restituisce nei 4 bit meno significativi in R0
@ write_led : visualizza nei led i 4 bit meno significativi di R0
@ read_buttons : legge lo stato dei 2 pulsani e lo restituisce nei 2 bit meno significativi di R0.
@                 ogni bit corrisponde allo stato di un pulsante.


.text

.global main
main: 
	@ Salva i registri modificati
	push {r0,r1,lr}
	
	@ inizializza la GPIO
	bl set_gpio
	
	mov r1, #1  @ valore iniziale led

loop:   bl read_buttons  @ leggo lo stato dei pulsanti
        cmp r0, #1   @ è premuto dx ?
        bleq dx      @ salta verso sinistra
        cmp     r0, #2   @ è premuto sx?
	bleq sx 

        b loop

	@ Ripristina registri modificati
	pop {r0,r1,lr}
	@ Termina e ritorna dalla funzione main
	mov pc, lr


dx: @ legge il valore degli switch
	push {lr}
	bl read_slides

	@ e lo visualizza nei led
	bl write_led

	pop {lr}
	mov pc, lr

sx:	push {lr}
	bl read_slides @ legge il valore degli switch
	mov r8, #15 @ salvo un valore di confronto per cambiare lo stato dei led
	sub r0, r8, r0 @ modifico il valore attuale di r0 invertendo i valori
	bl write_led @ e lo visualizza nei led
	pop {lr}
	mov pc, lr
