/*
10a. Write a program to validate the age of a student during their registration. If the age is not between 18 and 60, throw an IllegalArgumentException. 
Create Student class with Private attributes name and age. Add method registerStudent(String name, int age) that throws an IllegalArgumentException 
if the age is invalid (that is, not between 18 and 60). Write StudentAgeValidationDemo class to create instance of student class and 
invoke registerStudent method with valid and invalid data. Catch the exception and displaylay an error message for invalid input.
*/
package Lab_10_Exception_Handling;
import java.util.Random;
import java.util.Scanner;

class Student {
    private String name;
    private int roll;
    private int age;
    Random rand = new Random();

    void register(String name, int age) {
        try {
            if (age < 18 || age > 60) {
                throw new IllegalArgumentException("Age must be between 18 and 60.");
            } else {
                this.name = name;
                this.age = age;
                System.out.println("Student registered succesfully.");
                roll = rand.nextInt(245000000, 245999999);
                display();
            }
        } catch (IllegalArgumentException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    void display() {
        System.out.println(
            "Name: " + name + 
            "\nAge: " + age + 
            "\nRoll No: " + roll
        );
    }
}

public class Q1 {
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        int n;
        System.out.print("Enter number of students: ");
        n = sc.nextInt();

        Student studs[] = new Student[n];
        for (int i = 0; i < n; i++) {
            studs[i] = new Student();
        }

        for (int i = 0; i < n; i++) {
            System.out.print("Enter name of student " + (i + 1) + ": ");
            String name = sc.nextLine();
            sc.nextLine();
            System.out.print("Enter age of student " + (i + 1) + ": ");
            int age = sc.nextInt();
            studs[i].register(name, age);
        }
        sc.close();
    }
}