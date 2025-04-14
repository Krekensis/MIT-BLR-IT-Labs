/*
 4b. Consider the already defined EMPLOYEE class. Provide a default constructor, and parameterized constructor. 
 Also provide a display method. Illustrate all the constructors as well as the display method by defining EMPLOYEE objects.
 */

package Lab_04_Constructors;

class EMPLOYEE {
    String name;
    int age;
    double salary;

    public EMPLOYEE() {
        name = "Unknown";
        age = 0;
        salary = 0.0;
    }

    public EMPLOYEE(String name, int age, double salary) {
        this.name = name;
        this.age = age;
        this.salary = salary;
    }

    public void display() {
        System.out.println("Name: " + name + "\nAge: " + age + "\nSalary: " + salary);
    }
}

public class Q2_employeeCtor {
    public static void main(String[] args) {

        EMPLOYEE employee1 = new EMPLOYEE();
        EMPLOYEE employee2 = new EMPLOYEE("Niko Bellic", 30, 100000);

        System.out.println("Employee 1:");
        employee1.display();
        System.out.println("\nEmployee 2:");
        employee2.display();
    }
}
