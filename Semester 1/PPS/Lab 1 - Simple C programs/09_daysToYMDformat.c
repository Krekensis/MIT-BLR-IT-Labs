// Write a C program to convert given number of days into years, weeks and days.

#include <stdio.h>

int main() {
    int initD, Y, W, D;

    printf("Enter the number of days: ");
    scanf("%d", &initD);

    Y = initD / 365; // reminder, this does not change the val of initD. 
    initD %= 365; // this does
    W = initD / 7;
    D = initD % 7;

    printf("%d years, %d weeks, and %d days\n", Y, W, D);

    return 0;
}
