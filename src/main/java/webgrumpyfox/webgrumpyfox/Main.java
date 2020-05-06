package webgrumpyfox.webgrumpyfox;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://db4free.net:3306/dbgrumpyfox?serverTimezone=Europe/Moscow&useSSL=false";
        String username = "grumpyfox";
        String password = "grumpyfox";
        System.out.println("Connecting...");

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            System.out.println("Connection successful!");
        } catch (SQLException e) {
            System.out.println("Connection failed!");
            e.printStackTrace();
        }
    }
}