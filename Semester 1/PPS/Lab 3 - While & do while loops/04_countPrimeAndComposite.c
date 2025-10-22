#include <stdio.h>

int main() {
    int num, i, flag, prime = 0, composite = 0;

    do {
        printf("Enter a number (-1 to end): ");
        scanf("%d", &num);

        if (num == -1) break;
        if (num == 1) continue;
        if (num > 1) {
            flag = 1;
            for (i = 2; i <= num / 2; i++) {
                if (num % i == 0) {
                    flag = 0;
                    break;
                }
            }
        }

        if (flag == 1) { prime++; }
        else { composite++; }
    } while (num != -1);

    printf("Prime numbers entered: %d\n", prime);
    printf("Composite numbers entered: %d\n", composite);

    return 0;
}