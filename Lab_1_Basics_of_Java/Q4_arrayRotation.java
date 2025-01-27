/*
Write a Java program to rotate the elements of an array to the right/left by a given number of steps. 
The program should handle arrays of different sizes and should be able to rotate the array in both directions (left and right).
*/

import java.util.Scanner;

public class Q4_arrayRotation {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the number of elements in the array: ");
        int n = scanner.nextInt();

        int[] arr = new int[n];

        System.out.println("Enter the elements of the array: ");
        for (int i = 0; i < n; i++) {
            arr[i] = scanner.nextInt();
        }

        System.out.print("Enter the number of steps to rotate the array: ");
        int steps = scanner.nextInt();

        System.out.print("Enter the direction to rotate the array (left/right): ");
        String direction = scanner.next();

        if (direction.equalsIgnoreCase("left")) {
            for (int i = 0; i < steps; i++) {
                int temp = arr[0];
                for (int j = 0; j < n - 1; j++) {
                    arr[j] = arr[j + 1];
                }
                arr[n - 1] = temp;
            }
        } else if (direction.equalsIgnoreCase("right")) {
            for (int i = 0; i < steps; i++) {
                int temp = arr[n - 1];
                for (int j = n - 1; j > 0; j--) {
                    arr[j] = arr[j - 1];
                }
                arr[0] = temp;
            }
        }

        System.out.println("Array after rotation: ");
        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }

        scanner.close();
    }
}