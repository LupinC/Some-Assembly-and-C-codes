    .global main

main:
    movw r0, #:lower16:v5
    movt r0, #:upper16:v5

    movw r1, #:lower16:v6
    movt r1, #:upper16:v6

    movw r2, #:lower16:v7
    movt r2, #:upper16:v7

    ldrsh r3, [r0]
    ldrsh r4, [r1]

    add r3, r3, r4
    str r3, [r2]
    
    .data
v5: .2byte 3456
    .align 2
v6: .2byte -12
    .align 2
v7: .4byte -5432
    .align 4
