#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

sem_t rw_mutex, mutex;
int read_count = 0;
int data = 0; // The shared resource

void* writer(void* arg) {
    int id = *(int*)arg;
    sem_wait(&rw_mutex); // Lock resource for writing
    
    data++;
    printf("Writer %d modified data to %d\n", id, data);
    
    sem_post(&rw_mutex); // Release resource
    return NULL;
}

void* reader(void* arg) {
    int id = *(int*)arg;
    
    // Entry Section
    sem_wait(&mutex); 
    read_count++;
    if (read_count == 1) sem_wait(&rw_mutex); // First reader locks the writer out
    sem_post(&mutex);

    // Reading Section
    printf("Reader %d read data: %d\n", id, data);
    usleep(100000); 

    // Exit Section
    sem_wait(&mutex);
    read_count--;
    if (read_count == 0) sem_post(&rw_mutex); // Last reader allows writers in
    sem_post(&mutex);
    
    return NULL;
}

int main() {
    pthread_t r[5], w[2];
    int ids[5] = {1, 2, 3, 4, 5};

    sem_init(&mutex, 0, 1);
    sem_init(&rw_mutex, 0, 1);

    for(int i=0; i<2; i++) pthread_create(&w[i], NULL, writer, &ids[i]);
    for(int i=0; i<5; i++) pthread_create(&r[i], NULL, reader, &ids[i]);

    for(int i=0; i<2; i++) pthread_join(w[i], NULL);
    for(int i=0; i<5; i++) pthread_join(r[i], NULL);

    sem_destroy(&mutex);
    sem_destroy(&rw_mutex);
    return 0;
}