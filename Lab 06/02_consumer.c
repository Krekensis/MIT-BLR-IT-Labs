#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

int main() {
    int fd, buf[4];
    fd = open("myfifo", O_RDONLY);
    
    read(fd, buf, sizeof(buf));
    for(int i=0; i<4; i++) {
        printf("%d ", buf[i]);
    }

    close(fd);
    return 0;
}