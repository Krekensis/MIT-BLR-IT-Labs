// Write a C program to input P, N and R, compute and display simple and compound interest. [Hint: SI = PNR/100, CI = P(1+R/100)N-P]

#include <stdio.h>
#include <math.h>

int main() {
    float P, N, R, SI, CI;

    printf("Enter the principal amount (P), Time (N) in years, Rate (R) respectively: ");
    scanf("%f %f %f", &P, &N, &R);

    SI = (P * N * R) / 100;
    CI = P * pow((1 + R / 100), N) - P; // You need to use math.h lib for pow()

    printf("Simple Interest (SI): %.2f\n", SI);
    printf("Compound Interest (CI): %.2f\n", CI);

    return 0;
}
