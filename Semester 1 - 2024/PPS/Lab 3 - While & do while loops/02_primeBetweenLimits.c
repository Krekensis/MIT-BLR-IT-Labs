#include <stdio.h>

int main() {
    int lower, upper, num, i, flag;

    printf("Enter the lower limit: ");
    scanf("%d", &lower);
    printf("Enter the upper limit: ");
    scanf("%d", &upper);

    printf("Prime numbers between %d and %d are: ", lower, upper);

    num = lower;
    while (num <= upper) {
        if (num < 2) {
            num++;
            continue;
        }
        flag = 1;
        for (i = 2; i <= num / 2; ++i) {
            if (num % i == 0) {
                flag = 0;
                break;
            }
        }
        if (flag == 1) {
            printf("%d ", num);
        }
        num++;
    }
    printf("\n");

    return 0;
}