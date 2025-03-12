<%--
  Created by IntelliJ IDEA.
  User: Faouz
  Date: 12/03/2025
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modifier un Entraineur</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h1>Modifier un Entraineur</h1>

    <form action="entraineur" method="post">
        <input type="hidden" name="action" value="modifier">

        <div class="form-group">
            <label for="id">ID:</label>
            <input type="number" class="form-control" id="id" name="id" value="${entraineur.id}" readonly>
        </div>

        <div class="form-group">
            <label for="nom">Nom:</label>
            <input type="text" class="form-control" id="nom" name="nom" value="${entraineur.nom}" required>
        </div>

        <div class="form-group">
            <label for="specialite">Spécialité:</label>
            <input type="text" class="form-control" id="specialite" name="specialite" value="${entraineur.specialite}" required>
        </div>

        <button type="submit" class="btn btn-success">Mettre à jour</button>
        <a href="entraineur" class="btn btn-secondary">Annuler</a>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>