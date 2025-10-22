#include <stdio.h>

void DescSort(int arr[], int n) {
    int i, j, temp;
    for (i = 0; i < n-1; i++) {
        for (j = 0; j < n-i-1; j++) {
            if (arr[j] < arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

int main() {
    int N, i;
    
    printf("Enter the number of students (N): ");
    scanf("%d", &N);

    int MARKS[N];
    printf("Enter the marks of %d students: ", N);
    for (i = 0; i < N; i++) {
        scanf("%d", &MARKS[i]);
    }
    DescSort(MARKS, N);
    printf("Marks in descending order: ");
    for (i = 0; i < N; i++) {
        printf("%d ", MARKS[i]);
    }
    printf("\n");

    return 0;
}
