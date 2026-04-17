#include <stdio.h>

#define NB 5
#define NP 4

void firstFit(int block[], int process[]) {
    int b[NB];
    for (int i = 0; i < NB; i++) b[i] = block[i];

    printf("\nFirst Fit:\n");
    for (int i = 0; i < NP; i++) {
        int placed = 0;
        for (int j = 0; j < NB; j++) {
            if (b[j] >= process[i]) {
                printf("P%d (%dK) -> Block %d\n", i, process[i], j+1);
                b[j] -= process[i];
                placed = 1;
                break;
            }
        }
        if (!placed) printf("P%d (%dK) -> Not Allocated\n", i, process[i]);
    }
}

void bestFit(int block[], int process[]) {
    int b[NB];
    for (int i = 0; i < NB; i++) b[i] = block[i];

    printf("\nBest Fit:\n");
    for (int i = 0; i < NP; i++) {
        int best = -1;
        for (int j = 0; j < NB; j++) {
            if (b[j] >= process[i]) {
                if (best == -1 || b[j] < b[best])
                    best = j;
            }
        }
        if (best != -1) {
            printf("P%d (%dK) -> Block %d\n", i, process[i], best+1);
            b[best] -= process[i];
        } else {
            printf("P%d (%dK) -> Not Allocated\n", i, process[i]);
        }
    }
}

void worstFit(int block[], int process[]) {
    int b[NB];
    for (int i = 0; i < NB; i++) b[i] = block[i];

    printf("\nWorst Fit:\n");
    for (int i = 0; i < NP; i++) {
        int worst = -1;
        for (int j = 0; j < NB; j++) {
            if (b[j] >= process[i]) {
                if (worst == -1 || b[j] > b[worst])
                    worst = j;
            }
        }
        if (worst != -1) {
            printf("P%d (%dK) -> Block %d\n", i, process[i], worst+1);
            b[worst] -= process[i];
        } else {
            printf("P%d (%dK) -> Not Allocated\n", i, process[i]);
        }
    }
}

int main() {
    int block[NB] = {100, 500, 200, 300, 600};
    int process[NP] = {212, 417, 112, 426};

    firstFit(block, process);
    bestFit(block, process);
    worstFit(block, process);

    return 0;
}