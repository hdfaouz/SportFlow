package com.example.sportflow.controller;

import com.example.sportflow.dao.MembreDAO;
import com.example.sportflow.model.Entraineur;
import com.example.sportflow.model.Membre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

@WebServlet("/membre")
public class MembreServlet extends HttpServlet {
    private MembreDAO membreDAO;
    public void init() {
        membreDAO = new MembreDAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "default";
        }
        switch (action) {
            case "ajouterMembre":
                ajouteMem(request, response);
                break;
                case "AfficherMembre":
                    try {
                        AfficherMemb(request,response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    break;
            case"ModifierMembre":
                try {
                    modifier(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
                case "SupprimerMembre":
                    try {
                        supprimer(request,response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    break;

        }
    }

    private void supprimer(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        MembreDAO.deleteMembre();
        response.sendRedirect(request.getContextPath() +"/membre");
    }

    private void modifier(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        Membre membre =MembreDAO.getMembreById();
        request.setAttribute("membre", membre);
        request.getRequestDispatcher("WEB-INF/Membre/modifierMembre.jsp");
    }

    private void AfficherMemb(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException {
        List<Membre> membre = MembreDAO.getAllMembre();
        request.setAttribute("membre", membre);
        request.getRequestDispatcher("/WEB-INF/Membre/afficherMembre.jsp");
    }

    private void ajouteMem(HttpServletRequest request, HttpServletResponse response) {
        request.getRequestDispatcher("/WEB-INF/Membre/ajouterMembre.jsp");
    }
    private void saveNewMembre(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ClassNotFoundException {

       Membre membre = new Membre();

        membre.setNom(req.getParameter("nom"));
        membre.setSportPratique(req.getParameter("SportPratique"));
        membre.setNaissance(Date.valueOf(req.getParameter("Naissance")));
        System.out.println(membre);
        membreDAO.AjouterMembre();
        resp.sendRedirect(req.getContextPath() + "/membre");
    }
    private void updateMembre(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ClassNotFoundException {
       Membre membre = new Membre();
        membre.setId(Integer.parseInt(req.getParameter("id")));
        membre.setNom(req.getParameter("nom"));
        membre.setSportPratique(req.getParameter("SportPratique"));
        membre.setNaissance(Date.valueOf(req.getParameter("Naissance")));
       membreDAO.ModifierMembre();
        resp.sendRedirect(req.getContextPath() + "/membre");
    }



}
