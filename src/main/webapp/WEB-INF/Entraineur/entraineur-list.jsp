<%@ page import="com.example.sportflow.model.Entraineur" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Entraîneurs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
            max-width: 900px;
        }
        .table {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .table thead {
            background-color: #2c3e50;
            color: white;
        }
        .btn-ajouter {
            background-color: #18bc9c;
            color: white;
            margin-bottom: 20px;
        }
        .btn-ajouter:hover {
            background-color: #149d83;
            color: white;
        }
        .btn-modifier {
            background-color: #007bff;
            color: white;
            margin-right: 5px;
        }
        .btn-modifier:hover {
            background-color: #0069d9;
            color: white;
        }
        .btn-supprimer {
            background-color: #dc3545;
            color: white;
        }
        .btn-supprimer:hover {
            background-color: #c82333;
            color: white;
        }
        .no-data {
            text-align: center;
            padding: 20px;
            color: #6c757d;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center mb-4">Liste des Entraîneurs</h1>

    <a href="<%= request.getContextPath() %>/entraineur?action=ajouter" class="btn btn-ajouter">Ajouter un entraîneur</a>

    <%
        List<Entraineur> entraineurs = (List<Entraineur>) request.getAttribute("entraineurs");
        if (entraineurs == null) {
            entraineurs = new ArrayList<>();
        }

        if (entraineurs.isEmpty()) {
    %>
    <div class="no-data">
        Aucun entraîneur n'a été ajouté pour le moment.
    </div>
    <% } else { %>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Spécialité</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Entraineur entraineur : entraineurs) { %>
        <tr>
            <td><%= entraineur.getId() %></td>
            <td><%= entraineur.getNom() %></td>
            <td><%= entraineur.getSpecialite() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/entraineur?action=modifier&id=<%= entraineur.getId() %>"
                   class="btn btn-sm btn-modifier">Modifier</a>
                <a href="<%= request.getContextPath() %>/entraineur?action=supprimer&id=<%= entraineur.getId() %>"
                   class="btn btn-sm btn-supprimer"
                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet entraîneur?')">Supprimer</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>