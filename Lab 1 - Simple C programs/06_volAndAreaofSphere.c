// Write a C program to input radius, compute and display the volume and surface area of a sphere. [Hint: volume = (4πr3)/3, Area=4πr2]

#include <stdio.h>
#include <math.h>

int main() {
    float r, v, a;
    float PI = 3.14; // just take 3.14, dont need it to be very accurate. 
    // alternatively you can use M_PI from math.h lib

    printf("Enter the radius of the sphere: ");
    scanf("%f", &r);

    v = (4.0 / 3.0) * PI * pow(r, 3);
    a = 4 * PI * pow(r, 2);

    printf("Volume of the sphere: %.2f\n", v);
    printf("Surface area of the sphere: %.2f\n", a);

    return 0;
}
