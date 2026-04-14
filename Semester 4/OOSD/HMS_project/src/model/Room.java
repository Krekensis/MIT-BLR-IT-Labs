package model;

import javafx.beans.property.*;

public class Room {

    private IntegerProperty roomNumber;
    private StringProperty type;
    private DoubleProperty price;
    private BooleanProperty available;

    public Room(int roomNumber, String type, double price) {
        this.roomNumber = new SimpleIntegerProperty(roomNumber);
        this.type = new SimpleStringProperty(type);
        this.price = new SimpleDoubleProperty(price);
        this.available = new SimpleBooleanProperty(true);
    }

    public int getRoomNumber() { return roomNumber.get(); }
    public String getType() { return type.get(); }
    public double getPrice() { return price.get(); }
    public boolean isAvailable() { return available.get(); }

    public void setAvailable(boolean available) {
        this.available.set(available);
    }

    public IntegerProperty roomNumberProperty() { return roomNumber; }
    public StringProperty typeProperty() { return type; }
    public DoubleProperty priceProperty() { return price; }
    public BooleanProperty availableProperty() { return available; }

    @Override
    public String toString() {
        return getRoomNumber() + " - " + getType() + " $" + getPrice();
    }
}