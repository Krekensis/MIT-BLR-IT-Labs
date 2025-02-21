/*
2f. Write a Java program to compute the electricity bill for an industry using a switch-case statement. The program should take the daily consumption in units for 7 days as input. Based on the total consumption, the program should calculate and display the total electricity bill according to the following pricing table:
Units Price per Unit (INR)
0 - 100 7.00
101 - 200 8.00
>= 201 10.00
 */

package Lab_2_Control_statements;
import java.util.Scanner;

public class Q6_electricityBill {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int[] units = new int[7];
        System.out.println("Enter the daily consumption in units for 7 days:");
        for (int i = 0; i < 7; i++) {
            units[i] = scanner.nextInt();
        }
        scanner.close();
        double[] prices = { 7.00, 8.00, 10.00 };
        double totalBill = 0;

        for (int i = 0; i < 7; i++) {
            int unit = units[i];
            double price = 0;
            switch (unit / 100) {
                case 0:
                    price = prices[0];
                    break;
                case 1:
                    price = prices[1];
                    break;
                default:
                    price = prices[2];
                    break;
            }
            totalBill += unit * price;
        }

        System.out.println("Total electricity bill for the industry: INR " + totalBill);
    }
}
