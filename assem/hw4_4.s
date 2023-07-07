    .global main

main:
    movw r0, #:lower16:v4
    movt r0, #:upper16:v4

    movw r1, #:lower16:S
    movt r1, #:upper16:S

    ldrsb r2, [r1]
    strb r2,[r0]

    .data
v4: .byte -15
    .align 1
S:  .hword -12
