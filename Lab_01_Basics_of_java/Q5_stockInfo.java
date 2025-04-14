/*
Write a Java program to manage stock information for multiple products. 
The program should store the product name, product price, and quantity in separate one-dimensional arrays for n items. 
The user should be able to specify which products they want to purchase and the desired quantity for each. 
Based on the user’s input, the program should generate and display the total bill.
 */
package Lab_01_Basics_of_java;
import java.util.Scanner;

public class Q5_stockInfo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the number of products: ");
        int n = scanner.nextInt();

        String[] name = new String[n];
        double[] price = new double[n];
        int[] stock = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Enter the name of product " + (i + 1) + ": ");
            name[i] = scanner.next();
            System.out.print("Enter the price of product " + (i + 1) + ": ");
            price[i] = scanner.nextDouble();
            System.out.print("Enter the quantity of product " + (i + 1) + ": ");
            stock[i] = scanner.nextInt();
        }

        double total = 0;

        while (true) {
            System.out.print("Enter the name of the product you want to purchase (or 'exit' to finish): ");
            String inputName = scanner.next();

            if (inputName.equalsIgnoreCase("exit")) {
                break;
            }

            boolean productFound = false;
            for (int i = 0; i < n; i++) {
                if (name[i].equalsIgnoreCase(inputName)) {
                    System.out.print("Enter the quantity you want to purchase: ");
                    int quantity = scanner.nextInt();

                    if (quantity <= stock[i]) {
                        stock[i] -= quantity;
                        total += price[i] * quantity;
                        System.out.println("Purchased " + quantity + " of " + name[i]);
                    } else {
                        System.out.println("Insufficient stock for " + name[i]);
                    }
                    productFound = true;
                    break;
                }
            }
            if (!productFound) {
                System.out.println("Product not found.");
            }
        }

        System.out.println("Total Bill: " + total);
        scanner.close();
    }
}
