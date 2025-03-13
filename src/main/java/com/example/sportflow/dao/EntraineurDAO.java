// EntraineurDAO.java (updated to match table name 'entraineurs')
package com.example.sportflow.dao;

import com.example.sportflow.Config.ConnectionDB;
import com.example.sportflow.model.Entraineur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EntraineurDAO {
    private final Connection con;

    public EntraineurDAO() throws SQLException, ClassNotFoundException {
        this.con = ConnectionDB.getConnection();
    }

    public void ajouterEntraineur(Entraineur en) throws SQLException {
        if (en == null) {
            throw new IllegalArgumentException("Entraineur cannot be null");
        }

        String sql = "INSERT INTO entraineurs ( nom, specialite) VALUES ( ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, en.getNom());
            ps.setString(2, en.getSpecialite());
            ps.executeUpdate();
        }
    }

    public void modifierEntraineur(Entraineur en) throws SQLException {
        if (en == null) {
            throw new IllegalArgumentException("Entraineur cannot be null");
        }

        String sql = "UPDATE entraineurs SET nom = ?, specialite = ? WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, en.getNom());
            ps.setString(2, en.getSpecialite());
            ps.setInt(3, en.getId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("No entraineur found with id: " + en.getId());
            }
        }
    }

    public List<Entraineur> afficherEntraineur() throws SQLException {
        List<Entraineur> entraineurs = new ArrayList<>();
        String sql = "SELECT * FROM entraineurs";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Entraineur entraineur = new Entraineur(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("specialite"));
                entraineurs.add(entraineur);
            }
        }
        return entraineurs;
    }

    public Entraineur getEntraineurById(int id) throws SQLException {
        String sql = "SELECT * FROM entraineurs WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Entraineur(
                            rs.getInt("id"),
                            rs.getString("nom"),
                            rs.getString("specialite"));
                }
            }
        }
        return null;
    }

    public void supprimerEntraineur(int id) throws SQLException {
        String sql = "DELETE FROM entraineurs WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("No entraineur found with id: " + id);
            }
        }
    }
}