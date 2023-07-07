#include <stdio.h>
#include <stdlib.h>

/*
*  THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING ANY
SOURCES OUTSIDE OF THOSE APPROVED BY THE INSTRUCTOR. Lupin Cai
*
*
*/

typedef struct {
    int nrows; 
    int ncols; 
    int **array;
} matrix;

matrix* matrix_sum(const matrix* m1, const matrix* m2) {
    // Check if the two matices have the same size
    if (m1->nrows != m2->nrows || m1->ncols != m2->ncols) {
        fprintf(stderr, "Addition dimension mismatch: m1 is %d by %d and m2 is %d by %d\n", m1->nrows, m1->ncols, m2->nrows, m2->ncols);
        return NULL;
    }

    // Allocate memory for the ouptut matrix
    matrix* result = (matrix*) malloc(sizeof(matrix));
    result->nrows = m1->nrows;
    result->ncols = m1->ncols;
    result->array = (int**) malloc(result->nrows * sizeof(int*));
    for (int i = 0; i < result->nrows; i++) {
        result->array[i] = (int*) malloc(result->ncols * sizeof(int));
    }

    // Compute the sum of the matrices
    for (int i = 0; i < result->nrows; i++) {
        for (int j = 0; j < result->ncols; j++) {
            result->array[i][j] = m1->array[i][j] + m2->array[i][j];
        }
    }

    return result;
}

matrix* matrix_prod(const matrix* m1, const matrix* m2) {
    // Check if the number of cols from m1 matches the number of rows from m2
    if (m1->ncols != m2->nrows) {
        fprintf(stderr, "Multiplication dimension mismatch: m1 is %d by %d and m2 is %d by %d\n", m1->nrows, m1->ncols, m2->nrows, m2->ncols);
        return NULL;
    }

    // Allocate memory for the output matrix
    matrix* result = (matrix*) malloc(sizeof(matrix));
    result->nrows = m1->nrows;
    result->ncols = m2->ncols;
    result->array = (int**) malloc(result->nrows * sizeof(int*));
    for (int i = 0; i < result->nrows; i++) {
        result->array[i] = (int*) malloc(result->ncols * sizeof(int));
    }

    // Compute the product of the matrices
    for (int i = 0; i < result->nrows; i++) {
        for (int j = 0; j < result->ncols; j++) {
            int sum = 0;
            for (int k = 0; k < m1->ncols; k++) {
                sum = sum + m1->array[i][k] * m2->array[k][j];
            }
            result->array[i][j] = sum;
        }
    }

    return result;
}