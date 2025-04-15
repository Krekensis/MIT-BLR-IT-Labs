/*
10a. Write a program to validate the age of a student during their registration. If the age is not between 18 and 60, throw an IllegalArgumentException. 
Create Student class with Private attributes name and age. Add method registerStudent(String name, int age) that throws an IllegalArgumentException 
if the age is invalid (that is, not between 18 and 60). Write StudentAgeValidationDemo class to create instance of student class and 
invoke registerStudent method with valid and invalid data. Catch the exception and display an error message for invalid input.
*/
package Lab_10_Exception_Handling;
import java.util.Random;

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
                disp();
            }
        } catch (IllegalArgumentException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    void disp() {
        System.out.println(
            "Name: " + name + 
            "\nAge: " + age + 
            "\nRoll No: " + roll
        );
    }
}

public class Q1 {
    public static void main(String[] args) {
        Student s1 = new Student();
        Student s2 = new Student();

        System.out.println("Student 1:");
        s1.register("Mario", 18);

        System.out.println("\nStudent 2:");
        s2.register("Luigi", 65);
    }
}