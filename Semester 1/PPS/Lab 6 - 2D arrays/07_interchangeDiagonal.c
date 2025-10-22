#include <stdio.h>

int main() {
    int n, i, j;
    printf("Enter the size of the matrix (n x n): ");
    scanf("%d", &n);

    int matrix[n][n];
    printf("Enter the elements of the matrix:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            scanf("%d", &matrix[i][j]);
        }
    }

    for (i = 0; i < n; i++) { 
        int temp = matrix[i][i];
        matrix[i][i] = matrix[i][n - i - 1];
        matrix[i][n - i - 1] = temp;
    }

    printf("Matrix after interchanging diagonals:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }

    return 0;
}
