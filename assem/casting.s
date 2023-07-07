.global main

main: 
    mov r0, #20
    mov r1, #65

    add r2, r0, r1
    add r2, #1 //increament by 1


    movw r0, #:lower16:a  //put a in r0
    movt r0, #:upper16:a

    ldr r1,[r0];   //r1 = r0
    add r1,r1,#1   // r1 ++
    str r1,[r0]  //r1 -> r0



    
//x: .byte 10 //char with value 10
//   .align 1 // the next address will be divisible by 2^1

//y: .2byte -4000 //short with value -4000

   .data
a: .word 34
b: .word -40  // 4byte
c: .hword 2375 // 4byte
d: .byte 'T'
   .skip 1 //same thing as .align
e: .skip 4 // same thing as int e;
f: .word 0x12345678
