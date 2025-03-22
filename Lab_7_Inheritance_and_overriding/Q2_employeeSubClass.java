/*
7b. To the already defined EMPLOYEE class, add two subclasses FullTimeEmp and PartTimeEmp and implement the following:
    i)  Include the following data members to the PartTimeEmp class-hoursWorked (int) that represents the number of hours worked by 
        the part-time employee and hourlyRate (double, static and final) that represents the hourly rate at which the part-time employee
        is paid. Also, override calculateSalary() and displayEmployeeDetails() splayEmployeeDetails() method of the base class to display 
        the part-time employee's details, including the hours worked and hourly rate.
    ii) The FullTimeEmployee subclass includes the data members bonus and deductions as additional data members and are of type double 
        and overrides the calculateSalary() and displayEmployeeDetails() methods to incorporate these factors.
In main(), create various objects to illustrate the functionality of all the classes.
 */

package Lab_7_Inheritance_and_overriding;

class EMPLOYEE {
    String name;
    int empID;
    double salary;

    public EMPLOYEE(String name, int empID, double salary) {
        this.name = name;
        this.empID = empID;
        this.salary = salary;
    }

    public void calculateSalary() {
        
    }

    public void displayEmployeeDetails() {
        System.out.println("\nName: " + name + "\nEmployee ID: " + empID + "\nTotal Salary: " + salary);
    }
}

class PartTimeEmp extends EMPLOYEE {
    int hoursWorked;
    static final double hourlyRate = 10.0;

    public PartTimeEmp(String name, int empID, double salary, int hoursWorked) {
        super(name, empID, salary);
        this.hoursWorked = hoursWorked;
    }

    @Override
    public void calculateSalary() {
        salary = salary + (hoursWorked * hourlyRate);
    }

    @Override
    public void displayEmployeeDetails() {
        System.out.println("\nName: " + name + "\nEmployee ID: " + empID + "\nHours Worked: " + hoursWorked + "\nHourly Rate: " + hourlyRate + "\nTotal Salary: " + salary);
    }
}

class FullTimeEmp extends EMPLOYEE {
    double bonus, deductions;

    public FullTimeEmp(String name, int empID, double salary, double bonus, double deductions) {
        super(name, empID, salary);
        this.bonus = bonus;
        this.deductions = deductions;
    }

    @Override
    public void calculateSalary() {
        salary = salary + bonus - deductions;
    }

    @Override
    public void displayEmployeeDetails() {
        System.out.println("\nName: " + name + "\nEmployee ID: " + empID + "\nBonus: " + bonus + "\nDeductions: " + deductions + "\nTotal Salary: " + salary);
    }
}

public class Q2_employeeSubClass {
    public static void main(String[] args) {

        System.out.println("Everyone has 10,000 base salary");
        EMPLOYEE employee = new EMPLOYEE("Super Man", 1, 10000);
        PartTimeEmp partTimeEmp = new PartTimeEmp("Deadpool", 2, 10000, 40);
        FullTimeEmp fullTimeEmp = new FullTimeEmp("Wolverine", 3, 10000, 500, 100);

        employee.calculateSalary();
        partTimeEmp.calculateSalary();
        fullTimeEmp.calculateSalary();

        employee.displayEmployeeDetails();
        partTimeEmp.displayEmployeeDetails();
        fullTimeEmp.displayEmployeeDetails();
    }
}

