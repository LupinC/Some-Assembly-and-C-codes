    .global main

main:
    movw r0, #:lower16:i
    movt r0, #:upper16:i
    movw r1, #:lower16:sum
    movt r1, #:upper16:sum

    mov r2, #1
    str r2, [r0]

for:
    cmp r2, #5
    bge continue

    ldr r3, [r1] //r3 = sum
    add r3, r3, r2  //r3 = sum + 1
    str r3, [r1] //sum = r3

action:
    add r2, #1
    str r2, [r0] // i = r2
    b for


continue:
    add r2, #2
    str r2, [r0] // i = i + 2



    .data
sum: .word 0
i:   .skip 4


/*for(int i = i; i < 5; i++){
    sum = sum + i;
} 
    i = i + 2;
*/
