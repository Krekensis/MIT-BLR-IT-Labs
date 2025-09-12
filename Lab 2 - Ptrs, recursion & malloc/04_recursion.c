//recursion binary search func

#include <stdio.h>
#include <stdlib.h>

int binarySearch(int arr[], int left, int right, int target) {
    if (right >= left) {
        int mid = left + (right - left) / 2;

        // Check if target is present at mid
        if (arr[mid] == target)
            return mid;

        // If target is smaller than mid, search in left subarray
        if (arr[mid] > target)
            return binarySearch(arr, left, mid - 1, target);

        // Else search in right subarray
        return binarySearch(arr, mid + 1, right, target);
    }

    // Target not found
    return -1;
}

// non recursive binary search func

int binarySearchIterative(int arr[], int size, int target) {
    int left = 0, right = size - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;

        // Check if target is present at mid
        if (arr[mid] == target)
            return mid;

        // If target is greater, ignore left half
        if (arr[mid] < target)
            left = mid + 1;
        // If target is smaller, ignore right half
        else
            right = mid - 1;
    }
    // Target not found
    return -1;
}