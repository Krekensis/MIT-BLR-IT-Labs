package model;

public class Booking {
    private Customer customer;
    private Room room;

    public Booking(Customer customer, Room room) {
        this.customer = customer;
        this.room = room;
    }

    public Customer getCustomer() { return customer; }
    public Room getRoom() { return room; }
}