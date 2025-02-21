/*
Create a class called Counter that contains a static data member to count the number of Counter objects being created. 
Also define a static member function called showCount() which displays the number of objects created at any given point of time. 
Illustrate this.
 */

package Lab_4_Constructors;

class Counter {
    static int count = 0;

    public Counter(){
        count++;
    }

    public static void showCount(){
        System.out.println("Number of Counter objects created: " + count);
    }
}
public class Q4_staticCounter {
    @SuppressWarnings("unused")
    public static void main(String[] args) {
        Counter c1 = new Counter();
        Counter c2 = new Counter();
        Counter c3 = new Counter();
        Counter c4 = new Counter();
        Counter c5 = new Counter();
        Counter.showCount();
    }
}
