/*
5c. Implement a ShoppingCart class that contains an inner class Item.
    a) The Item class should have fields like itemName, quantity, and price.
    b) The ShoppingCart class should provide methods to add items, calculate the total price, and display the cart contents.
*/
package Lab_05_Nested_Classes;

class ShoppingCart {
    Item items[];
    double totalPrice;

    public ShoppingCart() {
        items = new Item[5];
        totalPrice = 0.0;
    }

    class Item {
        String itemName;
        int quantity;
        double price;

        public Item(String itemName, int quantity, double price) {
            this.itemName = itemName;
            this.quantity = quantity;
            this.price = price;
        }

        public void display() {
            System.out.println("Item: " + itemName + "\tQuantity: " + quantity + "\tPrice: " + price);
        }
    }

    public void addItem(String itemName, int quantity, double price) {
        for (int i = 0; i < items.length; i++) {
            if (items[i] == null) {
                items[i] = new Item(itemName, quantity, price);
                totalPrice += quantity * price;
                break;
            }
        }
    }

    public void display() {
        for (Item item : items) {
            if (item != null) {
                item.display();
            }
        }
        System.out.println("Total Price: " + totalPrice);
    }
}

public class Q3_shoppingCart {
    public static void main(String[] args) {
        ShoppingCart cart = new ShoppingCart();
        cart.addItem("Bread", 2, 20.0);
        cart.addItem("Milk", 1, 30.0);
        cart.addItem("Eggs", 6, 5.0);
        cart.display();
    }
}
