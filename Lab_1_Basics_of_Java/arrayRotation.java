/* incorrect

package Lab_1_Basics_of_Java;
import java.util.Scanner;

public class arrayRotation {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the size of the array: ");
        int size = scanner.nextInt();

        int[] array = new int[size];
        System.out.println("Enter the elements of the array:");
        for (int i = 0; i < size; i++) {
            array[i] = scanner.nextInt();
        }

        System.out.print("Enter the number of steps to rotate: ");
        int steps = scanner.nextInt();

        System.out.print("Enter direction (L for left, R for right): ");
        char direction = scanner.next().charAt(0);

        steps = steps % size;

        if (direction == 'L' || direction == 'l') {
            for (int i = 0; i < steps; i++) {
                int temp = array[0];
                for (int j = 0; j < size - 1; j++) {
                    array[j] = array[j + 1];
                }
                array[size - 1] = temp;
            }
        } else if (direction == 'R' || direction == 'r') {
            for (int i = 0; i < steps; i++) {
                int temp = array[size - 1];
                for (int j = size - 1; j > 0; j--) {
                    array[j] = array[j - 1];
                }
                array[0] = temp;
            }
        } else {
            System.out.println("Invalid direction! Please enter 'L' or 'R'.");
            scanner.close();
            return;
        }

        System.out.println("Rotated array:");
        for (int i = 0; i < size; i++) {
            System.out.print(array[i] + " ");
        }

        scanner.close();
    }
}
*/