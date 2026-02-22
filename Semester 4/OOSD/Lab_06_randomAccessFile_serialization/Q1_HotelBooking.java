import java.io.IOException;
import java.io.RandomAccessFile;

public class Q1_HotelBooking {
    static String f_name = "rooms.bin";
    static int room_length = 20;
    static int size = 4 + (room_length * 2) + 8 + 1;

    public static void addRoom(int roomNumber, String roomType, double price, boolean status) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(f_name, "rw")) {
            raf.seek(raf.length());
            raf.writeInt(roomNumber);

            
            StringBuilder sb = new StringBuilder(roomType);
            sb.setLength(room_length); 
            raf.writeChars(sb.toString());

            raf.writeDouble(price);
            raf.writeBoolean(status);
        }
    }

    public static void viewRoom(int roomNumber) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(f_name, "r")) {
            long numRecords = raf.length() / size;
            for (int i = 0; i < numRecords; i++) {
                raf.seek(i * size);
                int rn = raf.readInt();

                char[] typeChars = new char[room_length];
                for (int j = 0; j < room_length; j++) {
                    typeChars[j] = raf.readChar();
                }
                String roomType = new String(typeChars).trim();

                double price = raf.readDouble();
                boolean status = raf.readBoolean();

                if (rn == roomNumber) {
                    System.out.println("Room Number: " + rn);
                    System.out.println("Room Type: " + roomType);
                    System.out.println("Price per Night: " + price);
                    System.out.println("Booking Status: " + (status ? "Booked" : "Available"));
                    return;
                }
            }
            System.out.println("Room not found.");
        }
    }

    public static void updateStatus(int roomNumber, boolean newStatus) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(f_name, "rw")) {
            long numRecords = raf.length() / size;
            for (int i = 0; i < numRecords; i++) {
                raf.seek(i * size);
                int rn = raf.readInt();

                if (rn == roomNumber) {
                    raf.seek(i * size + 4 + (room_length * 2) + 8);
                    raf.writeBoolean(newStatus);
                    System.out.println("Booking status updated.");
                    return;
                }
            }
            System.out.println("Room not found.");
        }
    }
    
    public static void main(String[] args) throws IOException {
        addRoom(101, "Deluxe", 1500.0, false);
        addRoom(102, "Suite", 2500.0, true);

        viewRoom(101);
        updateStatus(101, true);
        viewRoom(101);
    }
}
