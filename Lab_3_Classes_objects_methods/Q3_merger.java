/*
Define a class Mixer to merge two sorted integer arrays in ascending order with the following instance variables and methods:
instance variables:
int arr[] //to store the elements of an array
Methods:
void accept() // to accept the elements of the array in ascending order without any duplicates
Mixer mix(Mixer A) // to merge the current object array elements with the parameterized array elements and return the resultant object
void display() // to display the elements of the array Define the main() method to test the class.
*/

package Lab_3_Classes_objects_methods;
import java.util.Scanner;
import java.util.Arrays;

class Mixer {
    int arr[];

    void accept() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of elements: ");
        int n = scanner.nextInt();
        arr = new int[n];
        System.out.println("Enter the elements:");
        for (int i = 0; i < n; i++) {
            arr[i] = scanner.nextInt();
            scanner.nextLine();
        }
        Arrays.sort(arr);
        for (int i = 0; i < n - 1; i++) {
            if (arr[i] == arr[i + 1]) {
                for (int j = i + 1; j < n - 1; j++) {
                    arr[j] = arr[j + 1];
                }
                n--;
                i--;
            }
        }
        arr = Arrays.copyOf(arr, n);
        scanner.close();
    }

    Mixer mix(Mixer A) {
        Mixer result = new Mixer();
        int n1 = arr.length;
        int n2 = A.arr.length;
        int n = n1 + n2;
        result.arr = new int[n];
        int i = 0, j = 0, k = 0;
        while (i < n1 && j < n2) {
            if (arr[i] < A.arr[j]) {
                result.arr[k++] = arr[i++];
            } else if (arr[i] > A.arr[j]) {
                result.arr[k++] = A.arr[j++];
            } else {
                result.arr[k++] = arr[i++];
                j++;
            }
        }
        while (i < n1) {
            result.arr[k++] = arr[i++];
        }
        while (j < n2) {
            result.arr[k++] = A.arr[j++];
        }
        return result;
    }

    void display() {
        System.out.print("Merged array: ");
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }
}

public class Q3_merger {
    public static void main(String[] args) {
        Mixer A = new Mixer();
        Mixer B = new Mixer();
        A.accept();
        B.accept();
        Mixer C = A.mix(B);
        C.display();
    }
}