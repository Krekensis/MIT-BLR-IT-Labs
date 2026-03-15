/*
3. Create a zombie (defunct) child process (a child with exit() call, but no corresponding wait() in the sleeping parent) and 
allow the init process to adopt it (after parent terminates). Run the process as background process and run “ps” command. 
*/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
    pid_t pid = fork();

    if(pid == 0) {
        printf("Child exiting\n");
        exit(0);
    }
    else {
        printf("Parent sleeping\n");
        sleep(20);
    }

    return 0;
}