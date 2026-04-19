#include <stdio.h>

#define MAX 10

int main() {
    int n = 5, m = 3;

    int alloc[5][3] = {
        {0,1,0},
        {2,0,0},
        {3,0,3},
        {2,1,1},
        {0,0,2}
    };

    int request[5][3] = {
        {0,0,0},
        {2,0,2},
        {0,0,1},
        {1,0,0},
        {0,0,2}
    };

    int avail[3] = {0,0,0};

    int work[3], finish[5];

    // Step 1: Initialize
    for (int i = 0; i < m; i++)
        work[i] = avail[i];

    for (int i = 0; i < n; i++) {
        int zero = 1;
        for (int j = 0; j < m; j++) {
            if (alloc[i][j] != 0) {
                zero = 0;
                break;
            }
        }
        finish[i] = zero; // if no allocation → finished
    }

    // Step 2: Find processes that can finish
    int found;
    do {
        found = 0;

        for (int i = 0; i < n; i++) {
            if (!finish[i]) {
                int j;
                for (j = 0; j < m; j++) {
                    if (request[i][j] > work[j])
                        break;
                }

                if (j == m) {
                    // process can complete
                    for (int k = 0; k < m; k++)
                        work[k] += alloc[i][k];

                    finish[i] = 1;
                    found = 1;
                }
            }
        }

    } while (found);

    // Step 3: Check deadlock
    printf("Deadlocked processes: ");
    int deadlock = 0;

    for (int i = 0; i < n; i++) {
        if (!finish[i]) {
            printf("P%d ", i);
            deadlock = 1;
        }
    }

    if (!deadlock)
        printf("None");

    printf("\n");

    return 0;
}