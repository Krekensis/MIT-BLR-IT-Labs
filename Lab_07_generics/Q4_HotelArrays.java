public class Q4_HotelArrays {
    public static <T> void printArray(T[] array) {
        for (T element : array) {
            System.out.print(element + " ");
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        Integer[] roomNumbers = {101, 102, 103};
        String[] roomTypes = {"Single", "Double", "Suite"};
        Double[] roomPrices = {80.0, 120.0, 300.0};

        System.out.print("Room Numbers: ");
        printArray(roomNumbers);

        System.out.print("Room Types: ");
        printArray(roomTypes);

        System.out.print("Prices: ");
        printArray(roomPrices);
    }
}