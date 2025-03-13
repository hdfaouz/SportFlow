<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Entraîneur</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            max-width: 550px;
        }
        h1 {
            color: #1a1a2e;
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 700;
        }
        .form-group label {
            color: #1a1a2e;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        .form-control {
            border: none;
            border-bottom: 2px solid #e0e0e0;
            border-radius: 0;
            padding: 0.75rem 0.5rem;
            background-color: transparent;
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-bottom-color: #667eea;
            box-shadow: none;
            background-color: transparent;
        }
        .btn-submit {
            background-color: #667eea;
            border: none;
            padding: 0.85rem;
            border-radius: 25px;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
        }
        .btn-submit:hover {
            background-color: #764ba2;
            transform: translateY(-2px);
        }
        .alert {
            border-radius: 8px;
            margin-bottom: 1.5rem;
            padding: 1rem;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Ajouter un Entraîneur</h1>

    <%
        String message = (String) request.getAttribute("message");
        String messageType = (String) request.getAttribute("messageType");
        if (message != null && !message.isEmpty()) {
    %>
    <div class="alert <%= messageType.equals("success") ? "alert-success" : "alert-danger" %>">
        <%= message %>
    </div>
    <% } %>

    <form action="<%= request.getContextPath() %>/entraineur" method="post">
        <input type="hidden" name="action" value="ajouter">

        <div class="form-group">
            <label for="nom">Nom :</label>
            <input type="text" class="form-control" id="nom" name="nom" required>
        </div>

        <div class="form-group">
            <label for="specialite">Spécialité :</label>
            <select class="form-control" id="specialite" name="specialite" required>
                <option value="">Sélectionner une spécialité</option>
                <option value="Football">Football</option>
                <option value="Basketball">Basketball</option>
                <option value="Natation">Natation</option>
                <option value="Tennis">Tennis</option>
                <option value="Athlétisme">Athlétisme</option>
            </select>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-submit">Enregistrer</button>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>