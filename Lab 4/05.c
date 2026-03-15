#include <stdio.h>
#include <pthread.h>

int n, fib[100];

void *generate(void *arg)
{
    fib[0] = 0;
    fib[1] = 1;
    for (int i = 2; i < n; i++)
        fib[i] = fib[i - 1] + fib[i - 2];
}

int main()
{
    pthread_t t;

    printf("Enter number of terms: ");
    scanf("%d", &n);

    pthread_create(&t, NULL, generate, NULL);
    pthread_join(t, NULL);

    for (int i = 0; i < n; i++)
        printf("%d ", fib[i]);

    return 0;
}