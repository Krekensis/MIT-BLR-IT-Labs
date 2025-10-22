/*
Create an Account class that stores customers name, acc-no and type of account. From this derive class current account and savings bank account. 
Include necessary methods to achieve following tasks
    i) Accept the deposit from a customer and update the balance
    ii) Display the balance
    iii) Compute and deposit interest
    iv) Permit withdraw and update the balance
    v) Check for minimum balance impose penalty if necessary and update the balance
For savings bank account, the facilities provided include computing interest and withdrawal. No interest can be computed on current 
bank account and a minimum balance must always be maintained. In any instance when it goes below this level, service tax must be imposed.
 */

package Lab_07_Inheritance_and_overriding;

class Account {
    String name;
    String accNo;
    String accType;
    double balance;

    public Account(String name, String accNo, String accType, double balance) {
        this.name = name;
        this.accNo = accNo;
        this.accType = accType;
        this.balance = balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Amount deposited: " + amount);
        } else {
            System.out.println("Invalid deposit amount.");
        }
    }

    public void display() {
        System.out.println("Current Balance: " + balance);
    }
}

class Savings extends Account {
    static double intRate = 0.04;

    public Savings(String name, String accNo, double balance) {
        super(name, accNo, "Savings", balance);
    }

    public void interest() {
        double interest = balance * intRate;
        balance += interest;
        System.out.println("Interest deposited: " + interest);
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println("Amount withdrawn: " + amount);
        } else {
            System.out.println("Insufficient balance.");
        }
    }
}

class Current extends Account {
    static double minBal = 5000.0;
    static double tax = 500.0;

    public Current(String name, String accNo, double balance) {
        super(name, accNo, "Current", balance);
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println("Amount withdrawn: " + amount);
        } else {
            System.out.println("Insufficient balance.");
        }
    }

    public void check() {
        if (balance < minBal) {
            System.out.println("Balance below minimum! Service tax imposed: " + tax);
            balance -= tax;
        } else {
            System.out.println("Balance is above minimum.");
        }
    }
}

public class Q4_bankAccSubClass {
    public static void main(String[] args) {

        Savings savings = new Savings("Mario", "ABC123", 10000);
        savings.deposit(2000);
        savings.interest();
        savings.withdraw(3000);
        savings.display();

        System.out.println();

        Current current = new Current("Luigi", "DEF456", 6000);
        current.withdraw(2000);
        current.check();
        current.display();
    }
}