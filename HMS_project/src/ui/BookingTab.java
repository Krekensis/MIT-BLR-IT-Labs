package ui;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.geometry.Insets;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import model.Booking;
import model.Customer;
import model.Room;
import service.HotelService;

public class BookingTab extends Tab {

    public BookingTab(HotelService service) {
        setText("Bookings");
        setClosable(false);

        // ---------------- INPUT FIELDS ----------------
        ComboBox<Customer> cbCustomer = new ComboBox<>(service.getCustomers());
        TextField tfContact = new TextField();
        tfContact.setEditable(false);
        ComboBox<Room> cbRoom = new ComboBox<>(service.getRooms());

        cbCustomer.setPromptText("Select customer");
        cbRoom.setPromptText("Select room");
        tfContact.setPromptText("Auto-filled");

        Label status = new Label();

        if (service.getCustomers().isEmpty()) {
            cbCustomer.setPromptText("No customers available");
            cbCustomer.setDisable(true);
        }

        if (service.getRooms().isEmpty()) {
            cbRoom.setPromptText("No rooms available");
            cbRoom.setDisable(true);
        }

        // ---------------- AUTO-FILL CUSTOMER ----------------
        cbCustomer.setOnAction(e -> {
            Customer c = cbCustomer.getValue();

            if (c != null) {
                tfContact.setText(c.getContact());
                status.setText("");
            }
        });

        // ---------------- BUTTONS ----------------
        Button bookBtn = new Button("Book Room");
        Button checkoutBtn = new Button("Checkout");

        // ---------------- BOOK LOGIC ----------------
        bookBtn.setOnAction(e -> {
            Customer customer = cbCustomer.getValue();
            Room room = cbRoom.getValue();
            if (customer == null) {
                setError(status, "Select a customer");
                return;
            }
            if (room == null) {
                setError(status, "Select a room");
                return;
            }

            boolean success = service.bookRoom(customer, room);

            if (success) {
                setSuccess(status, "Booking successful");
                cbCustomer.setValue(null);
                cbRoom.setValue(null);
                tfContact.clear();
            } else {
                setError(status, "Room unavailable or does not exist");
            }
        });
        bookBtn.disableProperty().bind(cbCustomer.valueProperty().isNull().or(cbRoom.valueProperty().isNull()));

        // ---------------- CHECKOUT ----------------
        checkoutBtn.setOnAction(e -> {
            Room room = cbRoom.getValue();

            boolean success = service.checkout(room);

            if (success) {
                setSuccess(status, "Checkout successful");
                cbCustomer.setValue(null);
                cbRoom.setValue(null);
                tfContact.clear();
            } else {
                setError(status, "Room not booked");
            }
        });
        checkoutBtn.disableProperty().bind( cbCustomer.valueProperty().isNull().or(cbRoom.valueProperty().isNull()));

        // ---------------- TABLE VIEW ----------------
        TableView<Booking> table = new TableView<>(service.getBookings());

        TableColumn<Booking, String> colName = new TableColumn<>("Customer");
        colName.setCellValueFactory(cell -> new SimpleStringProperty(cell.getValue().getCustomer().getName()));

        TableColumn<Booking, String> colContact = new TableColumn<>("Contact");
        colContact.setCellValueFactory(cell -> new SimpleStringProperty(cell.getValue().getCustomer().getContact()));

        TableColumn<Booking, Integer> colRoom = new TableColumn<>("Room No");
        colRoom.setCellValueFactory(
                cell -> new SimpleIntegerProperty(cell.getValue().getRoom().getRoomNumber()).asObject());

        table.getColumns().addAll(colName, colContact, colRoom);

        // ---------------- LAYOUT ----------------
        GridPane grid = new GridPane();
        grid.setHgap(10);
        grid.setVgap(10);

        grid.add(new Label("Customer Name"), 0, 0);
        grid.add(cbCustomer, 1, 0);

        grid.add(new Label("Contact"), 0, 1);
        grid.add(tfContact, 1, 1);

        grid.add(new Label("Room No"), 0, 2);
        grid.add(cbRoom, 1, 2);

        HBox buttons = new HBox(10, bookBtn, checkoutBtn);

        VBox root = new VBox(15, grid, buttons, status, table);
        root.setStyle("-fx-background-color: #f5f7fa;");
        root.setPadding(new Insets(15));

        setContent(root);
    }

    // ---------------- HELPERS ----------------
    private void setError(Label label, String msg) {
        label.setStyle("-fx-text-fill: red;");
        label.setText(msg);
    }

    private void setSuccess(Label label, String msg) {
        label.setStyle("-fx-text-fill: green;");
        label.setText(msg);
    }
}