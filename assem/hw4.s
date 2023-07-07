/*
*  THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING ANY
SOURCES OUTSIDE OF THOSE APPROVED BY THE INSTRUCTOR. Lupin Cai
*
*
*/
.global main
.data

a:        .word -4567

.text

main:


/*******************************************************************
*
* Write the assembler instruction to each question after the
* CORRESPONDING LABEL:
*                       Q1, Q2, Q3, ..... Q10
* Define the variable for each question after the
* CORRESPONDING LABEL:
*                       v1, v2, v3, ..... v10
*
* The v1, v2,.. labels are towards the end of the file,
*
* *** Failure to do so will result in point dedections !!! ***
*******************************************************************/

/*******************************************************************
* Put your assembler instructions AFTER this line
*******************************************************************/

/**************************************************************************
* Define an uninitialized byte variable at label v1 (see the end of
* this file) and  write the assembler instruction at label Q1 to
* move the byte value 76 into this variable.
*
* Do NOT forget to SKIP some horizontal space (or use TAB) !!!
**************************************************************************/
Q1:
    movw r0, #:lower16:v1
    movt r0, #:upper16:v1
    mov r1, #76
    strb r1, [r0]   


/**************************************************************************
* Define an initialized byte variable at label v2 with initial value 28
* and write the assembler instructions at label Q2 to move the byte value
* at memory location B into this variable.
*
**************************************************************************/
Q2:
    movw r0, #:lower16:v2
    movt r0, #:upper16:v2

    movw r1, #:lower16:B
    movt r1, #:upper16:B

    ldrb r2, [r1]
    strb r2, [r0]



/**************************************************************************
* Define an initialized byte variable at label v3 with initial value -45
* and write the assembler instructions at label Q3 to move the byte value
* of the sum of v1 and v2
* into this variable.
**************************************************************************/
Q3:

    movw r0, #:lower16:v1
    movt r0, #:upper16:v1
    ldrb r3, [r0]

    movw r1, #:lower16:v2
    movt r1, #:upper16:v2
    ldrb r4, [r1]

    movw r2, #:lower16:v3
    movt r2, #:upper16:v3

    add r3, r3, r4
    strb r3,[r2]


/**************************************************************************
* Define an initialized byte variable at label v4 with initial value -15
* and write the assembler instructions at label Q4 to move the value
* from S to this variable - you should see -12 moved
**************************************************************************/
Q4:

    movw r0, #:lower16:v4
    movt r0, #:upper16:v4

    movw r1, #:lower16:S
    movt r1, #:upper16:S

    ldrsh r2, [r1]
    strb r2,[r0]


/**************************************************************************
* Define an uninitialized short variable at label v5 and write
* the assembler instructions at label Q5 to move the short value 3456
* into this variable.
**************************************************************************/
Q5:

    movw r0, #:lower16:v5
    movt r0, #:upper16:v5

    mov r1, #3456

    strh r1,[r0]


/**************************************************************************
* Define an initialized short variable at label v6 with initial value -98
* and write the assembler instructions at label Q6 to move the short value
* at memory location S into this variable - you should see -12 moved
**************************************************************************/
Q6:
    movw r0, #:lower16:v6
    movt r0, #:upper16:v6

    movw r1, #:lower16:S
    movt r1, #:upper16:S

    ldrsh r2, [r1]
    strh r2, [r0]

                 

/**************************************************************************
* Define an initialized short variable at label v7 with initial value -5432
* and write the assembler instructions at label Q7 to move the sum of
* v5 and v6
* into this variable.
**************************************************************************/
Q7:
    movw r0, #:lower16:v5
    movt r0, #:upper16:v5

    movw r1, #:lower16:v6
    movt r1, #:upper16:v6

    movw r2, #:lower16:v7
    movt r2, #:upper16:v7

    ldrsh r3, [r0]
    ldrsh r4, [r1]

    add r3, r3, r4
    strh r3, [r2]



/**************************************************************************
* Define an uninitialized int variable at label v8 and write the assembler
* instructions at label Q8 to move the int value -123456 into this variable.
**************************************************************************/
Q8:
    movw r0, #:lower16:v8
    movt r0, #:upper16:v8

    movw r1, #:lower16:-123456
    movt r1, #:upper16:-123456
    str r1,[r0]

/**************************************************************************
* Define an initialized int variable at label v9 with initial value 798
* and write the assembler instructions at label Q9 to move the int value
* at memory location L into this variable.
**************************************************************************/
Q9:
    movw r0, #:lower16:v9
    movt r0, #:upper16:v9

    movw r1, #:lower16:L
    movt r1, #:upper16:L


    ldr r2, [r1]
    str r2, [r0]


/**************************************************************************
* Define an initialized int variable at label v10 with initial value 987
* and write the assembler instructions at label Q10 to move the sum of
* v8 and v9
**************************************************************************/
Q10:
    movw r0, #:lower16:v8
    movt r0, #:upper16:v8

    movw r1, #:lower16:v9
    movt r1, #:upper16:v9

    movw r2, #:lower16:v10
    movt r2, #:upper16:v10

    ldr r3, [r0]
    ldr r4, [r1]

    add r3, r3, r4    
    str r3, [r2]
                   


Stop:	nop
	nop

/*************************************************
* Write your variable definitions here...
*
* Do NOT forget to SKIP some space (or use TAB) !!!
*************************************************/

.data

v1:     .skip 1
        
v2:     .byte 28

v3:     .byte -45

v4:     .byte -15
        
v5:     .skip 2
        
v6:     .2byte -98
        
v7:     .2byte -5432
        .align 2        
v8:     .skip 4

v9:     .4byte 798

v10:    .4byte 987
    



/*************************************************
* Don't touch the variables below this line
*************************************************/


        .skip  20
B:      .byte   24
        .skip   1
S:      .hword  -12
L:      .word   544

.end
