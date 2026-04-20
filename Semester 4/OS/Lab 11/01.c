#include <stdio.h>
#include <stdlib.h>

int cmp(const void *a, const void *b)
{
    return (*(int *)a - *(int *)b);
}

// FCFS
void fcfs(int *req, int n, int head)
{
    int total = 0, cur = head;
    for (int i = 0; i < n; i++)
    {
        total += abs(req[i] - cur);
        cur = req[i];
    }
    printf("\nFCFS Total Movement = %d\n", total);
}

// SSTF
void sstf(int *req, int n, int head)
{
    int *visited = (int *)calloc(n, sizeof(int));
    int total = 0, cur = head;

    for (int i = 0; i < n; i++)
    {
        int idx = -1, min = 1e9;

        for (int j = 0; j < n; j++)
        {
            if (!visited[j] && abs(req[j] - cur) < min)
            {
                min = abs(req[j] - cur);
                idx = j;
            }
        }

        visited[idx] = 1;
        total += min;
        cur = req[idx];
    }

    printf("SSTF Total Movement = %d\n", total);
    free(visited);
}

// SCAN
// SCAN
void scan(int *req, int n, int head, int disk_size)
{
    int total = 0, cur = head;

    // Allocate array with space for the end boundary
    int *arr = (int *)malloc((n + 1) * sizeof(int));
    for (int i = 0; i < n; i++)
        arr[i] = req[i];
    
    // Add the end of the disk (RIGHT boundary) instead of 0
    arr[n] = disk_size - 1; 

    qsort(arr, n + 1, sizeof(int), cmp);

    int pos;
    for (pos = 0; pos < n + 1; pos++)
        if (arr[pos] >= head)
            break;

    // 1. Move RIGHT first (towards the end of the disk)
    for (int i = pos; i < n + 1; i++) {
        total += abs(arr[i] - cur);
        cur = arr[i];
    }

    // 2. Then move LEFT (sweep back down to the remaining requests)
    for (int i = pos - 1; i >= 0; i--) {
        total += abs(arr[i] - cur);
        cur = arr[i];
    }

    printf("SCAN Total Movement = %d\n", total);
    free(arr);
}
// C-SCAN
void cscan(int *req, int n, int head, int disk_size)
{
    int total = 0, cur = head;

    int *arr = (int *)malloc((n + 2) * sizeof(int));
    for (int i = 0; i < n; i++)
        arr[i] = req[i];
    arr[n] = 0;
    arr[n + 1] = disk_size - 1;

    qsort(arr, n + 2, sizeof(int), cmp);

    int pos;
    for (pos = 0; pos < n + 2; pos++)
        if (arr[pos] >= head)
            break;

    // Move right
    for (int i = pos; i < n + 2; i++)
    {
        total += abs(arr[i] - cur);
        cur = arr[i];
    }

    // Jump from end to start (IMPORTANT)
    total += abs((disk_size - 1) - 0);
    cur = 0;

    // Continue right
    for (int i = 0; i < pos; i++)
    {
        total += abs(arr[i] - cur);
        cur = arr[i];
    }

    printf("C-SCAN Total Movement = %d\n", total);
    free(arr);
}

int main()
{
    int n, head, disk_size;

    printf("Enter number of requests: ");
    scanf("%d", &n);

    int *req = (int *)malloc(n * sizeof(int));

    printf("Enter request queue: ");
    for (int i = 0; i < n; i++)
        scanf("%d", &req[i]);

    printf("Enter initial head position: ");
    scanf("%d", &head);

    printf("Enter disk size: ");
    scanf("%d", &disk_size);

    fcfs(req, n, head);
    sstf(req, n, head);
    scan(req, n, head, disk_size);
    cscan(req, n, head, disk_size);

    free(req);
    return 0;
}