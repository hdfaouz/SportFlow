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
    <title>Liste des Membres</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
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
        .btn-add {
            background-color: #18bc9c;
            color: white;
            margin-bottom: 20px;
        }
        .btn-add:hover {
            background-color: #149d83;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Liste des Membres</h2>

    <a href="ajouterMembre.jsp" class="btn btn-add">Ajouter un Nouveau Membre</a>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Sport Pratiqué</th>
            <th>Date de Naissance</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="membre" items="${membres}">
            <tr>
                <td>${membre.id}</td>
                <td>${membre.nom}</td>
                <td>${membre.sportPratique}</td>
                <td>${membre.dateNaissance}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty membres}">
            <tr>
                <td colspan="4" class="text-center">Aucun membre à afficher</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
