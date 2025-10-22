#include <stdio.h>

int main() {
    printf("Demonstrating continue statement:\n");
    for (int i = 1; i <= 10; i++) {
        if (i % 2 == 0) {
            continue; 
        }
        printf("%d ", i);
    }
    printf("\n");

    printf("Demonstrating break statement:\n");
    for (int i = 1; i <= 10; i++) {
        if (i == 5) {
            break;
        }
        printf("%d ", i);
    }
    printf("\n");

    return 0;
}
