/*
3b. Define a class EMPLOYEE having following members: Ename, Eid, Basic, DA, Gross_Sal, Net_Sal and following methods:
a. read(): to read N employee details
b. display(): to display employee details
c. compute(): to compute net salary
Write a Java program to read data of N employee and compute and display net salary of each employee Note: (DA = 52% of Basic, gross_Sal = Basic + DA; IT = 30% of the gross salary)
*/
package Lab_3_Classes_objects_methods;
import java.util.Scanner;

class EMPLOYEE {
    String Ename;
    int Eid;
    double Basic, DA, Gross_Sal, Net_Sal;

    void read(Scanner scanner) {
        System.out.print("Enter Employee Name: ");
        Ename = scanner.nextLine();
        
        System.out.print("Enter Employee ID: ");
        Eid = scanner.nextInt();
        scanner.nextLine(); 
        
        System.out.print("Enter Basic Salary: ");
        Basic = scanner.nextDouble();
        scanner.nextLine(); 
    }

    void compute() {
        DA = 0.52 * Basic;
        Gross_Sal = Basic + DA;
        Net_Sal = Gross_Sal - (0.3 * Gross_Sal);
    }

    void display() {
        System.out.println("Employee Details:");
        System.out.println("Name: " + Ename);
        System.out.println("ID: " + Eid);
        System.out.println("Basic Salary: " + Basic);
        System.out.println("Dearness Allowance: " + DA);
        System.out.println("Gross Salary: " + Gross_Sal);
        System.out.println("Net Salary: " + Net_Sal);
        System.out.println("------------------------------");
    }
}

public class Q2_employeeClass {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of employees: ");
        int N = scanner.nextInt();
        scanner.nextLine(); 

        EMPLOYEE[] employees = new EMPLOYEE[N];

        for (int i = 0; i < N; i++) {
            System.out.println("\nEntering details for Employee " + (i + 1) + ":");
            employees[i] = new EMPLOYEE();
            employees[i].read(scanner);
            employees[i].compute();
        }

        System.out.println("\nEmployee Details:");
        for (int i = 0; i < N; i++) {
            employees[i].display();
        }

        scanner.close();
    }
}

