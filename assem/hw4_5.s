    .global main

main:
    movw r0, #:lower16:v5
    movt r0, #:upper16:v5

    mov r1, #3456

    strh r1,[r0]

    .data
v5: .skip 2
    .align 2
