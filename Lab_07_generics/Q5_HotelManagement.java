class Pair<T, U> {
    private T key;
    private U value;

    public Pair(T key, U value) {
        this.key = key;
        this.value = value;
    }

    public void showBooking() {
        System.out.println("Room: " + key + " -> Guest: " + value);
    }
}

public class Q5_HotelManagement {
    public static void main(String[] args) {
        Pair<Integer, String> booking1 = new Pair<>(401, "Alice Johnson");
        Pair<Integer, String> booking2 = new Pair<>(402, "Bob Smith");

        System.out.println("Current Booking Records:");
        booking1.showBooking();
        booking2.showBooking();
    }
}