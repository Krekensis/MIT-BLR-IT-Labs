// Write a C program to display the size of the data type int, char, float, double, long int and long double using sizeof( ) operator.

#include <stdio.h>

int main() {

    printf("Size of int: %d bytes\n", sizeof(int));
    printf("Size of char: %d byte\n", sizeof(char));
    printf("Size of float: %d bytes\n", sizeof(float));
    printf("Size of double: %d bytes\n", sizeof(double));
    printf("Size of long int: %d bytes\n", sizeof(long int));
    printf("Size of long double: %d bytes\n", sizeof(long double));
    // can use %lu, %zu, %i too

    return 0;
}
