package ui;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.*;
import model.Room;
import service.HotelService;

public class RoomTab extends Tab {

    public RoomTab(HotelService service) {
        setText("Rooms");
        setClosable(false);

        // ---------------- TABLE ----------------
        TableView<Room> table = new TableView<>(service.getRooms());
        table.setPlaceholder(new Label("No rooms added"));

        TableColumn<Room, Integer> num = new TableColumn<>("Room No");
        num.setCellValueFactory(new PropertyValueFactory<>("roomNumber"));

        TableColumn<Room, String> type = new TableColumn<>("Type");
        type.setCellValueFactory(new PropertyValueFactory<>("type"));

        TableColumn<Room, Double> price = new TableColumn<>("Price");
        price.setCellValueFactory(new PropertyValueFactory<>("price"));

        TableColumn<Room, Boolean> avail = new TableColumn<>("Available");
        avail.setCellValueFactory(cell -> cell.getValue().availableProperty());
        avail.setCellFactory(col -> new TableCell<>() {
            @Override
            protected void updateItem(Boolean item, boolean empty) {
                super.updateItem(item, empty);
                if (empty || item == null) {
                    setText(null);
                } else {
                    setText(item ? "True" : "False");
                    setStyle(item ? "-fx-text-fill: #16a34a;" : "-fx-text-fill: #dc2626;");
                }
            }
        });

        table.getColumns().addAll(num, type, price, avail);

        // ---------------- STATUS ----------------
        Label status = new Label();

        // ---------------- INPUTS ----------------
        TextField tfNum = new TextField();
        ComboBox<String> cbType = new ComboBox<>();
        cbType.getItems().addAll("Single", "Double", "Deluxe");
        TextField tfPrice = new TextField();

        tfNum.setPromptText("Room number");
        tfPrice.setPromptText("Price per day");
        cbType.setPromptText("Select room type");

        // ---------------- REAL-TIME VALIDATION ----------------

        // Room number → integers only
        tfNum.textProperty().addListener((obs, oldVal, newVal) -> {
            if (!newVal.matches("\\d*")) {
                tfNum.setText(newVal.replaceAll("[^\\d]", ""));
                setError(status, "Room number must be integer");
            }
        });

        // Price → decimal allowed
        tfPrice.textProperty().addListener((obs, oldVal, newVal) -> {
            if (!newVal.matches("\\d*(\\.\\d*)?")) {
                tfPrice.setText(newVal.replaceAll("[^\\d.]", ""));
                setError(status, "Price must be numeric");
            }
        });

        // ---------------- BUTTON ----------------
        Button addBtn = new Button("Add Room");

        addBtn.setOnAction(e -> {

            // Empty checks
            if (tfNum.getText().isEmpty() || tfPrice.getText().isEmpty() || cbType.getValue() == null) {
                setError(status, "All fields are required");
                return;
            }

            int n;
            double p;

            // Safe parsing
            try {
                n = Integer.parseInt(tfNum.getText());
            } catch (Exception ex) {
                setError(status, "Room number must be integer");
                return;
            }

            try {
                p = Double.parseDouble(tfPrice.getText());
            } catch (Exception ex) {
                setError(status, "Invalid price");
                return;
            }

            // Duplicate check (AFTER parsing)
            if (service.roomExists(n)) {
                setError(status, "Room already exists");
                return;
            }

            // Add room
            service.addRoom(new Room(n, cbType.getValue(), p));

            setSuccess(status, "Room added successfully");

            clearFields(tfNum, tfPrice);
            cbType.setValue(null);
        });

        // ---------------- FORM ----------------
        GridPane form = new GridPane();
        form.setHgap(10);
        form.setVgap(10);
        form.setAlignment(Pos.CENTER_LEFT);
        form.setPadding(new Insets(10));

        form.add(new Label("Room No"), 0, 0);
        form.add(tfNum, 1, 0);

        form.add(new Label("Type"), 0, 1);
        form.add(cbType, 1, 1);

        form.add(new Label("Price"), 0, 2);
        form.add(tfPrice, 1, 2);

        form.add(addBtn, 1, 3);

        // ---------------- ROOT ----------------
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

    private void clearFields(TextField... fields) {
        for (TextField f : fields)
            f.clear();
    }
}