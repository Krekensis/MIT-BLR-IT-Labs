/*
8b. Design an interface called Series with the following methods
    i) getNext (returns the next number in series)
    ii) reset(to restart the series)
    iii) setStart (to set the value from which the series should start)
Design a class named ByTwos that implements Series such that it generates a series of numbers, each two greater than the previous one. 
Also design a class which will include the main method for referencing the interface.
*/

package Lab_08_AbstractClasses_and_Interfaces;

interface Series {

    int getNext();
    void reset();
    void setStart(int x);
}

class ByTwos implements Series {
    int start;
    int current;

    public int getNext() {
        current += 2;
        return current;
    }

    public void reset() {
        current = start;
    }

    public void setStart(int x) {
        start = x;
        current = x;
    }
}

public class Q2_seriesByTwos {
    public static void main(String[] args) {
        ByTwos series = new ByTwos();
        series.setStart(5);

        System.out.println("Series of numbers (+2 per number): ");
        for (int i = 0; i < 10; i++) {
            System.out.print(series.getNext() + " ");
        }

        System.out.println("\nResetting the series...");
        series.reset();
        System.out.println("Series after reset: ");
        for (int i = 0; i < 10; i++) {
            System.out.print(series.getNext() + " ");
        }
    }    
}
