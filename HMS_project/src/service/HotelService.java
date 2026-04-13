package service;

import javafx.collections.*;
import model.*;

public class HotelService {

    private ObservableList<Room> rooms = FXCollections.observableArrayList();
    private ObservableList<Customer> customers = FXCollections.observableArrayList();
    private ObservableList<Booking> bookings = FXCollections.observableArrayList();

    public ObservableList<Room> getRooms() {
        return rooms;
    }

    public ObservableList<Customer> getCustomers() {
        return customers;
    }

    public ObservableList<Booking> getBookings() {
        return bookings;
    }

    public void addRoom(Room room) {
        rooms.add(room);
    }

    public void addCustomer(Customer customer) {
        customers.add(customer);
    }

    public boolean roomExists(int roomNo) {
        return rooms.stream().anyMatch(r -> r.getRoomNumber() == roomNo);
    }

    public boolean bookRoom(Customer customer, Room room) {

        if (room == null || !room.isAvailable())
            return false;

        room.setAvailable(false);
        bookings.add(new Booking(customer, room));

        return true;
    }

    public boolean checkout(Room room) {

        if (room == null)
            return false;

        Booking booking = bookings.stream()
                .filter(b -> b.getRoom() == room)
                .findFirst()
                .orElse(null);

        if (booking == null)
            return false;

        room.setAvailable(true);
        bookings.remove(booking);

        return true;
    }
}