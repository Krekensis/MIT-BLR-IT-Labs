#include <stdio.h>
#include <math.h>

int main() {
    int numDigits, digit, number = 0;

    printf("Enter number of digits: ");
    scanf("%d", &numDigits);

    for (int i = 0; i < numDigits; i++) {
        printf("Enter digit for place %d: ", numDigits - i);
        scanf("%d", &digit);
        number += digit * pow(10, i);
    }

    printf("The number is: %d\n", number);

    return 0;
}
