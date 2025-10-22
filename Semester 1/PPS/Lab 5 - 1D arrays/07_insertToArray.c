#include <stdio.h>

int main() {
    int n, elem, pos;

    printf("Enter the size of the array: ");
    scanf("%d", &n);

    int arr[n + 1];  

    printf("Enter %d elements: \n", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    printf("Enter the element to insert: ");
    scanf("%d", &elem);
    printf("Enter the position to insert the elem: ");
    scanf("%d", &pos);

    for (int i = n; i >= pos; i--) {
        arr[i] = arr[i - 1];
    }

    arr[pos - 1] = elem;

    printf("Array after insertion: ");
    for (int i = 0; i <= n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
