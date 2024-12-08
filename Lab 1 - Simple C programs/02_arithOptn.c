// Write a C program to find the sum, difference, product and quotient of 2 numbers.

#include <stdio.h>

int main() {
    int a, b;
    int sum, diff, prod;
    float div;

    printf("Enter 1st and 2nd integer: ");
    scanf("%d %d", &a, &b);

    sum = a + b;
    diff = a - b;
    prod = a * b;

    if (b != 0) {
        div = (float)a / b; // Cast to float for proper division
    } else {
        printf("Division by zero is not allowed.\n");
        return 1; // Exit program
    }

    printf("Sum: %d\n", sum);
    printf("Difference: %d\n", diff);
    printf("Product: %d\n", prod);
    printf("Quotient: %.2f\n", div); 
            // Here .2 ^^ makes the output show upto 2 decimals

    return 0;
}
