<%@ page import="com.example.sportflow.model.Entraineur" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Entraîneurs</title>
    <!-- Same styles as before -->
</head>
<body>
<div class="container">
    <h1>Liste des Entraîneurs</h1>

    <a href="<%= request.getContextPath() %>/entraineur?action=ajouter" class="btn-ajouter">Ajouter un entraîneur</a>

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
    <table>
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
            <td class="actions">
                <a href="<%= request.getContextPath() %>/entraineur?action=modifier&id=<%= entraineur.getId() %>"
                   class="btn-modifier">Modifier</a>
                <a href="<%= request.getContextPath() %>/entraineur?action=supprimer&id=<%= entraineur.getId() %>"
                   class="btn-supprimer"
                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet entraîneur?')">Supprimer</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } %>
</div>
</body>
</html>