/*
9a.1. Create a package edu.manipal.mit. Create a Student class to store their name and roll number, define a method to display these details. 
Both variables and method should use the default access modifier. Create another class DefaultAccessDemo in the same package to set the 
student details and display them. Create a new package edu.manipal.kmc. Demonstrate that the default access modifier restricts access when 
you try to use the Student class from a different package and note the compilation errors.
*/

package Lab_09_Packages_and_Access.Q1_edu.manipal.mit;

class Student {
    String name;
    int roll;
    int age;
    int marks[];

    Student(String name, int age, int roll, int marks[]) {
        this.name = name;
        this.age = age;
        this.roll = roll;
        this.marks = marks;
    }

    void display() {
        System.out.println(
            "Name: " + name + 
            "\nAge: " + age + 
            "\nRoll No: " + roll
        );

        for (int i = 0; i < marks.length; i++) {
            System.out.print("S" + (i + 1) + "\t");
        }
        System.out.println("");
        for (int i = 0; i < marks.length; i++) {
            System.out.print(marks[i] + "\t");
        }
        System.out.println("");
    }
}

class Q1a_student {
    public static void main(String[] args) {

        int marks[] = { 8, 8, 9, 6, 7 };
        Student s1 = new Student("Donald Grover", 19, 245690420, marks);
        System.out.println("Student Details:");
        s1.display();
    }
}