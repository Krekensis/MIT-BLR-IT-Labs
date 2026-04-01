class Room<T, U> {
    private T roomId;
    private U attribute;

    public Room(T roomId, U attribute) {
        this.roomId = roomId;
        this.attribute = attribute;
    }

    public void displayDetails() {
        System.out.println("Room ID: " + roomId + " | Attribute: " + attribute);
    }
}

public class Q1_HotelManagement {
    public static void main(String[] args) {
        // Integer ID and String Type
        Room<Integer, String> room1 = new Room<>(101, "Deluxe Suite");
        // String ID and Double Price
        Room<String, Double> room2 = new Room<>("R-202", 150.50);

        room1.displayDetails();
        room2.displayDetails();
    }
}