// ConnectionDB.java
package com.example.sportflow.Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionDB {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportflow", "root", "");
        Statement statement = connection.createStatement();

        String membreTable = "CREATE TABLE IF NOT EXISTS membres (" +
                "id INT(12) PRIMARY KEY AUTO_INCREMENT," +
                "nom VARCHAR(50)," +
                "naissance DATE," +
                "sportpratique VARCHAR(50))";
        statement.executeUpdate(membreTable);

        String entraineurTable = "CREATE TABLE IF NOT EXISTS entraineurs (" +
                "id INT(10) PRIMARY KEY AUTO_INCREMENT," +
                "nom VARCHAR(50)," +
                "specialite VARCHAR(50))";  // Changed DATE to VARCHAR since specialty should be text
        statement.executeUpdate(entraineurTable);

        String seanceTable = "CREATE TABLE IF NOT EXISTS seance (" +
                "id INT(12) PRIMARY KEY AUTO_INCREMENT," +
                "id_Membre INT(10)," +
                "id_Entraineur INT(10)," +
                "dateHeure DATETIME," +
                "FOREIGN KEY (id_Membre) REFERENCES membres(id)," +
                "FOREIGN KEY (id_Entraineur) REFERENCES entraineurs(id))";  // Fixed foreign key reference
        statement.executeUpdate(seanceTable);

        String userTable = "CREATE TABLE IF NOT EXISTS users (" +
                "id INT(12) PRIMARY KEY AUTO_INCREMENT," +
                "username VARCHAR(50)," +
                "password VARCHAR(50)," +
                "role VARCHAR(50))";
        statement.executeUpdate(userTable);

        return connection;
    }
}