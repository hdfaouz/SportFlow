<%--
  Created by IntelliJ IDEA.
  User: Faouz
  Date: 12/03/2025
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier un Membre</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .btn-submit {
            background-color: #2c3e50;
            color: white;
            padding: 10px 20px;
        }
        .btn-submit:hover {
            background-color: #18bc9c;
            color: white;
        }
        .btn-back {
            background-color: #6c757d;
            color: white;
        }
        .btn-back:hover {
            background-color: #5a6268;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Modifier le Membre</h2>

    <form action="ModifierMembreServlet" method="post">
        <input type="hidden" name="id" value="${membre.id}">

        <div class="form-group">
            <label for="id">ID :</label>
            <input type="number" class="form-control" id="id" value="${membre.id}" disabled>
        </div>

        <div class="form-group">
            <label for="nom">Nom :</label>
            <input type="text" class="form-control" id="nom" name="nom" value="${membre.nom}" required>
        </div>

        <div class="form-group">
            <label for="sportPratique">Sport Pratiqué :</label>
            <select class="form-control" id="sportPratique" name="sportPratique" required>
                <option value="Football" ${membre.sportPratique == 'Football' ? 'selected' : ''}>Football</option>
                <option value="Basketball" ${membre.sportPratique == 'Basketball' ? 'selected' : ''}>Basketball</option>
                <option value="Tennis" ${membre.sportPratique == 'Tennis' ? 'selected' : ''}>Tennis</option>
                <option value="Natation" ${membre.sportPratique == 'Natation' ? 'selected' : ''}>Natation</option>
                <option value="Athlétisme" ${membre.sportPratique == 'Athlétisme' ? 'selected' : ''}>Athlétisme</option>
            </select>
        </div>

        <div class="form-group">
            <label for="dateNaissance">Date de Naissance :</label>
            <input type="date" class="form-control" id="dateNaissance" name="dateNaissance"
                   value="${membre.dateNaissance}" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-submit">Modifier</button>
            <a href="ListeMembresServlet" class="btn btn-back">Retour à la liste</a>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
