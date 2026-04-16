#include <stdio.h>

int main() {
    int page_size = 32;
    int address;

    printf("Enter logical address: ");
    scanf("%d", &address);

    int page = address / page_size;
    int offset = address % page_size;

    printf("Page Number = %d\n", page);
    printf("Offset = %d\n", offset);

    return 0;
}