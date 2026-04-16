#include <stdio.h>

struct process {
    int pid, bt, rt, ct, tat, wt;
};

int main() {

    int n, i, time = 0;
    int tq = 4;

    struct process p[10];

    printf("Enter number of processes: ");
    scanf("%d",&n);

    for(i=0;i<n;i++) {
        p[i].pid = i+1;

        printf("Burst time of P%d: ",i+1);
        scanf("%d",&p[i].bt);

        p[i].rt = p[i].bt;
    }

    printf("\nGantt Chart:\n|");

    /* tqueue 1 : Round Robin */
    for(i=0;i<n;i++) {
        if(p[i].rt > 0) {
            if(p[i].rt > tq) {
                printf(" P%d |",p[i].pid);
                time += tq;
                p[i].rt -= tq;
            } else {
                printf(" P%d |",p[i].pid);

                time += p[i].rt;
                p[i].rt = 0;

                p[i].ct = time;
            }
        }
    }

    /* tqueue 2 : FCFS */
    for(i=0;i<n;i++) {
        if(p[i].rt > 0) {
            printf(" P%d |",p[i].pid);
            time += p[i].rt;
            p[i].rt = 0;
            p[i].ct = time;
        }
    }

    for(i=0;i<n;i++) {
        p[i].tat = p[i].ct;
        p[i].wt = p[i].tat - p[i].bt;
    }

    printf("\n\nPID\tBT\tCT\tTAT\tWT\n");

    for(i=0;i<n;i++) {
        printf("P%d\t%d\t%d\t%d\t%d\n",
        p[i].pid, p[i].bt, p[i].ct, p[i].tat, p[i].wt);
    }

    return 0;
}