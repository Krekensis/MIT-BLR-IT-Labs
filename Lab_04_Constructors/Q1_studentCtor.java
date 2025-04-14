/*
 4a. Consider the already defined STUDENT class. Provide a default constructor and parameterized constructor to this class. 
 Also provide a display method. Illustrate all the constructors as well as the display method by defining STUDENT objects
*/

package Lab_04_Constructors;

class STUDENT {
    String name;
    int age;
    double gpa;

    public STUDENT() {
        name = "Unknown";
        age = 0;
        gpa = 0.0;
    }

    public STUDENT(String name, int age, double gpa) {
        this.name = name;
        this.age = age;
        this.gpa = gpa;
    }

    public void display() {
        System.out.println("Name: " + name + "\nAge: " + age + "\nGPA: " + gpa);
    }
}

public class Q1_studentCtor {
    public static void main(String[] args) {

        STUDENT student1 = new STUDENT();
        STUDENT student2 = new STUDENT("Max Payne", 18, 7);

        System.out.println("Student 1:");
        student1.display();
        System.out.println("\nStudent 2:");
        student2.display();
    }
}