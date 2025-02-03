/*
2b. For a given 9-digit registration number of a CSE student, identify the year of joining. 
Assuming the first two digits specify the year of joining.
*/

package Lab_2_Control_statements;
import java.util.Scanner;

public class Q2_regNo {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter your reg no: ");
        int regNo = scanner.nextInt();

        int digits = Integer.parseInt(Integer.toString(regNo).substring(0, 2));
        System.out.print("Student joined on " + (2000+digits));

        scanner.close();
    }
}
