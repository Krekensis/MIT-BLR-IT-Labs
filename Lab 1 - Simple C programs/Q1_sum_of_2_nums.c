// Write a C program to add two integers a and b read through the keyboard. Display the result using third variable sum

#include <stdio.h>

int main() {
    int a, b, sum;

    printf("Enter the 1st & 2nd integer: ");
    scanf("%d %d", &a, &b);

    sum = a + b;

    printf("%d + %d = %d\n", a, b, sum);
    return 0;
}
