package com.example.sportflow.dao;

import com.example.sportflow.Config.ConnectionDB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

public class MembreDAO {
    private Connection conn;
    public MembreDAO() throws SQLException, ClassNotFoundException {
        conn = ConnectionDB.getConnection();
    }



}
