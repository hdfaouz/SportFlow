package com.example.sportflow.dao;

import com.example.sportflow.Config.ConnectionDB;
import com.example.sportflow.model.Membre;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MembreDAO {
    private Connection connection;
    public MembreDAO() throws SQLException, ClassNotFoundException {
        connection = ConnectionDB.getConnection();
    }
    public void ajouterMembre(Membre membre) throws SQLException {
        String query = "INSERT INTO members (nom,naissance,sportpratique) VALUES (?,?,?)";
        try (Connection connection = ConnectionDB.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, membre.getNom());
            preparedStatement.setDate(2,membre.getNaissance());
            preparedStatement.setString(3,membre.getSportPratique());
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public void modifierMembre(Membre membre) throws SQLException {
        String query = "UPDATE members SET nom=?,naissance=?,sportpratique=? WHERE id=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1,membre.getNom());
        preparedStatement.setDate(2, membre.getNaissance());
        preparedStatement.setString(3,membre.getSportPratique());
        preparedStatement.setInt(4,membre.getId());
        preparedStatement.executeUpdate();
    }
    public List<Membre> afficherMembre() throws SQLException {
        List<Membre> membreList = new ArrayList<Membre>();
        String query = "SELECT * FROM members";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            Membre membre = new Membre(
                    resultSet.getInt("id"),
                    resultSet.getString("nom"),
                    resultSet.getDate("naissance"),
                    resultSet.getString("sportpratique"));
            membreList.add(membre);
        }
        return membreList;
    }
    public void supprimerMembre(int id) throws SQLException {
        String query = "DELETE FROM members WHERE id=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1,id);
        preparedStatement.executeUpdate();
    }
    public Membre getMembreById(int id) throws SQLException {
        String query = "SELECT * FROM members WHERE id=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            return new Membre(
                    resultSet.getInt("id"),
                    resultSet.getString("nom"),
                    resultSet.getDate("naissance"),
                    resultSet.getString("sportpratique"));

        }
        return null;
    }

}




