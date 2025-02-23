/* 4c. Define a class to represent a Bank account. Include the following members. Data members:
    a. Name of the depositor
    b. Account number.
    c. Type of account.
    d. Balance amount in the account.
    e. Rate of interest (static data)
Provide a default constructor and parameterized constructor to this class. Also provide Methods:
    a. To deposit amount.
    b. To withdraw amount after checking for minimum balance.
    c. To display all the details of an account holder.
    d. Display rate of interest (a static method)
Illustrate all the constructors as well as all the methods by defining objects.
*/

package Lab_4_Constructors;
import java.util.Scanner;

class bankAccount {

    String name;
    String accType;
    int accNumber;
    double balance;
    static double ROI = 0.05;

    public bankAccount(){
        name = "Unknown";
        accNumber = 0;
        accType = "Unknown";
        balance = 0.0;
    }

    public bankAccount(String name, int accNumber, String accType, double balance){
        this.name = name;
        this.accNumber = accNumber;
        this.accType = accType;
        this.balance = balance;
    }

    public void deposit(double amount){
        balance += amount;
        System.out.println("Amount deposited.\nNew balance: " + balance);
    }

    public void withdraw(double amount){
        if(balance - amount >= 0){
            balance -= amount;
            System.out.println("Amount withdrawn.\nNew balance: " + balance);
        } else {
            System.out.println("Withdrawal amount exceeds balance. Transaction cancelled.");
        }
    }

    public void display(){
        System.out.println("Name: " + name + "\nAccount Number: " + accNumber + "\nAccount Type: " + accType + "\nBalance: " + balance + "\nRate of Interest: " + ROI*balance);
    }

    public static void displayROI(){
        System.out.println("Rate of Interest: " + ROI);
    }
}

public class Q3_bankAccCtor {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        bankAccount account1 = new bankAccount();
        bankAccount account2 = new bankAccount("", 123456, "Savings", 69420);

        bankAccount.displayROI();

        System.out.println("\nAccount 1:");
        account1.display();
        System.out.println("\nAccount 2:");
        account2.display();

        System.out.print("\nEnter amount to deposit in account 2: ");
        double amt = scanner.nextDouble();
        account2.deposit(amt);

        System.out.print("Enter amount to withdraw from account 2: ");
        amt = scanner.nextDouble();
        account2.withdraw(amt);

        System.out.println("\nAccount 2 after deposit and withdrawal:");
        account2.display();

        scanner.close();
    }
}