/*
9a.2. Create a package edu.manipal.mit. Create a Student class to store their name and roll number, define a method to display these details. 
Both variables and method should use the default access modifier. Creates another class DefaultAccessDemo in the same package to set the 
student details and display them. Create a new package edu.manipal.kmc. Demonstrate that the default access modifier restricts access when 
you try to use the Student class from a different package and note the compilation errors.
*/

package Lab_09_Packages_and_Access.Q1_edu.manipal.kmc;
import Lab_09_Packages_and_Access.Q1_eduPackage.edu_manipal_mit.*;

@SuppressWarnings("unused")

public class Q1b_student {
    public static void main(String[] args) {
        int marks[] = {7,5,9,5,8};
        //Student kmc1 = new Student("Donald Grover", 19, 245690420, marks);
        System.out.println(marks[0]);
        
        /*
        compilation error occurs which says: 
        "Exception in thread "main" java.lang.Error: Unresolved compilation problems: 
        The type Student is not visible
        The type Student is not visible"
        */
    }
}

