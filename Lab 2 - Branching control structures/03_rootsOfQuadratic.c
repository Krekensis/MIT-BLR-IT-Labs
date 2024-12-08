// Compute all the roots of a quadratic equation using switch case statement. [Hint: x = (-b +/- sqrt(b2-4ac))/2a]

#include <stdio.h>
#include <math.h>

int main() {
    float a, b, c, D, root1, root2;
    int type;

    printf("Enter coefficients a, b, and c: ");
    scanf("%f %f %f", &a, &b, &c);

    D = b * b - 4 * a * c;

    if (D > 0) {
        type = 1;
    } else if (D == 0) {
        type = 2;
    } else {
        type = 3;
    }

    switch (type) {
        case 1:
            root1 = (-b + sqrt(D)) / (2 * a);
            root2 = (-b - sqrt(D)) / (2 * a);
            printf("Roots are real and different.\n");
            printf("Root 1 = %.2f\n", root1);
            printf("Root 2 = %.2f\n", root2);
            break;
        case 2:
            root1 = root2 = -b / (2 * a);
            printf("Roots are real and same.\n");
            printf("Root 1 and Root 2 = %.2f\n", root1);
            break;
        case 3:
            printf("Roots are complex and different.\n");
            printf("Root 1 = %.2f + %.2fi\n", -b / (2 * a), sqrt(-D) / (2 * a));
            printf("Root 2 = %.2f - %.2fi\n", -b / (2 * a), sqrt(-D) / (2 * a));
            break;
        default:
            printf("Invalid case\n");
    }

    return 0;
}
