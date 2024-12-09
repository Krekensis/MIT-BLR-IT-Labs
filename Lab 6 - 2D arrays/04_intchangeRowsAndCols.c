#include <stdio.h>

void intRows(int matrix[][100], int n, int row1, int row2) {
    for (int j = 0; j < n; j++) {
        int temp = matrix[row1][j];
        matrix[row1][j] = matrix[row2][j];
        matrix[row2][j] = temp;
    }
}

void intCols(int matrix[][100], int n, int col1, int col2) {
    for (int i = 0; i < n; i++) {
        int temp = matrix[i][col1];
        matrix[i][col1] = matrix[i][col2];
        matrix[i][col2] = temp;
    }
}

int main() {
    int n, row1, row2, col1, col2;
    printf("Enter the size of the matrix (n x n): ");
    scanf("%d", &n);

    int matrix[100][100];
    printf("Enter the elements of the matrix:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &matrix[i][j]);
        }
    }

    printf("Enter the two rows to interchange (0 to %d): ", n-1);
    scanf("%d %d", &row1, &row2);
    intRows(matrix, n, row1, row2);

    printf("Matrix after interchanging rows %d and %d:\n", row1, row2);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }

    printf("Enter the two columns to interchange (0 to %d): ", n-1);
    scanf("%d %d", &col1, &col2);
    intCols(matrix, n, col1, col2);

    printf("Matrix after interchanging columns %d and %d:\n", col1, col2);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }

    return 0;
}
