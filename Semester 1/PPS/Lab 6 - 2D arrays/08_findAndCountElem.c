#include <stdio.h>

int main() {
    int n, i, j, count=0, elem=0;
    printf("Enter the size of the matrix (n x n): ");
    scanf("%d", &n);

    int matrix[n][n];
    printf("Enter the elements of the matrix:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            scanf("%d", &matrix[i][j]);
        }
    }
    printf("Enter element to find: ");
    scanf("%d", &elem);

    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            if(matrix[i][j] == elem){ count++; }
        }
    }
    if(count != 0){
        printf("Element was present in matrix %d times", count);
    } else {
        printf("Element not in matrix");
    }
    
    return 0;
}
