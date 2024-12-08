// Write a C program to print the ASCII value of a character

#include <stdio.h>

int main() {
    char ch;

    printf("Enter a character: ");
    scanf("%c", &ch); // remember, %c only takes ONE character

    printf("The ASCII value of '%c' is %d\n", ch, ch);

    return 0;
}
