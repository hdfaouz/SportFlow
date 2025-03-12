package com.example.sportflow.dao;

import com.example.sportflow.Config.ConnectionDB;

import java.sql.Connection;
import java.sql.SQLException;

public class UserDAO {
     private Connection conn;
     private UserDAO() throws SQLException, ClassNotFoundException {
         conn = ConnectionDB.getConnection();



     }
}
