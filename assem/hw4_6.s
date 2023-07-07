    .global main

main:
    movw r0, #:lower16:v6
    movt r0, #:upper16:v6

    movw r1, #:lower16:S
    movt r1, #:upper16:S

    ldrsh r2, [r1]
    mov r3, r2
    strh r3, [r0]


    .data
    .align 1
v6: .hword -98
    .align 1
S:  .hword -12
