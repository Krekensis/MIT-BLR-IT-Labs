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