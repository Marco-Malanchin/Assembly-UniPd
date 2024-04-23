.data
  addr_n: .word 10 @ Word in memoria con il valore di n
.bss
  addr_sum: .skip 4 @ Word in memoria dove salvare il valore finale
.text
.global main
  main:
    @ r0: contiene la somma parziale
    @r1: contiene il contatore
    @2: contiene il quadrato calcolato in ogni iterazione (r2 = r1*r1)
    @r3: contiene il valore n
    @r4: contiene l'indirizzo in memoria di n
    @r5: contiene l'indirizzo in memoria di sum
    mov r0,#0
    mov r2,#0
    ldr r4, =addr_n
    ldr r3, [r4]
    ldr r5, =addr_sum
    mov r1, #1
    @@@ INSERIRE IL CODICE MANCANTE
    @@@ Inizializzazione variabili e ciclo for
  loop:
    mul r2, r1,r1
    add r0,r0,r2
    add r1,r1, #1
    cmp r1,r3
    bls loop
    @@@ Parte principale del loop
    @@@ Verifica fine ciclo for:
    @@@ 1. salto a loop per ripetere
    @@@ 2. oppure continua dritto se il ciclo for è terminato

    @@@ Parte finale del programma
    str r0,[r5]
    mov pc, lr
