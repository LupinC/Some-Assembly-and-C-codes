    .global main

main:

    movw r0, #:lower16:a
    movt r0, #:upper16:a

    movw r1, #:lower16:b
    movt r1, #:upper16:b
    ldrsb r1, [r1]  //r1 = b


while:
    ldr r2, [r0]  //r2 = a
    cmp r2, r1  // if r2 > r1, then jump
    bgt continue
    add r2, #1
    str r2, [r0]
    b while


continue:
    movw r2, #:lower16:b
    movt r2, #:upper16:b
    add r1, #1 // r1 = b + 1
    strb r1, [r2]


    .data
a:  .word 5
b:  .byte 19


/*
while(a <= b)
{
    a++;
} */