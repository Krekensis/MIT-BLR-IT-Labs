#include <stdio.h>
#include <stdlib.h>

int search(int key, int *frame, int f) {
    for (int i = 0; i < f; i++)
        if (frame[i] == key) return i;
    return -1;
}

// FIFO
void fifo(int *pages, int n, int f) {
    int *frame = (int*)malloc(f * sizeof(int));
    int front = 0, faults = 0;

    for (int i = 0; i < f; i++) frame[i] = -1;

    for (int i = 0; i < n; i++) {
        if (search(pages[i], frame, f) == -1) {
            frame[front] = pages[i];
            front = (front + 1) % f;
            faults++;
        }
    }

    printf("\nFIFO Page Faults = %d\n", faults);
    free(frame);
}

// Optimal
void optimal(int *pages, int n, int f) {
    int *frame = (int*)malloc(f * sizeof(int));
    int faults = 0;

    for (int i = 0; i < f; i++) frame[i] = -1;

    for (int i = 0; i < n; i++) {
        if (search(pages[i], frame, f) != -1) continue;

        int pos = -1, farthest = i;

        for (int j = 0; j < f; j++) {
            int k;
            for (k = i + 1; k < n; k++) {
                if (frame[j] == pages[k]) break;
            }

            if (k == n) { pos = j; break; }
            if (k > farthest) {
                farthest = k;
                pos = j;
            }
        }

        if (pos == -1) pos = 0;

        frame[pos] = pages[i];
        faults++;
    }

    printf("Optimal Page Faults = %d\n", faults);
    free(frame);
}

// LRU
void lru(int *pages, int n, int f) {
    int *frame = (int*)malloc(f * sizeof(int));
    int *time = (int*)malloc(f * sizeof(int));

    int faults = 0, hits = 0, t = 0;

    for (int i = 0; i < f; i++) {
        frame[i] = -1;
        time[i] = 0;
    }

    for (int i = 0; i < n; i++) {
        int pos = search(pages[i], frame, f);

        if (pos != -1) {
            hits++;
            time[pos] = ++t;
        } else {
            int lru = 0;
            for (int j = 1; j < f; j++)
                if (time[j] < time[lru])
                    lru = j;

            frame[lru] = pages[i];
            time[lru] = ++t;
            faults++;
        }
    }

    printf("LRU Page Faults = %d\n", faults);
    printf("LRU Hits = %d\n", hits);
    printf("Hit Ratio = %.2f\n", (float)hits / n);

    free(frame);
    free(time);
}

int main() {
    int n, f;

    printf("Enter number of pages: ");
    scanf("%d", &n);

    int *pages = (int*)malloc(n * sizeof(int));

    printf("Enter reference string: ");
    for (int i = 0; i < n; i++)
        scanf("%d", &pages[i]);

    printf("Enter number of frames: ");
    scanf("%d", &f);

    fifo(pages, n, f);
    optimal(pages, n, f);
    lru(pages, n, f);

    free(pages);
    return 0;
}