/*
4. Write a multithreaded program that performs different sorting algorithms. The program should work as follows: the user enters 
on the command line the number of elements to sort and the elements themselves. The program then creates separate threads, each 
using a different sorting algorithm. Each thread sorts the array using its corresponding algorithm and displays the time taken 
to produce the 48 LAB NO: 4 result. The main thread waits for all threads to finish and then displays the final sorted array. 
*/

#include <stdio.h>
#include <pthread.h>
#include <time.h>

int arr[100], n;

void *bubble(void *arg)
{
    int i, j, temp;
    clock_t s = clock();
    for (i = 0; i < n - 1; i++)
        for (j = 0; j < n - i - 1; j++)
            if (arr[j] > arr[j + 1])
            {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
    clock_t e = clock();
    printf("Bubble sort time: %lf\n", (double)(e - s) / CLOCKS_PER_SEC);
}

void *selection(void *arg)
{
    int i, j, min, temp;
    clock_t s = clock();
    for (i = 0; i < n - 1; i++)
    {
        min = i;
        for (j = i + 1; j < n; j++)
            if (arr[j] < arr[min])
                min = j;
        temp = arr[i];
        arr[i] = arr[min];
        arr[min] = temp;
    }
    clock_t e = clock();
    printf("Selection sort time: %lf\n", (double)(e - s) / CLOCKS_PER_SEC);
}

int main()
{
    pthread_t t1, t2;

    printf("Enter n: ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
        scanf("%d", &arr[i]);

    pthread_create(&t1, NULL, bubble, NULL);
    pthread_create(&t2, NULL, selection, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("Sorted array:\n");
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);

    return 0;
}