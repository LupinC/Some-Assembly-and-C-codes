#include<stdio.h>
#include<stdlib.h>

/*
*  THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING ANY
SOURCES OUTSIDE OF THOSE APPROVED BY THE INSTRUCTOR. Lupin Cai
*
*
*/

struct node {
    int value;
    struct node* next;
};


struct node* head = NULL;
struct node* tail = NULL;


void enqueue(int val) {
    // Allocate memory for the new node
    struct node* new_node = (struct node*)malloc(sizeof(struct node));
    new_node->value = val;
    new_node->next = NULL;

    // If the queue is empty, I set both head and tail to the new node
    if (head == NULL) {
        head = new_node;
        tail = new_node;
    }
    else {
        // Otherwise, I add the new node to the end of the queue
        tail->next = new_node;
        tail = new_node;
    }
}


int dequeue() {
    // Check if the queue is empty
    if (head == NULL) {
        return -1;
    }

    // Get the data from the head node
    int value = head->value;

    // Move the head pointer to the next node and free the memory for the old head
    struct node* old_head = head;
    head = head->next;
    free(old_head);

    // If the queue is now empty, set the tail pointer to NULL
    if (head == NULL) {
        tail = NULL;
    }

    return value;
}


void free_queue() {
    // Traverse the queue and free each node
    while (head != NULL) {
        struct node* node = head;
        head = head->next;
        free(node);
    }

    // Reset the head and tail pointers
    head = NULL;
    tail = NULL;
}

