/*
*  THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING ANY
SOURCES OUTSIDE OF THOSE APPROVED BY THE INSTRUCTOR. Lupin Cai
*
*
*/
    .global main

rem:
    @ r in [fp, #-8]
    @ q in [fp, #-4]
    @ b in [fp, #8] 
    @ a in [fp, #12] 
    @ return in r1
    push {lr}
    push {fp}
    mov fp, sp

    mov r0, #0
    push {r0}

    ldr r0, [fp, #12]
    push {r0}

while: 
    
    ldr r2, [fp,#-8]    @r2 = r
    ldr r3, [fp, #8]    @r3 = b
    cmp r2, r3          @r >= b?
    blt remContinue

                        @don't need q

    ldr r2, [fp, #-8]    @r = r-b
    sub r2, r2, r3
    str r2, [fp, #-8]

    b while

remContinue: 
    ldr r1, [fp, #-8]
    add sp, #8
    pop {fp}
    pop {lr}
    bx lr

gcd: 
    @ r in [fp, #-4]
    @ b in [fp, #8] 
    @ a in [fp, #12] 
    @ return in r1
    push {lr}
    push {fp}
    mov fp, sp

    sub sp, #4          @r0 = b
    ldr r0, [fp, #8]
    cmp r0, #0          @b = 0?
    bne gcdCont

    ldr r1, [fp, #12]   @r1 = a
    add sp, #4          
    pop {fp}
    pop {lr}
    bx lr

gcdContinue:
    ldr r0, [fp, #8]    @r0 = b
    ldr r1, [fp, #12]   @r1 = a
    push {r1}
    push {r0}
    bl rem              
    add sp, #8          @sp, 2 space up
    str r1, [fp, #-4]   

    ldr r0, [fp, #8]
    push {r0}
    push {r1}
    bl gcd
    add sp, #8

    ldr r1, [r1]
    
    add sp, #4
    pop {fp}
    pop {lr}
    bx lr

main:
    push {lr}
    push {fp}
    mov fp, sp

    movw r0, #:lower16:a    @r0 = a
    movt r0, #:upper16:a

    movw r1, #:lower16:b    @r1 = b
    movt r1, #:upper16:b

    push {r0}
    push {r1}
    bl gcd
    add sp, #8

    movw r2 #:lower16:ans
    movt r2, #:upper16:ans

    str r1, [r2]            

End:
    nop
    nop


.data
a:      .4byte 70
b:      .4byte 20
ans:    .skip 4

