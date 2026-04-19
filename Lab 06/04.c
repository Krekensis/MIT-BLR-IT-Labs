#include <stdio.h>
#include <sys/shm.h>
#include <string.h>
#include <unistd.h>

int main() {
    int id = shmget(IPC_PRIVATE, 1024, 0666 | IPC_CREAT);
    char *ptr = (char*)shmat(id, NULL, 0);

    if (fork() > 0) { // Producer
        strcpy(ptr, "Hello World Shared");
        sleep(2);
        shmdt(ptr);
        shmctl(id, IPC_RMID, NULL);
    } else { // Consumer
        sleep(1);
        printf("Consumer read: %s\n", ptr);
        shmdt(ptr);
    }
    return 0;
}