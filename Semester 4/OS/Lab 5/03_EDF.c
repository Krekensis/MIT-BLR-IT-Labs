#include <stdio.h>

struct process {
    int pid, bt, rt, deadline, ct;
};

int main() {

    int n, i, time = 0, completed = 0;
    struct process p[10];

    printf("Enter number of processes: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++) {
        p[i].pid = i + 1;

        printf("Burst time of P%d: ", i + 1);
        scanf("%d", &p[i].bt);

        printf("Deadline of P%d: ", i + 1);
        scanf("%d", &p[i].deadline);

        p[i].rt = p[i].bt;
    }

    printf("\nGantt Chart:\n|");

    while (completed < n) {

        int idx = -1;
        int earliest = 9999;

        for (i = 0; i < n; i++) {
            if (p[i].rt > 0 && p[i].deadline < earliest) {
                earliest = p[i].deadline;
                idx = i;
            }
        }

        if (idx == -1) break;

        printf(" P%d |", p[idx].pid);

        time += p[idx].rt;
        p[idx].rt = 0;

        p[idx].ct = time;
        completed++;
    }

    printf("\n\nPID\tBT\tDeadline\tCT\n");

    for (i = 0; i < n; i++) {
        printf("P%d\t%d\t%d\t\t%d\n", p[i].pid, p[i].bt, p[i].deadline, p[i].ct);
    }

    return 0;
}