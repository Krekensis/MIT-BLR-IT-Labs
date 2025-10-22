#include <stdio.h>

int main() {
    int n;

    printf("Enter the number of students: ");
    scanf("%d", &n);

    int STUDENTS[n];
    int MARKS[n];

    printf("Enter the roll numbers:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &STUDENTS[i]);
    }

    printf("Enter the marks:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &MARKS[i]);
    }

    int STUDENTS_MARK[2][n];

    for (int i = 0; i < n; i++) {
        STUDENTS_MARK[0][i] = STUDENTS[i];
        STUDENTS_MARK[1][i] = MARKS[i];
    }

    printf("STUDENTS_MARK:\n");
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d\t", STUDENTS_MARK[i][j]);
        }
        printf("\n");
    }

    return 0;
}
