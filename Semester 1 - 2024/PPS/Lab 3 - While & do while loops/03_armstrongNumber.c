#include <stdio.h>

int main() {
    int num, copy, remainder, result = 0;

    printf("Enter an integer: ");
    scanf("%d", &num);

    copy = num;

    while (copy != 0) {
        remainder = copy % 10;
        result += remainder * remainder * remainder;
        copy /= 10;
    }

    if (result == num) {
        printf("%d is an Armstrong number.\n", num);
    } else {
        printf("%d is not an Armstrong number.\n", num);
    }

    return 0;
}