/*
5a. Enhance the STUDENT class by adding an inner class named Subject that handles details of individual subjects. Where:
a) The inner class Subject should:
    a. Contain fields for subjectName and marks.
    b. Provide methods to assign marks and display subject details.
b) The STUDENT class should maintain an array of Subject objects.
c) The STUDENT class should:
    a. Provide methods to add subjects.
d) Calculate total and average marks by iterating over the Subject objects.
*/ 
package Lab_5_Nested_Classes;

class STUDENT {
    String name;
    int age;
    Subject[] subjects;
    int totalMarks;
    double avgMarks;

    public STUDENT(String name, int age) {
        this.name = name;
        this.age = age;
        subjects = new Subject[5];
        totalMarks = 0;
        avgMarks = 0.0;
    }

    class Subject {
        String subjectName;
        int marks;

        public Subject(String subjectName, int marks) {
            this.subjectName = subjectName;
            this.marks = marks;
        }

        public void display() {
            System.out.println("Subject: " + subjectName + "\tMarks: " + marks);
        }
    }
    public void addSub(String subjectName, int marks) {
        for (int i = 0; i < subjects.length; i++) {
            if (subjects[i] == null) {
                subjects[i] = new Subject(subjectName, marks);
                totalMarks += marks;
                break;
            }
        }
    } 

    public void calcAvg() {
        avgMarks = totalMarks / subjects.length;
    }

    public void display() {
        System.out.println("Name: " + name + "\nAge: " + age);
        for (Subject subject : subjects) {
            if (subject != null) {
                subject.display();
            }
        }
        System.out.println("Total Marks: " + totalMarks + "\nAverage Marks: " + avgMarks);
    }
}

public class Q1_innerStudentClass {
    public static void main(String[] args) {

        STUDENT student = new STUDENT("Arthur Morgan", 18);

        student.addSub("OOP", 90);
        student.addSub("DV", 85);
        student.addSub("ACE", 80);
        student.addSub("FEE", 75);
        student.addSub("MSB", 70);
        student.calcAvg();

        System.out.println("\nStudent details:");
        student.display();
    }
}
