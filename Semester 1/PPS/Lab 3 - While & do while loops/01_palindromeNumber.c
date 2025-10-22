#include <stdio.h>

int main() {
    int num, rev = 0, remainder, copy;

    printf("Enter an integer: ");
    scanf("%d", &num);

    copy = num;

    while (num != 0) {
        remainder = num % 10;
        rev = rev * 10 + remainder;
        num /= 10;
    }

    if (copy == rev) {
        printf("%d is a palindrome.\n", copy);
    } else {
        printf("%d is not a palindrome.\n", copy);
    }

    return 0;
}