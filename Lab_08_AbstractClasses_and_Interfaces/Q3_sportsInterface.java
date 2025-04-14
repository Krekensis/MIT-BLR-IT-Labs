/*
8c. Design a class Student with the methods, getRollNum() and putRollNum() to read and display the Roll No. of each student; and 
getMarks() and putMarks() to read and display their marks. Create an interface called Sports with a method putSportsScore() that 
will set the score obtained by a student in physical education examination. Design a class called Result that will implement this 
interface to generate the result by considering both the marks and sports score.
 */

//q3

package Lab_08_AbstractClasses_and_Interfaces;
import java.util.*;

interface Sports {
    void putScore(int x);
}

class Student implements Sports {
    int score, roll;
    String name;
    int marks[] = new int[3];

    Student(String name) {
        this.name = name;
    }

    public void putScore(int score) {
        this.score = score;
    }

    void putRoll(int roll) {
        this.roll = roll;
    }

    int getRoll() {
        return roll;
    }

    void putMarks(int marks[]) {
        this.marks = marks;
    }

    void getMarks() {
        System.out.println("Marks Display:\nEng\tSci\tMath\tPE");
        for (int i = 0; i < 3; i++) {
            System.out.print(marks[i] + "\t");
        }
        System.out.println(score); // prints PE score under the PE tab in the above prinnt statement
    }
}

class Q3_sportsInterface {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Student s1 = new Student("Mont Blanc");
        int marks[] = { 80, 90, 85 };
        s1.putRoll(14);
        s1.putMarks(marks);
        s1.putScore(70);

        int total = 0;
        for (int i = 0; i < 3; i++) {
            total += marks[i];
        }
        double avg = (total + s1.score) / 4.0;
        String grade;
        if (avg >= 90) {
            grade = "A";
        } else if (avg < 90 && avg >= 75) {
            grade = "B";
        } else if (avg < 75 && avg >= 50) {
            grade = "C";
        } else if (avg < 35) {
            grade = "F";
        } else
            grade = "D";

        System.out.println("Student details:\nName:\t" + s1.name);
        System.out.println("Roll Number:\t" + s1.getRoll());
        s1.getMarks();
        System.out.println("Achieved Grade:\t" + grade);

        sc.close();

    }
}
