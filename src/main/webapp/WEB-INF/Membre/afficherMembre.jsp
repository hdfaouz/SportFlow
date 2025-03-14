<%@ page import="com.example.sportflow.model.Membre" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Membre> membreList = (List<Membre>) request.getAttribute("membreList");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Membres</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(135deg, #f1f3f5, #ced4da); /* Dégradé gris clair moderne */
            min-height: 100vh;
            padding: 2.5rem;
            font-family: 'Arial', sans-serif;
        }
        h2 {
            color: #1a73e8; /* Bleu vif */
            margin-bottom: 2rem;
            font-weight: 600;
        }
        .table-container {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
        }
        .table {
            margin-bottom: 0;
        }
        .table thead {
            background-color: #1a73e8; /* Bleu vif pour l'en-tête */
            color: white;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-add {
            background-color: #28a745; /* Vert sportif */
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }
        .btn-add:hover {
            background-color: #218838; /* Vert plus foncé */
        }
        .btn-modify {
            background-color: #1a73e8; /* Bleu vif */
            border: none;
            border-radius: 6px;
            padding: 6px 12px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        .btn-modify:hover {
            background-color: #1557b0; /* Bleu plus foncé */
        }
        .btn-delete {
            background-color: #dc3545; /* Rouge Bootstrap */
            border: none;
            border-radius: 6px;
            padding: 6px 12px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        .btn-delete:hover {
            background-color: #b02a37; /* Rouge plus foncé */
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Liste des Membres</h2>
    <a href="membres?action=new" class="btn btn-add text-white mb-4">Ajouter un Nouveau Membre</a>
    <div class="table-container">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Date de Naissance</th>
                <th>Sport Pratiqué</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Membre membre : membreList) { %>
            <tr>
                <td><%= membre.getId() %></td>
                <td><%= membre.getNom() %></td>
                <td><%= membre.getNaissance() %></td>
                <td><%= membre.getSportPratique() %></td>
                <td>
                    <a href="membres?action=afficherbyID&id=<%= membre.getId() %>" class="btn btn-modify text-white me-2">Modifier</a>
                    <a href="membres?action=supprimer&id=<%= membre.getId() %>" class="btn btn-delete text-white" onclick="return confirm('Voulez-vous vraiment supprimer ce membre ?');">Supprimer</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS (optionnel, pour composants interactifs) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>