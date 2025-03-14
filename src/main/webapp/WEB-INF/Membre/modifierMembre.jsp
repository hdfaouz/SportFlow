<%@ page import="com.example.sportflow.model.Membre" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Membre membre = (Membre) request.getAttribute("membreById");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Membre</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(135deg, #e9ecef, #ced4da); /* Dégradé gris clair moderne */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
        }
        .container {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
            max-width: 450px;
            width: 100%;
        }
        h2 {
            color: #1a73e8; /* Bleu vif */
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 600;
        }
        .form-label {
            color: #212529; /* Gris très foncé */
            font-weight: 500;
        }
        .form-control {
            border-radius: 8px;
            border-color: #adb5bd; /* Gris clair */
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-color: #1a73e8; /* Bleu vif au focus */
            box-shadow: 0 0 0 0.2rem rgba(26, 115, 232, 0.25);
        }
        .btn-custom {
            background-color: #1a73e8; /* Bleu vif */
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #1557b0; /* Bleu plus foncé au survol */
        }
        .error-message {
            color: #dc3545; /* Rouge Bootstrap */
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 500;
            background: rgba(220, 53, 69, 0.1); /* Fond rouge clair */
            padding: 10px;
            border-radius: 8px;
        }
        .link-custom {
            color: #1a73e8; /* Bleu vif */
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 1.5rem;
            font-weight: 500;
        }
        .link-custom:hover {
            text-decoration: underline;
            color: #1557b0; /* Bleu plus foncé au survol */
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Modifier un Membre</h2>

    <% if (membre != null) { %>
    <form action="membres?action=modifier" method="post">
        <input type="hidden" name="id" value="<%= membre.getId() %>">

        <div class="mb-4">
            <label for="nom" class="form-label">Nom :</label>
            <input type="text" class="form-control" id="nom" name="nom" value="<%= membre.getNom() %>" required>
        </div>

        <div class="mb-4">
            <label for="naissance" class="form-label">Date de naissance :</label>
            <input type="date" class="form-control" id="naissance" name="naissance" value="<%= membre.getNaissance() %>" required>
        </div>

        <div class="mb-4">
            <label for="sportpratique" class="form-label">Sport Pratiqué :</label>
            <input type="text" class="form-control" id="sportpratique" name="sportpratique" value="<%= membre.getSportPratique() %>" required>
        </div>

        <div class="d-grid">
            <input type="submit" class="btn btn-custom text-white" value="Modifier">
        </div>
    </form>
    <% } else { %>
    <p class="error-message">⚠ Erreur : Aucun membre trouvé avec cet ID.</p>
    <a href="membres?action=afficher" class="link-custom">Retour à la liste des membres</a>
    <% } %>
</div>

<!-- Bootstrap JS (optionnel, pour composants interactifs) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>