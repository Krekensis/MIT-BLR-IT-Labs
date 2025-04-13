/*
5b. Implement an EMPLOYEE class with an inner class named Department that handles department-related details. The inner class Department should:
    a. Contain fields for departmentName and location.
    b. Provide methods to set and display department details.
The EMPLOYEE class should:
Contain fields for eName (employee name), salary, and an array of Department objects. Provide methods to:
    c) Add departments.
    d) Display employee details along with department information.
*/

package Lab_5_Nested_Classes;

class EMPLOYEE {
    String eName;
    double salary;
    Department departments[];

    public EMPLOYEE(String eName, double salary) {
        this.eName = eName;
        this.salary = salary;
        departments = new Department[5];
    }

    class Department {
        String departmentName;
        String location;

        public Department(String departmentName, String location) {
            this.departmentName = departmentName;
            this.location = location;
        }

        public void display() {
            System.out.println("Department Name: " + departmentName + "\tLocation: " + location);
        }
    }

    public void addDept(String departmentName, String location) {
        for (int i = 0; i < departments.length; i++) {
            if (departments[i] == null) {
                departments[i] = new Department(departmentName, location);
                break;
            }
        }
    }

    public void display() {
        System.out.println("Employee Name: " + eName + "\nSalary: " + salary);
        for (Department dept : departments) {
            if (dept != null) {
                dept.display();
            }
        }
    }
}

public class Q2_innerEmployeeClass {
    public static void main(String[] args) {
        EMPLOYEE emp = new EMPLOYEE("Monke", 50000);
        emp.addDept("Marketing", "Delhi");
        emp.addDept("Finance", "Mumbai");
        emp.display();
    }
}