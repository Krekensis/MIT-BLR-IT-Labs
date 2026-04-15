package model;

public class Customer {
    private static int counter = 1;

    private int id;
    private String name;
    private String contact;

    public Customer(String name, String contact) {
        this.id = counter++;
        this.name = name;
        this.contact = contact;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getContact() { return contact; }

    @Override
    public String toString() {
        return "ID: "+ id + " - " + name + " ( " + contact + " )";
    }
}