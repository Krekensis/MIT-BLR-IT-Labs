#include <stdio.h>

int main() {
    int N, i, roll, found = 0;

    printf("Enter the number of students (N): ");
    scanf("%d", &N);

    int STUDENTS[N];

    printf("Enter the roll numbers of %d students: ", N);
    for (i = 0; i < N; i++) {
        scanf("%d", &STUDENTS[i]);
    }

    printf("Roll numbers of students: ");
    for (i = 0; i < N; i++) {
        printf("%d ", STUDENTS[i]);
    }
    printf("\n");

    printf("Enter a roll number to search for: ");
    scanf("%d", &roll);

    for (i = 0; i < N; i++) {
        if (STUDENTS[i] == roll) {
            printf("Roll number %d found at position %d.\n", roll, i + 1);
            found = 1;
            break;
        }
    }

    if (!found) {
        printf("Roll number %d not found in the array.\n", roll);
    }

    return 0;
}
