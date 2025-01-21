package Lab_1_Basics_of_Java;

import java.util.Scanner;

public class salaryCalc {
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
