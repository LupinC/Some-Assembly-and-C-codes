#include<stdio.h>
#include<stdlib.h>

struct node;
void enqueue(int);
int dequeue();
void free_queue();

int main()
{
    enqueue(3);
    enqueue(4);
    enqueue(5);
    int a = dequeue();
    int b = dequeue();
    printf("%d\n", a);
    printf("%d\n",b);
    free_queue();
}