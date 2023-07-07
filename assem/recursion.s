    .global main

main:






fact:
    @ n is at [fp, #8]
    push{lr}
    push{fp}
    mov fp, sp

    ldr r0, [fp, #8]
    cmp r0, #0
    bne continue

    mov r1, #1
    b return

continue:
    sub r0, #1  @n -1
    push{r0}
    bl fact
    add sp, #4  @r1 = (n-1)!



return:

    pop{fp}
    pop{lr}
    bx lr