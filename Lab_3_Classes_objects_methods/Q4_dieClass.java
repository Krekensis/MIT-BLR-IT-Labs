/*
3d. Create a Die class with one integer instance variable called sideUp. 
Give it a getSideUp() method that returns the values of sideUp and a void roll() method that changes sideUpto a random value from 1 to 6.
Then create a DieDemo class with a method that creates two Die objects, rolls them, and prints the sum of the two sides up.
 */
package Lab_3_Classes_objects_methods;

import java.util.Random;

class Die {
    int sideUp;

    public int getSideUp() {
        return sideUp;
    }

    public void roll() {
        Random rand = new Random();
        sideUp = rand.nextInt(6) + 1;
    }
}

class DieDemo {
    public void rollDice() {
        Die die1 = new Die();
        Die die2 = new Die();

        die1.roll();
        die2.roll();

        System.out.println("Die 1: " + die1.getSideUp());
        System.out.println("Die 2: " + die2.getSideUp());
        System.out.println("Sum: " + (die1.getSideUp() + die2.getSideUp()));
    }
}

public class Q4_dieClass {
    public static void main(String[] args) {
        DieDemo demo = new DieDemo();
        demo.rollDice();
    }
}