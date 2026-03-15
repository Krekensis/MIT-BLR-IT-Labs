/*
2. Write a C program to load the binary executable of the previous program in a child process using exec system call. 
*/

#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid = fork();

    if(pid == 0) {
        execl("./a.out","a.out",NULL);
    }
    else {
        printf("Parent running\n");
    }

    return 0;
}