    .global main

main:

    movw r0, #:lower16: a
    movt r0, #:upper16: a

    mov r1, #6  @r1 = 6
    str r1, [r0, #5*4] @a[5]=6

    movw r1, #:lower16: i
    movt r1, #:upper16: i

    mov r2, #0
    str r2, [r1] @i = 0



for:

    cmp r2, #10 @r2 - 10 >= 0?
    bge L1

body: 

    add r3, r2, #1 @r3 = i + 1
    mov r5, #4
    mul r4, r2, r5 @r4 = 4 * i(array offset)
    str r3, [r0, r4]

    add r2, #1     @i++
    str r2, [r1]
    b for

L1:
    nop


    .data
b:  .hword 1 // x/1dh &b
    .hword 2 // x/4dh &b
    .hword 3
    .hword 4

or:
b:  .hword 1, 2, 3, 4

    .align 2
a:  .skip 40

i:  .skip 4
/*for(int i = 0; i < 10; i ++)
{
    a[i] = i + 1;
} */
