/* 
1a. Write a Java program to accept the number of hours worked, hourly rate and calculates the salary 
for an employee according to the following criteria: The company pays straight time for the first
 40 hours worked by each employee and time and a half for all hours worked in excess of 40 hours.
*/
package Lab_01_Basics_of_java;
import java.util.Scanner;

public class Q1_salaryCalc {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        double hoursWorked, hourlyRate, salary;
        
        System.out.print("Enter the no. of hours worked: ");
        hoursWorked = scanner.nextDouble();

        System.out.print("Enter the hourly rate: ");
        hourlyRate = scanner.nextDouble();

        if(hoursWorked <= 40){
            salary = hoursWorked*hourlyRate;
        } else {
            salary = ((hourlyRate*40) + ((hoursWorked-40)*(hourlyRate*1.5)));
        }

        System.out.println("The salary is " + salary);
        scanner.close(); 
        
    }
}
