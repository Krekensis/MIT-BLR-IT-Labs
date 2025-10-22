#include <stdio.h>

int main() {
    int i = 1;

    while (i <= 10) {
        if (i % 2 == 0) {
            i++;
            continue;
        }
        printf("%d ", i);
        i++;
    }
    printf("\n");

    i = 1;
    while (i <= 10) {
        if (i == 5) {
            break; 
        }
        printf("%d ", i);
        i++;
    }
    printf("\n");

// do-while:
    i = 1;
    do {
        if (i % 2 == 0) {
            i++;
            continue; 
        }
        printf("%d ", i);
        i++;
    } while (i <= 10);
    printf("\n");

    i = 1;
    do {
        if (i == 5) {
            break; 
        }
        printf("%d ", i);
        i++;
    } while (i <= 10);
    printf("\n");

    return 0;
}
