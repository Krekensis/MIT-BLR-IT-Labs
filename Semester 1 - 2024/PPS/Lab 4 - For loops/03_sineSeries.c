#include <stdio.h>
#include <math.h> 

long long factorial(int num) {
    if (num == 0 || num == 1)
        return 1;
    else
        return num * factorial(num - 1);
}

int main() {
    double x, radians, term, sum = 0.0;
    int n;

    printf("Enter the value of x (in degrees): ");
    scanf("%lf", &x);
    printf("Enter the number of terms n: ");
    scanf("%d", &n);

    radians = x * 3.1415926535897932384626433832 / 180.0;

    for (int i = 0; i < n; i++) {
        term = pow(-1, i) * pow(radians, 2 * i + 1) / factorial(2 * i + 1);
        sum += term;
    }

    printf("The sine of %.2f degrees calculated using %d terms is: %.6f\n", x, n, sum);

    return 0;
}
