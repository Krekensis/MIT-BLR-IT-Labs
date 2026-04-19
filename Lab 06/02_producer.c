#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>

int main() {
    int fd, arr[4] = {10, 20, 30, 40};

    mkfifo("myfifo", 0666);
    fd = open("myfifo", O_WRONLY);

    write(fd, arr, sizeof(arr));
    
    close(fd);
    return 0;
}