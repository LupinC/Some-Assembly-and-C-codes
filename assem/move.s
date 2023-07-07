    .global main

main:
    //mov r0, #0xabcd // immeediate value, or a direct value
    //mov r1, #1354
    //mov r2, #'A'

    //mov r0, #0x5678
    //mov r0, #0x1234

    //mov r3, #0x1234
    //mov r3, #0x5678
    
    movw r1, #:lower16:x
    movt r1, #:upper16:x

    //Direct move: move r0 to r1
    //mov r0, r1

    ldrsb r0, [r1]

    movw r1, #:lower16:y
    movt r1, #:upper16:y

    ldrsb r1, [r1]





    .data
x: .byte 10   //char with init value 10
y: .2byte -4000 // short with init value -4000
z: .4byte 1000000 // int with init value 1000000
w: .byte 250


