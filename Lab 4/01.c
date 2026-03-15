#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if(pid == 0) {
        printf("Child Process\n");
        printf("PID: %d  PPID: %d\n", getpid(), getppid());
    }
    else {
        wait(NULL);
        printf("Parent Process\n");
        printf("PID: %d  PPID: %d\n", getpid(), getppid());
    }

    return 0;
}