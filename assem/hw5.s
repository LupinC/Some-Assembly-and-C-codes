/*
*  THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING ANY
SOURCES OUTSIDE OF THOSE APPROVED BY THE INSTRUCTOR. Lupin Cai
*
*
*/
    .global main

main:

    movw r0, #:lower16:a
    movt r0, #:upper16:a

    movw r1, #:lower16:b
    movt r1, #:upper16:b

    movw r2, #:lower16:q
    movt r2, #:upper16:q

    movw r3, #:lower16:r
    movt r3, #:upper16:r

    mov r4, #0     @r4 = 0
    str r4, [r2]   @q = r5 = 0

    ldr r6, [r0]   @r6 = a
    str r6, [r3]   @r = a

while:
    ldr r7, [r3]   @r7 = r
    ldrsh r8, [r1] @r8 = b
    cmp r7, r8     @r - b

    blt continue

    ldr r5, [r2]   @r5 = q
    add r5, #1     @q+1
    str r5, [r2]   @store it back

    ldr r7, [r3]   @r7 = r
    ldr r8, [r1]   @r8 = b
    sub r7, r7, r8 @r7 = r - b
    str r7, [r3]   @store it back

    b while


continue:
    movw r0, #:lower16:ans
    movt r0, #:upper16:ans

    ldr r9, [r2]    @r9 = q
    strh r9, [r0]   @ans = r9 = q

    ldr r0, [r2]    @q -> r0
    ldrsh r1, [r3]  @r -> r1

End:
    nop
    nop



    .data
a:  .4byte 86

b:  .2byte 11
    .align 2
q:  .skip 4

r:  .skip 4

ans:.skip 2
