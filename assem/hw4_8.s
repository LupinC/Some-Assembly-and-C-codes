    .global main

main:
    movw r0, #:lower16:v8
    movt r0, #:upper16:v8

    movw r1, #:lower16:-123456
    movt r1, #:upper16:-123456

    str r1, [r0]

    .data
v8: .skip 4
    .align 4
