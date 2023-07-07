    .global main

square:
    @[sp, #4] contains c
    @return r1
    push{lr}    //saves the lr
    push{fp}    //saves the prev fp
    mov fp, sp  //changes the fp to match


    ldr r0, [fp, #8]    // r0 = c
    mul r1, r0, r0      // r1 = c^2

    pop{fp}     //restore old fp
    pop{lr}     //restore lr
    bx lr

sum:
    @[fp, #12] contains x
    @[fp, #8] contains y
    @[fp, #-4] contains z
    @[sp] contains w
    @return in r2
    push{lr}
    push{fp}

    mov fp, sp


    sub sp, #4  @create local variable for z
    mov r0, #7
    push{r0}    // inits w


    ldr r0, [fp, #12]    @r0  = x
    push {r0}
    bl square
    add sp, #4


    str r1,[fp,#-4] @z = x^2

    ldr r0, [fp, #8] @ro = y
    push {r0}
    bl square
    add sp, #4  @r1 = y^2

    str r1, [sp]    @w = y^2

    ldr r0, [fp, #-4]    @r0 = z
    ldr r1, [fp, #-8]    @r1 = w
    add r2, r0, r1  @r2 = z + w


    add sp, #8  //rmw z and w from stack
    pop{fp}
    pop{lr}
    bx lr




main:
    push{lr}
    push{fp}

    movw r0, #:lower16:a
    movt r0, #:upper16:a

    ldr r0, [r0]

    movw r1, #:lower16:b
    movt r1, #:upper16:b

    ldr r1, [r1]

    push {r0} @push a to the stack
    push {r1}   @push b to the stack

    bl sum

    add sp, #8 @(2 4byte chunk)

    movw r0, #:lower16:ans
    movt r0, #:upper16:ans

    str r2, [r0]
    .data

a:      .4byte 5
b:      .4byte 14
ans:    .skip 4



/*
int square(x){
    return x*x;
}

int sum(int x, int y){
    int w  = 7
    int z = square(x);
    w = square(y);
    int ret = z+w;
    return ret;
} */
