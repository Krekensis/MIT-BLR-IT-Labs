/*
For a given date of birth of a person, calculate the date of retirement by taking years of service as input. (assume service periods as 60 years).
*/
package Lab_2_Control_statements;
import java.util.Scanner;

public class Q3_retirementDate {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter your Date of Birth (dd mm yyyy): ");
        int date = scanner.nextInt();
        int month = scanner.nextInt();
        int year = scanner.nextInt();

        int rYear = year + 60;
        int rMonth = month;
        int rDate;

        switch (rMonth) {
            case 4: case 6: case 9: case 11:
                rDate = 30;
                break;
            case 2:
                if ((rYear % 4 == 0 && rYear % 100 != 0) || (rYear % 400 == 0)) {
                    rDate = 29;
                } else {
                    rDate = 28;
                }
                break;
            default:
                rDate = 31;
                break;
        }

        System.out.println("Birth date: "+date+"/"+month+"/"+year + ", Retirement date is: " + rDate + "/" + rMonth + "/" + rYear);

        scanner.close();
    }
}