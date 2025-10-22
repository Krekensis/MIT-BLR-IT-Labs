/*
6b. To the already defined Employee class, add the following string processing methods:
    i. capitalize(): A method that formats the employee's name by capitalizing the first letter of each word and converting the remaining letters to lowercase.
        For example, if the employee's name is "JOHN DOE", this method would transform it to "John Doe".
    ii. generateEmail(): A method that generates an email address for the employee based on their name. For example, 
        if the employee's name is "John Doe", this method would generate an email address like jdoe@example.com.

Illustrate the above methods upon creating an array of Employee objects. 
The details of each Employee object must be read from the user and initialized using the parameterised constructor.
*/

package Lab_06_Strings_and_arrays;
import java.util.Scanner;

class Employee {
    String name;
    int age;
    String email;

    public Employee(String name, int age) {
        this.name = name;
        this.age = age;
        this.email = generateEmail();
    }

    public String capitalize() {
        String words[] = name.split(" ");
        String capName = "";
        for (String w : words) {
            capName += w.substring(0, 1).toUpperCase() + w.substring(1).toLowerCase() + " ";
        }
        return capName.trim();
    }

    public String generateEmail() {
        String w[] = name.split(" ");
        return (w[0].charAt(0) + (w.length > 1 ? w[1] : "")).toLowerCase() + "@gmail.com";
    }

    public void display() {
        System.out.println("Name: " + capitalize() + "\nAge: " + age + "\nEmail: " + email);
    }
}

public class Q2_employeeArray {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the number of employees: ");
        int n = sc.nextInt();
        sc.nextLine();

        Employee employees[] = new Employee[n];
        for (int i = 0; i < n; i++) {
            System.out.print("Name of employee " + (i + 1) + ": ");
            String name = sc.nextLine();
            System.out.print("Age of employee " + (i + 1) + ": ");
            int age = sc.nextInt();
            sc.nextLine();

            employees[i] = new Employee(name, age);
        }

        System.out.println("\nEmployee details:");
        for (int i = 0; i < n; i++) {
            System.out.println("\nEmployee " + (i + 1) + ":");
            employees[i].display();
        }

        sc.close();
    }
}