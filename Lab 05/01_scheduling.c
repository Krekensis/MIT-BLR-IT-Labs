#include <stdio.h>

#define N 4
#define Q 10

int at[N] = {0,3,4,9};
int bt[N] = {60,30,40,10};
int pr[N] = {3,2,1,4};

void fcfs() {
    int wt[N], tat[N], ct[N];

    ct[0] = at[0] + bt[0];
    for(int i=1;i<N;i++)
        ct[i] = (ct[i-1] > at[i] ? ct[i-1] : at[i]) + bt[i];

    for(int i=0;i<N;i++){
        tat[i] = ct[i] - at[i];
        wt[i] = tat[i] - bt[i];
    }

    float aw=0, atat=0;
    printf("\nFCFS:\n");
    for(int i=0;i<N;i++){
        printf("P%d WT=%d TAT=%d\n",i+1,wt[i],tat[i]);
        aw+=wt[i]; atat+=tat[i];
    }
    printf("Avg WT=%.2f Avg TAT=%.2f\n",aw/N,atat/N);
}

void srtf() {
    int rt[N], wt[N], tat[N], complete=0, t=0, min, shortest=-1, finish;
    int check=0;

    for(int i=0;i<N;i++) rt[i]=bt[i];

    while(complete!=N){
        min=1e9; check=0;

        for(int j=0;j<N;j++)
            if(at[j]<=t && rt[j]>0 && rt[j]<min){
                min=rt[j];
                shortest=j;
                check=1;
            }

        if(check==0){ t++; continue; }

        rt[shortest]--;

        if(rt[shortest]==0){
            complete++;
            finish=t+1;
            wt[shortest]=finish-bt[shortest]-at[shortest];
            if(wt[shortest]<0) wt[shortest]=0;
        }

        t++;
    }

    float aw=0, atat=0;
    printf("\nSRTF:\n");
    for(int i=0;i<N;i++){
        tat[i]=bt[i]+wt[i];
        printf("P%d WT=%d TAT=%d\n",i+1,wt[i],tat[i]);
        aw+=wt[i]; atat+=tat[i];
    }
    printf("Avg WT=%.2f Avg TAT=%.2f\n",aw/N,atat/N);
}

void roundRobin() {
    int rt[N], wt[N]={0}, tat[N], t=0, done;
    for(int i=0;i<N;i++) rt[i]=bt[i];

    do{
        done=1;
        for(int i=0;i<N;i++){
            if(rt[i]>0){
                done=0;
                if(rt[i]>Q){
                    t+=Q;
                    rt[i]-=Q;
                } else {
                    t+=rt[i];
                    wt[i]=t-bt[i]-at[i];
                    rt[i]=0;
                }
            }
        }
    }while(!done);

    float aw=0, atat=0;
    printf("\nRound Robin:\n");
    for(int i=0;i<N;i++){
        tat[i]=bt[i]+wt[i];
        printf("P%d WT=%d TAT=%d\n",i+1,wt[i],tat[i]);
        aw+=wt[i]; atat+=tat[i];
    }
    printf("Avg WT=%.2f Avg TAT=%.2f\n",aw/N,atat/N);
}

void priorityNP() {
    int wt[N], tat[N], done[N]={0};
    int complete=0, t=0, idx;

    while(complete<N){
        int maxp=-1;
        idx=-1;

        for(int i=0;i<N;i++)
            if(at[i]<=t && !done[i] && pr[i]>maxp){
                maxp=pr[i];
                idx=i;
            }

        if(idx==-1){ t++; continue; }

        wt[idx]=t-at[idx];
        t+=bt[idx];
        tat[idx]=wt[idx]+bt[idx];

        done[idx]=1;
        complete++;
    }

    float aw=0, atat=0;
    printf("\nPriority (Non-preemptive):\n");
    for(int i=0;i<N;i++){
        printf("P%d WT=%d TAT=%d\n",i+1,wt[i],tat[i]);
        aw+=wt[i]; atat+=tat[i];
    }
    printf("Avg WT=%.2f Avg TAT=%.2f\n",aw/N,atat/N);
}

int main(){
    int ch;

    do{
        printf("\n1.FCFS\n2.SRTF\n3.Round Robin\n4.Priority\n0.Exit\nChoice: ");
        scanf("%d",&ch);

        switch(ch){
            case 1: fcfs(); break;
            case 2: srtf(); break;
            case 3: roundRobin(); break;
            case 4: priorityNP(); break;
        }

    }while(ch!=0);

    return 0;
}