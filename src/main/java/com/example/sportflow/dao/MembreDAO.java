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
        public static List<Membre> getAllMembre () throws SQLException, ClassNotFoundException {
            List<Membre> membres = new ArrayList<>();
            String sql = "SELECT * FROM membre";
            Connection con = ConnectionDB.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Membre membre = new Membre();
                membre.setId(rs.getInt("id"));
                membre.setNaissance(rs.getDate("dateDeNaissance"));
                membre.setNom(rs.getString("nom"));
                membres.add(membre);
            }
            return membres;
        }

        public static Membre getMembreById(int id) throws SQLException, ClassNotFoundException {
            String sql = "SELECT * FROM membre WHERE id = ?";
            Connection con = ConnectionDB.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Membre(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("SportPratique"),
                        rs.getDate("Naissance"));
            }
         return null;

        }



    public void AjouterMembre() throws SQLException, ClassNotFoundException{
            Membre membre = new Membre();
            String sql = "INSERT INTO membre(id, nom,SportPratique,Naissance) VALUES(?,?,?,?)";
            Connection conn = ConnectionDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, membre.getId());
            ps.setString(2, membre.getNom());
            ps.setString(3, membre.getSportPratique());
            ps.setDate(4, membre.getNaissance());
            ps.executeUpdate();
        }

        public static Membre ModifierMembre() throws SQLException, ClassNotFoundException{
            Membre membre = new Membre();
            String sql = "UPDATE membre SET nom=?,SportPratique=?,Naissance=? WHERE id=?";
            Connection conn = ConnectionDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, membre.getNom());
            ps.setString(2, membre.getSportPratique());
            ps.setDate(3, membre.getNaissance());
            ps.setInt(4, membre.getId());
            ps.executeUpdate();
            return membre;
        }

        public static void deleteMembre() throws SQLException, ClassNotFoundException{
            Membre membre = new Membre();
            String sql = "DELETE FROM membre WHERE id=?";
            Connection conn = ConnectionDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, membre.getId());
            ps.executeUpdate();
        }


}




