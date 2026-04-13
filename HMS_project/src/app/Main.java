package app;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.TabPane;
import javafx.stage.Stage;
import service.HotelService;
import ui.RoomTab;
import ui.CustomerTab;
import ui.BookingTab;

public class Main extends Application {

    @Override
    public void start(Stage stage) {
        HotelService service = new HotelService();

        TabPane tabPane = new TabPane();

        tabPane.getTabs().addAll(
                new RoomTab(service),
                new CustomerTab(service),
                new BookingTab(service)
        );

        stage.setTitle("Hotel Management System");
        stage.setScene(new Scene(tabPane, 900, 600));
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}