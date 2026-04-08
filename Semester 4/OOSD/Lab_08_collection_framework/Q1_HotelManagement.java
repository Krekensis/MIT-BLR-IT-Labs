import java.util.*;

class Room {
    int roomNum;
    String type;
    double price;
    boolean isAvailable;

    Room(int roomNum, String type, double price) {
        this.roomNum = roomNum;
        this.type = type;
        this.price = price;
        this.isAvailable = true;
    }
}

class Customer {
    int custId;
    String name;
    String contact;
    int roomNum;

    Customer(int custId, String name, String contact, int roomNum) {
        this.custId = custId;
        this.name = name;
        this.contact = contact;
        this.roomNum = roomNum;
    }
}

public class Q1_HotelManagement {

    static ArrayList<Room> rooms = new ArrayList<>();
    static ArrayList<Customer> customers = new ArrayList<>();
    static HashMap<Integer, Customer> rcMap = new HashMap<>();

    static Scanner sc = new Scanner(System.in);

    static void addRoom() {
        try {
            System.out.print("Enter room no: ");
            int num = sc.nextInt();
            sc.nextLine();

            if (rooms.stream().anyMatch(r -> r.roomNum == num)) {
                System.out.println("Room number already exists!");
                return;
            }

            System.out.print("Enter Room Type (Single/Double/Deluxe/Suite): ");
            String type = sc.nextLine();

            System.out.print("Enter Price: ");
            double price = sc.nextDouble();

            rooms.add(new Room(num, type, price));
            System.out.println("Room added successfully!");
        } catch (Exception e) {
            System.out.println("Invalid input!");
            sc.nextLine();
        }
    }

    static void displayAvailableRooms() {
        if (rooms.isEmpty()) {
            System.out.println("No rooms available.");
            return;
        }

        Collections.sort(rooms, Comparator.comparingDouble(r -> r.price));

        Iterator<Room> it = rooms.iterator();
        while (it.hasNext()) {
            Room r = it.next();
            if (r.isAvailable) {
                System.out.println("Room No: " + r.roomNum + ", Type: " + r.type + ", Price: " + r.price);
            }
        }
    }

    static void addCustomer() {
        try {
            System.out.print("Enter Customer ID: ");
            int id = sc.nextInt();
            sc.nextLine();

            if (customers.stream().anyMatch(r -> r.custId == id)) {
                System.out.println("Customer Id already exists!");
                return;
            }

            System.out.print("Enter Name: ");
            String name = sc.nextLine();

            System.out.print("Enter Contact: ");
            String contact = sc.nextLine();

            customers.add(new Customer(id, name, contact, -1));
            System.out.println("Customer added!");
        } catch (Exception e) {
            System.out.println("Invalid input!");
            sc.nextLine();
        }
    }

    static void bookRoom() {
        try {
            System.out.print("Enter Customer ID: ");
            int id = sc.nextInt();

            Customer customer = customers.stream().filter(c -> c.custId == id).findFirst().orElse(null);

            /*for (Customer c : customers) {
                if (c.custId == id) {
                    customer = c;
                    break;
                }
            }*/

            if (customer == null) {
                System.out.println("Customer not found!");
                return;
            }

            System.out.print("Enter Room Number: ");
            int roomNo = sc.nextInt();

            for (Room r : rooms) {
                if (r.roomNum == roomNo) {
                    if (!r.isAvailable) {
                        System.out.println("Room already booked!");
                        return;
                    }

                    r.isAvailable = false;
                    customer.roomNum = roomNo;
                    rcMap.put(roomNo, customer);

                    System.out.println("Room booked successfully!");
                    return;
                }
            }

            System.out.println("Room not found!");
        } catch (Exception e) {
            System.out.println("Error occurred!");
            sc.nextLine();
        }
    }

    // Checkout Customer
    static void checkout() {
        try {
            System.out.print("Enter Room Number: ");
            int roomNo = sc.nextInt();

            if (!rcMap.containsKey(roomNo)) {
                System.out.println("No booking found!");
                return;
            }

            Customer c = rcMap.remove(roomNo);
            customers.remove(c);

            rooms.stream().filter(r -> r.roomNum == roomNo).findFirst().ifPresent(r -> r.isAvailable = true);

            /*for (Room r : rooms) {
                if (r.roomNum == roomNo) {
                    r.isAvailable = true;
                    break;
                }
            }*/

            System.out.println("Checkout successful!");
        } catch (Exception e) {
            System.out.println("Error!");
            sc.nextLine();
        }
    }

    // Display Customers
    static void displayCustomers() {
        if (customers.isEmpty()) {
            System.out.println("No customers found.");
            return;
        }

        Iterator<Customer> it = customers.iterator();
        while (it.hasNext()) {
            Customer c = it.next();
            System.out.println("ID: " + c.custId + ", Name: " + c.name + ", Contact: " + c.contact + ", Room No: " + c.roomNum);                    
        }
    }
    public static void main(String[] args) {
        int choice;
        do {
            System.out.println("\n--- HOTEL MANAGEMENT SYSTEM ---");
            System.out.println("1. Add Room");
            System.out.println("2. Display Available Rooms");
            System.out.println("3. Add Customer");
            System.out.println("4. Book Room");
            System.out.println("5. Checkout Customer");
            System.out.println("6. Display All Customers");
            System.out.println("7. Exit");

            System.out.print("Enter choice: ");
            choice = sc.nextInt();

            switch (choice) {
                case 1 -> addRoom();
                case 2 -> displayAvailableRooms();
                case 3 -> addCustomer();
                case 4 -> bookRoom();
                case 5 -> checkout();
                case 6 -> displayCustomers();
                case 7 -> System.out.println("Exiting...");
                default -> System.out.println("Invalid choice!");
            }

        } while (choice != 7);
    }
}