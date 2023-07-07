    .global main

main:
    movw r0, #:lower16:v2
    movt r0, #:upper16:v2

    movw r1, #:lower16:B
    movt r1, #:upper16:B

    ldrb r2, [r1]
    strb r2, [r0]


    .data
v2: .byte 28
    .align 1
B:  .byte  24
    .align 1
