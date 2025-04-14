/*
2e. Write a Java programs to print factorial of a given no recursively
*/

package Lab_02_Control_statements;
import java.util.Scanner;

public class Q5_recursiveFactorial {
    
    public static int factorial(int n) {
        if (n == 0) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number to find its factorial: ");
        int n = scanner.nextInt();
        System.out.println("Factorial of " + n + " is: " + factorial(n));
        scanner.close();
    }
}