// Write a C program to convert the time in seconds to hours, minutes and seconds. [Hint: 1 hr =3600 sec]

#include <stdio.h>

int main() {
    int initSecs, H, M, S;

    printf("Enter the time in seconds: ");
    scanf("%d", &initSecs);

    H = initSecs / 3600;
    initSecs %= 3600;
    M = initSecs / 60;
    S = initSecs % 60;

    printf("%d hours, %d minutes, and %d seconds\n", H, M, S);

    return 0;
}
