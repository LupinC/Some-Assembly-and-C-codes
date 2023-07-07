    .global main

    main:
        mov r0, #10
        push{r0}
        mov r0, #8
        push{r0}
        mov r0, #9
        push{r0}
        @sp: stack pointer
        pop{r1} @pop the top to r1
        pop{r2}

    .data
