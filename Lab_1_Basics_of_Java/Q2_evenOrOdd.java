/*
1b. Write a java program to add two numbers using the bitwise operator and check if the 
output is an even or odd number. [Hint: use left shift and right shift bitwise operators].
*/
import java.util.Scanner;

public class evenOrOdd {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int a,b;
        
        System.out.print("Enter num1: ");
        a = scanner.nextInt();

        System.out.print("Enter num2: ");
        b = scanner.nextInt();
        
        while(b != 0){
            int carry = a & b;
            a = a ^ b;
            b = carry << 1;
        }

        int sum = a; 
        System.out.println("The sum is " + sum);

        if(sum % 2 == 0){
            System.out.println("Sum is even");
        } else {
            System.out.println("Sum is odd");
        }
        scanner.close();
        
    }
    
}