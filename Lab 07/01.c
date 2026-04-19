#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

// Increase buffer to 10 to allow the 10-item lead
int buf[10], f = -1, r = -1; 
sem_t mutex, full, empty;

void *produce(void *arg) {
    for(int i = 0; i < 20; i++) { // Increased loop to demonstrate the 10-item gap
        sem_wait(&empty); // Stops if 10 items ahead
        sem_wait(&mutex);
        
        r = (r + 1) % 10;
        buf[r] = i;
        printf("Produced: %d\n", i);
        
        sem_post(&mutex);
        sem_post(&full);
        usleep(100000); // Small delay to visualize
    }
    return NULL;
}

void *consume(void *arg) {
    int item;
    for(int i = 0; i < 20; i++) {
        sleep(1); // Consumer is slower to force the producer to lead
        sem_wait(&full);
        sem_wait(&mutex);
        
        f = (f + 1) % 10;
        item = buf[f];
        printf("Consumed: %d\n", item);
        
        sem_post(&mutex);
        sem_post(&empty);
    }
    return NULL;
}

int main() {
    pthread_t tid1, tid2;
    
    sem_init(&mutex, 0, 1);
    sem_init(&full, 0, 0);  // Initially 0 items ready to consume
    sem_init(&empty, 0, 10); // Initially 10 spaces (the "10 items more" limit)

    pthread_create(&tid1, NULL, produce, NULL);
    pthread_create(&tid2, NULL, consume, NULL);
    
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);
    
    sem_destroy(&mutex);
    sem_destroy(&full);
    sem_destroy(&empty);
    
    return 0;
}