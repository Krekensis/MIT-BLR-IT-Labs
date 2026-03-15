import java.io.*;
import java.util.*;

class Room implements Serializable {
    static final long serialVersionUID = 1L;
    int roomNumber;
    String roomType;
    double pricePerNight;
    boolean status;
    String name;

    public Room(int roomNumber, String roomType, double pricePerNight, boolean status, String name) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.status = status;
        this.name = name;
    }

    public int getRoomNumber() { return roomNumber; }
    public boolean isBooked() { return status; }
    public void setstatus(boolean status, String name) {
        this.status = status;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Room Number: " + roomNumber +
               "\nRoom Type: " + roomType +
               "\nPrice per Night: " + pricePerNight +
               "\nBooking Status: " + (status ? "Booked" : "Available") +
               "\nGuest Name: " + (name == null ? "N/A" : name);
    }
}

public class Q2_HotelBooking {
    static final String FILE_NAME = "rooms2.bin";

    static void saveRooms(List<Room> rooms) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_NAME))) {
            oos.writeObject(rooms);
        }
    }

    @SuppressWarnings("unchecked")
    static List<Room> loadRooms() throws IOException, ClassNotFoundException {
        File file = new File(FILE_NAME);
        if (!file.exists()) return new ArrayList<>();
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(FILE_NAME))) {
            return (List<Room>) ois.readObject();
        }
    }

    public static void addRoom(Room room) throws IOException, ClassNotFoundException {
        List<Room> rooms = loadRooms();
        rooms.add(room);
        saveRooms(rooms);
    }

    public static void displayAllRooms() throws IOException, ClassNotFoundException {
        List<Room> rooms = loadRooms();
        for (Room room : rooms) {
            System.out.println(room);
            System.out.println("----------------------");
        }
    }

    public static void searchRoom(int roomNumber) throws IOException, ClassNotFoundException {
        List<Room> rooms = loadRooms();
        for (Room room : rooms) {
            if (room.getRoomNumber() == roomNumber) {
                System.out.println(room);
                return;
            }
        }
        System.out.println("Room not found.");
    }

    public static void updatestatus(int roomNumber, boolean status, String name) throws IOException, ClassNotFoundException {
        List<Room> rooms = loadRooms();
        for (Room room : rooms) {
            if (room.getRoomNumber() == roomNumber) {
                room.setstatus(status, name);
                saveRooms(rooms);
                System.out.println("Booking status updated.");
                return;
            }
        }
        System.out.println("Room not found.");
    }

    public static void main(String[] args) {
        try {
            addRoom(new Room(101, "Deluxe", 1500.0, false, null));
            addRoom(new Room(102, "Suite", 2500.0, true, "Alice"));

            System.out.println("All Rooms:");
            displayAllRooms();

            System.out.println("\nSearch Room 101:");
            searchRoom(101);

            System.out.println("\nUpdate Room 101:");
            updatestatus(101, true, "Bob");

            System.out.println("\nRoom 101 after update:");
            searchRoom(101);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
