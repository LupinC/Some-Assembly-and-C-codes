    .global main

main:
    movw r0, #:lower16:v9
    movt r0, #:upper16:v9

    movw r1, #:lower16:L
    movt r1, #:upper16:L


    ldr r2, [r1]
    str r2, [r0]

    .data
v9: .4byte 798
    .align 4

L: .word 544
