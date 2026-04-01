class billingSystem<T extends Number> {
    private T price;
    private T discount;

    public billingSystem(T price, T discount) {
        this.price = price;
        this.discount = discount;
    }

    public void calc() {
        double finalPrice = price.doubleValue() - discount.doubleValue();
        System.out.println("Original Price: " + price);
        System.out.println("Discount: " + discount);
        System.out.println("Final Charge: $" + finalPrice);
    }
}

public class Q3_BillingSystem {
    public static void main(String[] args) {
        billingSystem<Double> bill = new billingSystem<>(200.0, 25.5);
        bill.calc();
        
        // billingSystem<String> error = new billingSystem<>("High", "Low"); 
        // ^ This would cause a compile-time error.
    }
}