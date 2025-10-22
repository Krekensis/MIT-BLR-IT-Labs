#include <stdio.h>

int main() {
    int n, k;

    printf("Enter the number of rows (n) and terms (k): ");
    scanf("%d %d", &n, &k);

    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= k; j++) {
            printf("%d\t", i * j);
        }
        printf("\n");
    }

    return 0;
}