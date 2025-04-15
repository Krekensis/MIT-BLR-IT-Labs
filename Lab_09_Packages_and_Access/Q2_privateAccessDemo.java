/*
9b. Update the Student class mark the attributes name and rollNumber as private, and student details as public. 
Create public setter methods to assign values to name and rollNumber. Create a PrivateAccessDemo class in the same package, 
that uses the setter methods to set the values for name and rollNumber and displays the details. Try to access the name and 
rollNumber attributes directly from the PrivateAccessDemo class and note the errors.
*/
package Lab_09_Packages_and_Access;

class Student {
    private String name;
    private int roll;

    public void display(){
        System.out.println("Name: "+name);
        System.out.println ("Roll No: "+roll);
    }

    public void set(String name, int roll){
        this.name = name;
        this.roll = roll;
    }
}

class Q2_privateAccessDemo {
    public static void main(String[] args) {
        
        Student s1 = new Student();
        s1.set("Tony Tony Chopper",245690420);
        System.out.println ("Student Details: ");
        s1.display();

        /*trying to access name and roll directly
        System.out.println ("Name: "+s1.name);
        System.out.println("Roll No: "+s1.roll);

        "Exception in thread "main" java.lang.Error: Unresolved compilation problems: 
        The field Student.name is not visible
        The field Student.roll is not visible"
        The above exxception occurs when accessing private members directly.
        */
    }
}