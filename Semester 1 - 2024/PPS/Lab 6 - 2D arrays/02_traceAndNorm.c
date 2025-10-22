#include <stdio.h>
#include <math.h>

int main() {
    int n;
    printf("Enter the size of the matrix (n x n): ");
    scanf("%d", &n);

    int matrix[n][n];
    printf("Enter the elements of the matrix:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &matrix[i][j]);
        }
    }

    int trace = 0;
    float norm = 0.0;
    for (int i = 0; i < n; i++) {
        trace += matrix[i][i];
        for (int j = 0; j < n; j++) {
            norm += matrix[i][j] * matrix[i][j];
        }
    }
    norm = sqrt(norm);

    printf("Trace of the matrix: %d\n", trace);
    printf("Norm of the matrix: %.2f\n", norm);

    return 0;
}
