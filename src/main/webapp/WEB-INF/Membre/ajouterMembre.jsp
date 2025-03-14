<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Membre</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1575052814080-f849ea9e5b68?q=80&w=2070&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
        }
        .container {
            background: rgba(255, 255, 255, 0.95); /* Fond blanc semi-transparent */
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.2);
            max-width: 450px;
            width: 100%;
        }
        h2 {
            color: #1a73e8; /* Bleu vif */
            text-align: center;
            margin-bottom: 1.5rem;
            font-weight: 600;
        }
        .form-label {
            color: #212529; /* Gris très foncé */
            font-weight: 500;
        }
        .form-control, .form-select {
            border-radius: 8px;
            border-color: #adb5bd;
            background: rgba(255, 255, 255, 0.8); /* Légère transparence */
        }
        .form-control:focus, .form-select:focus {
            border-color: #1a73e8; /* Bleu vif au focus */
            box-shadow: 0 0 0 0.2rem rgba(26, 115, 232, 0.25);
        }
        .btn-custom {
            background-color: #28a745; /* Vert sportif */
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #218838; /* Vert plus foncé au survol */
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
    <h2>Ajouter un Membre</h2>
    <form action="membres?action=ajouter" method="post">
        <div class="mb-3">
            <label for="nom" class="form-label">Nom :</label>
            <input type="text" class="form-control" id="nom" name="nom" required>
        </div>

        <div class="mb-3">
            <label for="naissance" class="form-label">Date de naissance :</label>
            <input type="date" class="form-control" id="naissance" name="naissance" required>
        </div>

        <div class="mb-3">
            <label for="sportpratique" class="form-label">Sport Pratiqué :</label>
            <select class="form-select" id="sportpratique" name="sportpratique" required>
                <option value="" disabled selected>Choisissez un sport</option>
                <option value="Football">Football</option>
                <option value="Basketball">Basketball</option>
                <option value="Natation">Natation</option>
                <option value="Tennis">Tennis</option>
                <option value="Musculation">Musculation</option>
                <option value="Athlétisme">Athlétisme</option>
                <option value="Boxe">Boxe</option>
                <option value="Yoga">Yoga</option>
            </select>
        </div>

        <div class="d-grid">
            <input type="submit" class="btn btn-custom text-white" value="Ajouter">
        </div>
    </form>
    <a href="membres?action=afficher" class="link-custom">Retour à la liste des membres</a>
</div>

<!-- Bootstrap JS (optionnel, uniquement si vous utilisez des composants interactifs) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>