/*
7a. To the already defined STUDENT class, add two subclasses ScienceStudent and ArtsStudent and implement the following:
    i)  Add a data member practicalMarks (int) to the ScienceStudent class that represents the marks obtained by the student in the laboratory subject. 
        The ScienceStudent class should override the compute() method to include the practical marks in the total marks and average marks calculation. 
        Additionally, the ScienceStudent class should provide a method displaypracticalMarks() to display the practical marks obtained by the science student.
    ii) Add a data member electiveSubject (String): to the ArtsStudent class that represents 
        the elective subject chosen by the arts student. Also, add appropriate constructors to the subclasses.
In main(), create objects of STUDENT, ScienceStudent, and ArtsStudent, and demonstrate the keyword ‘super’ and other functionalities 
of the classes by assigning values, computing marks, and displaying the information of the students. Also, demonstrate dynamic polymorphism.
 */

package Lab_7_Inheritance_and_overriding;

class STUDENT {
    String name;
    int rollNo;
    int m1, m2, m3;
    float totalMarks, avgMarks;

    public STUDENT(String name, int rollNo, int m1, int m2, int m3) {
        this.name = name;
        this.rollNo = rollNo;
        this.m1 = m1;
        this.m2 = m2;
        this.m3 = m3;
    }

    public void compute() {
        totalMarks = m1 + m2 + m3;
        avgMarks = totalMarks / 3;
    }

    public void display() {
        System.out.println("\nName: " + name + "\nRoll No: " + rollNo + "\nTotal Marks: " + totalMarks + "\nAverage Marks: " + avgMarks);
    }
}

class ScienceStudent extends STUDENT {
    int practicalMarks;

    public ScienceStudent(String name, int rollNo, int m1, int m2, int m3, int practicalMarks) {
        super(name, rollNo, m1, m2, m3);
        this.practicalMarks = practicalMarks;
    }

    @Override
    public void compute() {
        totalMarks = m1 + m2 + m3 + practicalMarks;
        avgMarks = totalMarks / 4;
    }

    public void displaypracticalMarks() {
        System.out.println("Practical Marks: " + practicalMarks);
    }
}

class ArtsStudent extends STUDENT {
    String electiveSubject;

    public ArtsStudent(String name, int rollNo, int m1, int m2, int m3, String electiveSubject) {
        super(name, rollNo, m1, m2, m3);
        this.electiveSubject = electiveSubject;
    }
}

public class Q1_studentSubClass {
    public static void main(String[] args) {
        STUDENT student = new STUDENT("Spider Man", 1, 90, 80, 70);
        ScienceStudent scienceStudent = new ScienceStudent("Iron Man", 2, 80, 70, 60, 50);
        ArtsStudent artsStudent = new ArtsStudent("Bat Man", 3, 70, 60, 50, "History");

        student.compute();
        scienceStudent.compute();
        artsStudent.compute();

        student.display();
        scienceStudent.display();
        scienceStudent.displaypracticalMarks();
        artsStudent.display();
    }
}