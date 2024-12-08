/* Write a C program to evaluate the following expression for the values a = 30, b=10, c=5, d=15
(i ) (a + b) * c / d 
(ii) ((a + b) * c) / d
(iii) a + (b * c) / d 
(iv) (a + b) * (c / d)
*/

#include <stdio.h>

int main() {
    int a = 30, b = 10, c = 5, d = 15;
    float r1, r2, r3, r4;

    r1 = (a + b) * c / d;
    r2 = ((a + b) * c) / d;
    r3 = a + (b * c) / d;
    r4 = (a + b) * (c / d);

    printf("i.   (a + b) * c / d = %.2f\n", r1);
    printf("ii.  ((a + b) * c) / d = %.2f\n", r2);
    printf("iii. a + (b * c) / d = %.2f\n", r3);
    printf("iv.  (a + b) * (c / d) = %.2f\n", r4);

    return 0;
}
