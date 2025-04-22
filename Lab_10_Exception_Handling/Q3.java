/*
Write a program to calculate the average marks of a student. If the total marks are zero or the number of subjects is zero, 
throw an ArithmeticException to avoid division by zero. Create a Student class , add a method calculateAverage(int totalMarks, 
int numberOfSubjects) that throws ArithmeticException if numberOfSubjects is zero. Write a MarksValidationDemo class to invoke 
the calculateAverage method with valid and invalid data. Handle the exception and display an appropriate error message.
*/
package Lab_10_Exception_Handling;

class Student1 {
    String name;
    int age, total, nsub;
    double avg;

    Student1(String name, int age) {
        this.name = name;
        this.age = age;
    }

    void calc(int total, int nsub){
        try {
            if (total == 0 || nsub == 0) {
                throw new ArithmeticException("Value cannot be 0.");
            } else {
                this.total = total;
                this.nsub = nsub;
                avg = total / nsub;
                display();
            }
        } catch (ArithmeticException err) {
            System.out.println("Error: " + err.getMessage());
        }
    }

    void display() {
        System.out.println(
            "Name: " + name +
            "\nAge: " + age +
            "\nTotal Marks: " + total +
            "\nNumber of Subjects: " + nsub +
            "\nAverage: " + avg
        );
    }

}

class Q3 {
    public static void main(String[] args) {
        Student1 s1 = new Student1("Mario", 19);
        System.out.println("Student 1:");
        s1.calc(50, 5);

        Student1 s2 = new Student1("Luigi", 19);
        System.out.println("\nStudent 2:");
        s2.calc(5, 0);
    }
}