package com.example.sportflow.controller;

import com.example.sportflow.dao.EntraineurDAO;
import com.example.sportflow.model.Entraineur;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/entraineur")
public class EntraineurServlet extends HttpServlet {
    private EntraineurDAO entraineurDAO;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            entraineurDAO = new EntraineurDAO();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Failed to initialize EntraineurDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "afficher";
        }
        try {
            switch (action.toLowerCase()) {
                case "ajouter":
                    ajouterEnt(req, resp);
                    break;
                case "modifier":
                    modifierEnt(req, resp);
                    break;
                case "supprimer":
                    supprimerEnt(req, resp);
                    break;
                case "afficher":
                default:
                    afficher(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("ajouter".equalsIgnoreCase(action)) {
                saveNewEntraineur(req, resp);
            } else if ("modifier".equalsIgnoreCase(action)) {
                updateEntraineur(req, resp);
            } else {
                afficher(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error during POST", e);
        }
    }

    private void afficher(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        List<Entraineur> entraineurs = entraineurDAO.afficherEntraineur();
        req.setAttribute("entraineurs", entraineurs);
        req.getRequestDispatcher("/WEB-INF/Entraineur/entraineur-list.jsp").forward(req, resp);
    }

    private void supprimerEnt(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        entraineurDAO.supprimerEntraineur(id);
        resp.sendRedirect(req.getContextPath() + "/entraineur");
    }

    private void modifierEnt(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Entraineur entraineur = entraineurDAO.getEntraineurById(id);
        req.setAttribute("entraineur", entraineur);
        req.getRequestDispatcher("/WEB-INF/Entraineur/entraineur-edit.jsp").forward(req, resp);
    }

    private void ajouterEnt(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/Entraineur/entraineur-add.jsp").forward(req, resp);

    }

    private void saveNewEntraineur(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {

        Entraineur entraineur = new Entraineur();
        //entraineur.setId(Integer.parseInt(req.getParameter("id")));
        entraineur.setNom(req.getParameter("nom"));
        entraineur.setSpecialite(req.getParameter("specialite"));
        System.out.println(entraineur);
        entraineurDAO.ajouterEntraineur(entraineur);
        resp.sendRedirect(req.getContextPath() + "/entraineur");
    }

    private void updateEntraineur(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        Entraineur entraineur = new Entraineur();
        entraineur.setId(Integer.parseInt(req.getParameter("id")));
        entraineur.setNom(req.getParameter("nom"));
        entraineur.setSpecialite(req.getParameter("specialite"));
        entraineurDAO.modifierEntraineur(entraineur);
        resp.sendRedirect(req.getContextPath() + "/entraineur");
    }
}