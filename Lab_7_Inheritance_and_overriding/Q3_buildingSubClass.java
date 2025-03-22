/*
7c. Create a Building class with two subclasses namely, House and School. The Building class contains fields for square footage and 
stories. The House class contains additional fields for number of bedrooms and baths. The School class contains additional fields 
for number of classrooms and grade level (for example, elementary or junior high). All the classes contain appropriate overloaded 
constructors and methods to display the details. In a separate class that contains main(), demonstrate the working of this hierarchy.
 */

package Lab_7_Inheritance_and_overriding;

class Building {
    int squareFootage, stories;

    public Building(int squareFootage, int stories) {
        this.squareFootage = squareFootage;
        this.stories = stories;
    }

    public void display() {
        System.out.println("\nSquare Footage: " + squareFootage + "\nStories: " + stories);
    }
}

class House extends Building {
    int bedrooms, baths;

    public House(int squareFootage, int stories, int bedrooms, int baths) {
        super(squareFootage, stories);
        this.bedrooms = bedrooms;
        this.baths = baths;
    }

    @Override
    public void display() {
        super.display();
        System.out.println("Bedrooms: " + bedrooms + "\nBaths: " + baths);
    }
}

class School extends Building {
    int classrooms;
    String gradeLevel;

    public School(int squareFootage, int stories, int classrooms, String gradeLevel) {
        super(squareFootage, stories);
        this.classrooms = classrooms;
        this.gradeLevel = gradeLevel;
    }

    @Override
    public void display() {
        super.display();
        System.out.println("Classrooms: " + classrooms + "\nGrade Level: " + gradeLevel);
    }
}

public class Q3_buildingSubClass {
    public static void main(String[] args) {
        Building building = new Building(1000, 2);
        House house = new House(2000, 1, 3, 2);
        School school = new School(5000, 3, 10, "Elementary");

        System.out.println("Building details:");
        building.display();

        System.out.println("\nHouse details:");
        house.display();

        System.out.println("\nSchool details:");
        school.display();
    }
}