import java.io.*;
import java.util.*;

class Room implements Serializable {
    private static final long serialVersionUID = 1L;
    private int roomNumber;
    private String roomType;
    private double pricePerNight;
    private boolean bookingStatus;
    private String guestName;

    public Room(int roomNumber, String roomType, double pricePerNight, boolean bookingStatus, String guestName) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.bookingStatus = bookingStatus;
        this.guestName = guestName;
    }

    public int getRoomNumber() { return roomNumber; }
    public boolean isBooked() { return bookingStatus; }
    public void setBookingStatus(boolean status, String guestName) {
        this.bookingStatus = status;
        this.guestName = guestName;
    }

    @Override
    public String toString() {
        return "Room Number: " + roomNumber +
               "\nRoom Type: " + roomType +
               "\nPrice per Night: " + pricePerNight +
               "\nBooking Status: " + (bookingStatus ? "Booked" : "Available") +
               "\nGuest Name: " + (guestName == null ? "N/A" : guestName);
    }
}

public class Q2_HotelBooking {
    private static final String FILE_NAME = "rooms2.bin";

    private static void saveRooms(List<Room> rooms) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_NAME))) {
            oos.writeObject(rooms);
        }
    }

    @SuppressWarnings("unchecked")
    private static List<Room> loadRooms() throws IOException, ClassNotFoundException {
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

    public static void updateBookingStatus(int roomNumber, boolean status, String guestName) throws IOException, ClassNotFoundException {
        List<Room> rooms = loadRooms();
        for (Room room : rooms) {
            if (room.getRoomNumber() == roomNumber) {
                room.setBookingStatus(status, guestName);
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
            updateBookingStatus(101, true, "Bob");

            System.out.println("\nRoom 101 after update:");
            searchRoom(101);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
