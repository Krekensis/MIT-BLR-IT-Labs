package Lab_10_Exception_Handling;

class Student1 {
    String name;
    int age;
    double total, avg, nsub;

    Student1(String name, int age) {
        this.name = name;
        this.age = age;
    }

    void calc(double total, double nsub) {
        try {
            if (total == 0 || nsub == 0) {
                throw new ArithmeticException("Value cannot be 0.");
            } else {
                this.total = total;
                this.nsub = nsub;
                avg = total / nsub;
                display();
            }
        } catch (ArithmeticException a) {
            System.out.println("Error: " + a.getMessage());
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
        s1.calc(50.0, 5.0);

        Student1 s2 = new Student1("Luigi", 19);
        System.out.println("\nStudent 2:");
        s2.calc(0.0, 5.0);
    }
}