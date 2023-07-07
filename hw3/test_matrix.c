#include<stdio.h>
#include<stdlib.h>


typedef struct {
    int nrows; 
    int ncols; 
    int **array;
} matrix;

matrix* matrix_sum(const matrix*, const matrix*);
matrix* matrix_prod(const matrix*, const matrix*);


int main() {
    int row1[] = {1, 2, 3};
    int row2[] = {4, 5, 6};
    int row3[] = {7, 8, 9};
    int* arr1[] = {row1, row2, row3};
    matrix m1 = {3, 3, arr1};

    int row4[] = {1,2,3};
    int row5[] = {4,5,6};
    int row6[] = {7,8,9};
    int* arr2[] = {row4, row5, row6};
    matrix m2 = {3, 3, arr2};

    matrix* m3 = matrix_sum(&m1, &m2);

    
        printf("Sum of matrices m1 and m2:\n");
        for (int i = 0; i < m3->nrows; i++) {
            for (int j = 0; j < m3->ncols; j++) {
                printf("%d ", m3->array[i][j]);
            }
            printf("\n");
        }
    
    int row7[] = {1,2,3};
    int row8[] = {4,5,6};
    int* arr3[] = {row7, row8};
    matrix m4 = {2,3,arr3};

    int row9[] = {8,9};
    int row10[] = {6,7};
    int row11[] = {4,5};
    int* arr4[] = {row9,row10,row11};
    matrix m5 = {3,2,arr4};

    matrix* m6 = matrix_prod(&m4, &m5);

    
        printf("Product of matrices m4 and m5:\n");
        for (int i = 0; i < m6->nrows; i++) {
            for (int j = 0; j < m6->ncols; j++) {
                printf("%d ", m6->array[i][j]);
            }
            printf("\n");
        }
    


    free(m3);
    free(m6);
 

    return 0;
}



