class Q2_HotelManagement {

    public static <T> void display(T data) {
        System.out.println("Data: " + data);
    }

    public static void main(String[] args) {
        // 1. Room number (Integer)
        Integer roomNumber = 101;
        // 2. Room type (String)
        String roomType = "Deluxe";
        // 3. Price per night (Double)
        Double pricePerNight = 2499.99;
        // 4. Booking status (Boolean)
        Boolean isBooked = true;

        display(roomNumber);
        display(roomType);
        display(pricePerNight);
        display(isBooked);
    }
}