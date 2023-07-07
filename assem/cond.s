    .global main

main: 

     movw r0, #:lower16:x
     movt r0, #:upper16:x

     movw r1, #:lower16:y
     movt r1, #:upper16:y

cond1:
     ldr r2, [r0] //r2 = x
     cmp r2, #10
     bge L1

cond2: 
     ldr r3,[r1]
     cmp r3, #5
     ble L1
     

     add r2, #1  // r2++
     str r2, [r0] //x = r2
     b L2

L1: 
     sub r1, #1 // r2 --
     str r2, [r0] //x = r2

L2: 
     
     str r2, [r1] // y = r2


    .data
x:  .word 5
y:  .skip 4

/*
if(x < 10 && y > 5){
     x++;
     y = 2*x;
}
else{
     x--;
     y = x;
} */


/* */