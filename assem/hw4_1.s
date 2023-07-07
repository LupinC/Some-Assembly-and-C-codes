    .global main

main:
    movw r0, #:lower16:v1
    movt r0, #:upper16:v1
    mov r1, #76
    strb r1, [r0]

    .data
v1: .skip 1
    .align 1
