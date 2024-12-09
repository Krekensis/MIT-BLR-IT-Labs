#include <stdio.h>

int main() {
    int n, element;

    printf("Enter the size of the array: ");
    scanf("%d", &n);

    int arr[n];

    printf("Enter %d elements: \n", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    printf("Enter the element to delete: ");
    scanf("%d", &element);

    int newSize = 0;
    for (int i = 0; i < n; i++) {
        if (arr[i] != element) { 
            arr[newSize++] = arr[i];
        }
    }

    printf("Array after deletion: ");
    for (int i = 0; i < newSize; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
