/*
3a. Create an abstract class Figure with an abstract method area and two integer variables that represent x and y dimensions. 
Create three more classes Rectangle, Triangle and Square that extend Figure and implement the area method appropriately. 
Illustrate how the method area can be computed at run time for Rectangle, Square and Triangle to achieve dynamic polymorphism. 
*/

package Lab_8_AbstractClasses_and_Interfaces;
import java.util.Scanner;

abstract class Figure {
    int x, y;

    public Figure(int x, int y) {
        this.x = x;
        this.y = y;
    }
    abstract void area();
}

class Rectangle extends Figure {
    public Rectangle(int x, int y) {
        super(x, y);
    }
    void area() {
        System.out.println("Area of Rectangle: " + (x * y));
    }
}

class Triangle extends Figure {
    public Triangle(int x, int y) {
        super(x, y);
    }
    void area() {
        System.out.println("Area of Triangle: " + (0.5 * x * y));
    }
}

class Square extends Figure {
    public Square(int x) {
        super(x, x);
    }
    void area() {
        System.out.println("Area of Square: " + (x * x));
    }
}

public class Q1_shapeArea {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the dimensions (x and y): ");
        int x = sc.nextInt();
        int y = sc.nextInt();

        Figure rectangle = new Rectangle(x, y);
        Figure triangle = new Triangle(x, y);
        Figure square = new Square(x);

        rectangle.area();
        triangle.area();
        square.area();

        sc.close();
    }
}
