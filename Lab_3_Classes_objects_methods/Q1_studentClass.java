/*
3a. Define a Class STUDENT having following
Members: sname, marks_array, total, avg and provide the following methods:
a. assign(): to assign initial values to the STUDENT object
b. display(): to display the STUDENT object
c. compute(): to Compute Total, Average marks
Write a Java program Illustrating Class Declarations, Definition, and Accessing Class Members to test the class defined.
*/

package Lab_3_Classes_objects_methods;
import java.util.Scanner;

class STUDENT {
    String sname;
    int[] marks_array;
    int total;
    double avg;

    void assign(String name, int[] marks) {
        sname = name;
        marks_array = marks;
        compute();
    }

    void compute() {
        total = 0;
        for (int mark : marks_array) {
            total += mark;
        }
        avg = total / (double) marks_array.length;
    }
    
    void display() {
        System.out.println("Student Name: " + sname);
        System.out.print("Marks: ");
        for (int mark : marks_array) {
            System.out.print(mark + " ");
        }
        System.out.println("\nTotal Marks: " + total);
        System.out.println("Average Marks: " + avg);
    }
}

public class Q1_studentClass {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        STUDENT student = new STUDENT();

        System.out.print("Enter student name: ");
        String name = scanner.nextLine();
        System.out.print("Enter number of subjects: ");
        int num = scanner.nextInt();
        int[] marks = new int[num];
        System.out.println("Enter marks for each subject:");
        for (int i = 0; i < num; i++) {
            marks[i] = scanner.nextInt();
        }

        student.assign(name, marks);
        student.compute();
        student.display();
        scanner.close();
    }
}