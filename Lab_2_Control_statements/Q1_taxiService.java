package Lab_2_Control_statements;
/*
A Taxi service offers a new service based on travel distance. 
Write a Java program to calculate the total distance traveled by considering the following charges. 
First 5 km = INR 10/km, Next 15 km = INR 8/km, Next 25 km = INR 5/km.
*/

import java.util.Scanner;

public class Q1_taxiService {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the distance traveled by the taxi: ");
        double distance = scanner.nextDouble();

        double totalFare = 0;

        if (distance <= 5) {
            totalFare = distance * 10;
        } else if (distance <= 20) {
            totalFare = 5 * 10 + (distance - 5) * 8;
        } else if (distance <= 45) {
            totalFare = 5 * 10 + 15 * 8 + (distance - 20) * 5;
        } else {
            totalFare = 5 * 10 + 15 * 8 + 25 * 5 + (distance - 45) * 3;
        }

        System.out.println("Total fare for the taxi ride: INR " + totalFare);

        scanner.close();
    }
}