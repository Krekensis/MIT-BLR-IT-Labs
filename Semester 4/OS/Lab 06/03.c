#include <stdio.h>
#include <sys/shm.h>
#include <unistd.h>

int main() {
    int id = shmget(IPC_PRIVATE, 1024, 0666 | IPC_CREAT);
    char *str = (char*)shmat(id, NULL, 0);

    if (fork() > 0) { // Parent
        str[0] = 'A'; 
        printf("Parent sent: %c\n", str[0]);
        sleep(2); // Wait for child
        printf("Parent received: %c\n", str[0]);
        shmdt(str);
        shmctl(id, IPC_RMID, NULL);
    } else { // Child
        sleep(1); // Wait for parent
        printf("Child received: %c\n", str[0]);
        str[0] = str[0] + 1;
        shmdt(str);
    }
    return 0;
}