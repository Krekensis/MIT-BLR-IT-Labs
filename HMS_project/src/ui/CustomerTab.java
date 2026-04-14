package ui;

import javafx.beans.property.SimpleStringProperty;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import model.Customer;
import service.HotelService;

public class CustomerTab extends Tab {

    public CustomerTab(HotelService service) {
        setText("Customers");
        setClosable(false);

        // ---------------- TABLE VIEW ----------------
        TableView<Customer> table = new TableView<>(service.getCustomers());
        table.setPlaceholder(new Label("No customers yet"));

        TableColumn<Customer, String> colName = new TableColumn<>("Customer");
        colName.setCellValueFactory(cell -> new SimpleStringProperty(cell.getValue().getName()));

        TableColumn<Customer, String> colContact = new TableColumn<>("Contact");
        colContact.setCellValueFactory(cell -> new SimpleStringProperty(cell.getValue().getContact()));

        table.getColumns().addAll(colName, colContact);

        // ---------------- STATUS ----------------
        Label status = new Label();

        // ---------------- INPUTS ----------------
        TextField tfName = new TextField();
        TextField tfContact = new TextField();

        tfName.setPromptText("Enter customer name");
        tfContact.setPromptText("Enter phone number");

        // ---------------- REAL-TIME VALIDATION ----------------

        // Name: prevent empty-only spaces
        tfName.textProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal.trim().isEmpty()) {
                setError(status, "Name cannot be empty.");
            } else {
                if (!status.getText().equals("Customer successfully added!")) {
                    status.setText("");
                }
            }
        });

        // Contact: digits only
        tfContact.textProperty().addListener((obs, oldVal, newVal) -> {
            if (!newVal.matches("\\d*")) {
                tfContact.setText(newVal.replaceAll("[^\\d]", ""));
                setError(status, "Contact number must be numeric.");
            } else {
                if (!status.getText().equals("Customer successfully added!")) {
                    status.setText("");
                }
            }
        });

        // ---------------- BUTTON ----------------
        Button addBtn = new Button("Add Customer");

        addBtn.setOnAction(e -> {

            String name = tfName.getText().trim();
            String contact = tfContact.getText().trim();

            // Validation
            if (name.isEmpty() || contact.isEmpty()) {
                setError(status, "All fields are required");
                return;
            }

            if (contact.length() < 7) {
                setError(status, "Contact number must be at least 7 digits.");
                return;
            }

            service.addCustomer(new Customer(name, contact));

            setSuccess(status, "Customer successfully added!");

            tfName.clear();
            tfContact.clear();
        });

        // ---------------- LAYOUT ----------------
        GridPane form = new GridPane();
        form.setHgap(10);
        form.setVgap(10);
        form.setAlignment(Pos.CENTER_LEFT);
        form.setPadding(new Insets(10));

        form.add(new Label("Name"), 0, 0);
        form.add(tfName, 1, 0);

        form.add(new Label("Contact"), 0, 1);
        form.add(tfContact, 1, 1);

        form.add(addBtn, 1, 2);

        VBox root = new VBox(15, form, status, table);
        root.setPadding(new Insets(15));
        root.setStyle("-fx-background-color: #f5f7fa;");

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