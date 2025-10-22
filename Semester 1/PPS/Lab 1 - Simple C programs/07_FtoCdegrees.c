// Write a C program to convert the given temperature in Fahrenheit to Centigrade. [Hint: C=5/9(F-32)]

#include <stdio.h>

int main() {
    float F, C;

    printf("Enter the temperature in Fahrenheit: ");
    scanf("%f", &F);

    C = (5.0 / 9.0) * (F - 32);

    printf("Temperature in Celsius: %.2f\n", C);

    return 0;
}
