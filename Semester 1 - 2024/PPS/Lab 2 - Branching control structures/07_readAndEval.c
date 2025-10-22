/* Write a program that will read the value of x and evaluate the following function
Y = 1,  x > 0
  = 0,  x = 0
  = -1, x < 0
Use else if statements & Print the result (‘Y’ value).
*/
#include <stdio.h>

int main() {
    int X, Y;

    printf("Enter an integer: ");
    scanf("%d", &X);

    if (X > 0) {
        Y = 1;
    } else if (X < 0) {
        Y = -1;
    } else {
        Y = 0;
    }
    printf("Value of Y is %d", Y);
    return 0;
}
