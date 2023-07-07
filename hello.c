#include<stdio.h>

int main()
{
    //Signed and unsigned
    int i = 2;
    //unsigned 
    unsigned int ui = 2;

    int arr[10]={1,2,3,4,5,6,7,8,9,10};

    for (int i = 0; i<10; i++)
    {
        arr[i] = i*i;
    }

    for(int i = 0; i < 10; i++){
        printf("%d", arr[i]);
    }

    char string[1000] = "Hello World!"; 
    
    printf("%s\n", string);
}