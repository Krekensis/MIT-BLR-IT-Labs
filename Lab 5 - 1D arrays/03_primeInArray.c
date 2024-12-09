#include <stdio.h>

int main(){
    int n, prime = 0;
    printf("No. of elements: ");
    scanf("%d", &n);

    int arr[n], flag;

    printf("Enter %d elements: \n", n);
    for (int i = 0; i < n; i++){
        scanf("%d", &arr[i]);
    }

    for(int i = 0; i < n; i++){
        if (arr[i] <= 1) continue;
        if (arr[i] > 1) {
            flag = 1;
            for (int j = 2; j <= arr[i] / 2; j++) {
                if (arr[i] % j == 0) {
                    flag = 0;
                    break;
                }
            }
        }
        if (flag == 1) { prime++; }
    }

    printf("No. of primes in array is %d", prime);

    return 0;
}