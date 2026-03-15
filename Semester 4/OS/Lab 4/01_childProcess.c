/*
1. Write a C program to create a child process. Display different messages in parent process and child process. 
Display PID and PPID of both parent and child process. Block parent process until child completes using wait system call. 
*/

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