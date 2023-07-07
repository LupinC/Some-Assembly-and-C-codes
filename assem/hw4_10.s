    .global main

main:
    movw r0, #:lower16:v8
    movt r0, #:upper16:v8

    movw r1, #:lower16:v9
    movt r1, #:upper16:v9

    movw r2, #:lower16:v10
    movt r2, #:upper16:v10

    ldr r3, [r0]
    ldr r4, [r1]

    add r3, r3, r4    
    str r3, [r2]

    .data
v8: .4byte -123456
v9: .4byte 544
v10: .4byte 987
    .align 4
    