#include <stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>

struct msg_buf { long type; char text[100]; } msg;

int main() {
    int id = msgget(ipc_private, 0666 | IPC_CREAT);

    if (fork() > 0) { // Process A (Sender)
        msg.type = 1;
        printf("Enter number: ");
        scanf("%s", msg.text);
        msgsnd(id, &msg, sizeof(msg), 0);

    } else { // Process B (Receiver)
        msgrcv(id, &msg, sizeof(msg), 1, 0);
        int i, n = strlen(msg.text), pal = 1;
        
        for (i = 0; i < n/2; i++){
            if (msg.text[i] != msg.text[n-i-1]) {
                pal = 0;
            }
        }
        printf("Palindrome: %s\n", pal ? "Yes" : "No");
        msgctl(id, IPC_RMID, NULL);
    }
    return 0;
}