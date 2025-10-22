#include <stdio.h>

int main() {
    int num, copy;

    printf("Enter an integer: ");
    scanf("%d", &num);
    copy = num;

    while (copy >= 10) {
        int sum = 0;
        while (copy > 0) {
            sum += copy % 10;
            copy /= 10;
        }
        copy = sum;
    }
    printf("The generic root of %d is %d\n", num, copy);

    return 0;
}
