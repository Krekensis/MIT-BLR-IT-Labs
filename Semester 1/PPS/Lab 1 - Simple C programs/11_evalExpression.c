//Write a C program for the following: (i) ut + 1/2 at2 (ii) a2 + 2ab + b2

#include <stdio.h>

int main() {
    float U, T, A, res;
    float a, b, res2;

    printf("i. Enter the initial velo (u), time (t), accln (a): ");
    scanf("%f %f %f", &U, &T, &A);

    printf("ii. Enter the value of a & b: ");
    scanf("%f %f", &a, &b);

    res = U * T + 0.5 * A * T * T;
    res2 = a * a + 2 * a * b + b * b;

    printf("i.  The result of ut + 1/2 at^2 is: %.2f\n", res);
    printf("ii. The result of a^2 + 2ab + b^2 is: %.2f\n", res2);

    return 0;
}
