#include <stdio.h>
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

    int sum = 0, rowSum = 0, colSum = 0;
    for(int i = 0; i < n; i++){
        sum += matrix[0][i];
    }

    for(int i = 0; i < n; i++){
        rowSum = 0, colSum = 0;
        for(int j = 0; j < n; j++){
            rowSum += matrix[i][j]; 
            colSum += matrix[j][i];
        }
        if(rowSum != sum || colSum != sum){
            return printf("Not magic square.");
        }
    }
    int diag1 = 0, diag2 = 0;
    for (int i = 0; i < n; i++) {
        diag1 += matrix[i][i];             
        diag2 += matrix[i][n - i - 1];     
    }
    if (diag1 != sum || diag2 != sum) {
        return printf("Not a magic square.\n");
    }
    printf("Is a magic square.");
    return 0;
}
