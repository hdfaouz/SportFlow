package com.example.sportflow.dao;

import com.example.sportflow.Config.ConnectionDB;

import java.sql.Connection;
import java.sql.SQLException;

public class SeanceDAO {
    private Connection conn;
    public SeanceDAO() throws ClassNotFoundException, SQLException {
        conn = ConnectionDB.getConnection();
    }
}
