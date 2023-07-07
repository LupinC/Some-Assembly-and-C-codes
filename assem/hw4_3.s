    .global main

main:
    movw r0, #:lower16:v1
    movt r0, #:upper16:v1
    ldrb r3, [r0]

    movw r1, #:lower16:v2
    movt r1, #:upper16:v2
    ldrb r4, [r1]

    movw r2, #:lower16:v3
    movt r2, #:upper16:v3

    add r3, r3, r4
    strb r3,[r2]

    .data
v1: .byte 76
    .align 1
v2: .byte 24
    .align 1
v3: .byte -45
    .align 1
    
