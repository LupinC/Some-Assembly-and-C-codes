    .global main

main:
    bl func
    bl func
    movw r0, #:lower16:i
    movt r0, #:upper16:i
    mov r1, #5
    str r1, [r0]
    b End


func:
    push{lr}

    movw r0, #:lower16:i
    movt r0, #:upper16:i

    ldr r1, [r0]
    add r1, #1
    str r1, [r0]

    @mov r12, lr
    bl other
    pop{lr}
    @mov lr, r12 //save and restore the link register
    mov pc, lr

other:
    push{lr}
    movw r0, #:lower16:i
    movt r0, #:upper16:i

    ldr r1, [r0]
    sub, r1, #1
    str r1, [r0]
    @mov pc, lr
    pop{lr}
    bx

End:
    nop


    .data
i:  .word 0
j:  .word 10
/*
int i = 0;
int j = 10;

void func(){
    i++;
    other();
} 

void other(){
    j--;
}

int main(){
    func();
    i = 5;
}*/
