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

	void accept(int a[]) {
		arr = new int[a.length];
		arr = a;
	}

	Mixer mix(Mixer A, int a[]) {
		int arr0[] = new int[a.length + A.arr.length];
		System.arraycopy(a, 0, arr0, 0, a.length);
		System.arraycopy(A.arr, 0, arr0, a.length, A.arr.length);
		Arrays.sort(arr0);
		A.arr = new int[arr.length];
		A.arr = arr0;
		return A;
	}

	void display() {
		System.out.println("Elements of mixed array: ");
		for (int i = 0; i < arr.length; i++){
			System.out.print(arr[i] + " ");
		}
	}
}

public class Q3_mixerClass {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Number of elements in array: ");
		int n = scanner.nextInt();
		int a[] = new int[n];
		System.out.println("Enter Elements:");
		for (int i = 0; i < n; i++)
			a[i] = scanner.nextInt();
		Arrays.sort(a);
		for (int i = 0; i < n - 1; i++) {
			if (a[i] == a[i + 1]) {
				for (int j = i + 1; j < n - 1; j++)
					a[j] = a[j + 1];
				n--;
			}
		}
		int b[] = new int[n];
		System.arraycopy(a, 0, b, 0, n);
		Mixer M = new Mixer();
		M.accept(b);
		System.out.print("Number of elements in parameterized array: ");
		n = scanner.nextInt();
		b = new int[n];
		System.out.println("Enter Elements:");
		for (int i = 0; i < n; i++){
			b[i] = scanner.nextInt();
		}
		M = M.mix(M, b);
		M.display();
		scanner.close();
	}
}