#include <stdio.h>

int main() {
    int n, i, number, pos = -1;

    printf("Enter the size of the array: ");
    scanf("%d", &n);

    int arr[n];

    printf("Enter %d elements: ", n);
    for (i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    printf("Enter the number to search for: ");
    scanf("%d", &number);

    for (i = 0; i < n; i++) {
        if (arr[i] == number) {
            pos = i;
            break;
        }
    }

    if (pos != -1) {
        for (i = pos; i < n - 1; i++) {
            arr[i] = arr[i + 1];
        }
        n--;
        printf("Array after deletion: ");
        for (i = 0; i < n; i++) {
            printf("%d ", arr[i]);
        }
        printf("\n");
    } else {
        printf("Number not found in the array.\n");
    }

    return 0;
}
