#include <stdio.h>

int main() {
    int n, temp;
    printf("No. of elements: ");
    scanf("%d", &n);

    int arr[n];

    printf("Enter %d elements: \n", n);
    for (int i = 0; i < n; i++){
        scanf("%d", &arr[i]);
    }

    char type;
    printf("Enter 'd' for descending, 'a' for ascending: ");
    scanf(" %c", &type);

    switch (type) {
        case 'a':
            for (int i = 0; i < n - 1; i++) {
                for (int j = 0; j < n - i - 1; j++) {
                    if (arr[j] > arr[j + 1]) {
                        temp = arr[j];
                        arr[j] = arr[j + 1];
                        arr[j + 1] = temp;
                    }
                }
            }
            printf("Array after sorting in ascending manner:\n");
            for (int x = 0; x < n; x++) {
                printf("%d ", arr[x]);
            }
            printf("\n");
            break;

        case 'd':
            for (int i = 0; i < n - 1; i++) {
                for (int j = 0; j < n - i - 1; j++) {
                    if (arr[j] < arr[j + 1]) {
                        temp = arr[j];
                        arr[j] = arr[j + 1];
                        arr[j + 1] = temp;
                    }
                }
            }
            printf("Array after sorting in descending manner:\n");
            for (int x = 0; x < n; x++) {
                printf("%d ", arr[x]);
            }
            printf("\n");
            break;

        default:
            printf("Wrong type input!\n");
    }

    return 0;
}
