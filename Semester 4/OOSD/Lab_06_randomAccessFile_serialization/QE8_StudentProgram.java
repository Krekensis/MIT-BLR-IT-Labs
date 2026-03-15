/*
8.  Create a student class with name and sessional marks as its data members, use constructor to initialize the object and a method to display the student details

9.  Write a program to write 5 students objects into a "student.txt"
    Also read the contents of the file and display only those students detail whos sessional marks are above 10

10.  Write a java program to read the students detail from student.txt and display only those students details whose total marks is more than 20. 

11.  write a java program to insert the following details into the student.txt  
    Anil 12 13
    Sunil 8 9 
    Rahul 13 11
*/

import java.io.*;

class Student {
    private String name;
    private int mark1;
    private int mark2;

    public Student(String name, int mark1, int mark2) {
        this.name = name;
        this.mark1 = mark1;
        this.mark2 = mark2;
    }

    public int getSessionalMarks() {
        return mark1; 
    }

    public int getTotal() {
        return mark1 + mark2;
    }

    public void display() {
        System.out.println("Name: " + name + ", Marks: " + mark1 + ", " + mark2 + ", Total: " + getTotal());
    }

    public String toLine() {
        return name + " " + mark1 + " " + mark2;
    }

    public static Student fromLine(String line) {
        String[] parts = line.split("\\s+");
        if (parts.length == 3) {
            String name = parts[0];
            int m1 = Integer.parseInt(parts[1]);
            int m2 = Integer.parseInt(parts[2]);
            return new Student(name, m1, m2);
        }
        return null;
    }
}

public class QE8_StudentProgram {
    public static void main(String[] args) {
        try {
            
            Student[] students = {
                new Student("Anil", 12, 13),
                new Student("Sunil", 8, 9),
                new Student("Rahul", 13, 11),
                new Student("Priya", 15, 7),
                new Student("Neha", 9, 14)
            };

            BufferedWriter bw = new BufferedWriter(new FileWriter("./fileout/student.txt"));
            for (Student s : students) {
                bw.write(s.toLine());
                bw.newLine();
            }
            bw.close();

            BufferedReader br = new BufferedReader(new FileReader("./fileout/student.txt"));
            System.out.println("Students with sessional marks > 10:");
            String line;
            while ((line = br.readLine()) != null) {
                Student s = Student.fromLine(line);
                if (s != null && s.getSessionalMarks() > 10) {
                    s.display();
                }
            }
            br.close();

            br = new BufferedReader(new FileReader("./fileout/student.txt"));
            System.out.println("\nStudents with total marks > 20:");
            while ((line = br.readLine()) != null) {
                Student s = Student.fromLine(line);
                if (s != null && s.getTotal() > 20) {
                    s.display();
                }
            }
            br.close();

            RandomAccessFile raf = new RandomAccessFile("./fileout/student.txt", "rw");
            raf.seek(raf.length()); 
            raf.writeBytes("Ramesh 10 12\n");
            raf.close();

            br = new BufferedReader(new FileReader("./fileout/student.txt"));
            System.out.println("\nRaw contents of student.txt:");
            while ((line = br.readLine()) != null) {
                System.out.println(line);
            }
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
