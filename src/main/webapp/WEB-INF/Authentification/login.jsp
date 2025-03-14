<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Sportif</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.95); /* Blanc semi-transparent */
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
        }
        .header {
            background: #212529; /* Noir Bootstrap */
            padding: 1.5rem;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }
        .btn-sports {
            background-color: #495057; /* Gris foncé pour les boutons */
            border: none;
            margin: 0 5px;
            transition: background-color 0.3s ease;
        }
        .btn-sports:hover {
            background-color: #343a40; /* Gris plus foncé au survol */
        }
        .form-control:focus {
            border-color: #212529; /* Noir au focus */
            box-shadow: 0 0 0 0.2rem rgba(33, 37, 41, 0.25);
        }
        .btn-login {
            background-color: #212529; /* Noir pour le bouton */
            border: none;
            transition: background-color 0.3s ease;
        }
        .btn-login:hover {
            background-color: #343a40; /* Gris foncé au survol */
        }
        h2 {
            color: #212529; /* Noir pour le titre */
            font-weight: 600;
        }
        .form-label {
            color: #212529; /* Noir pour les labels */
        }
        a.text-custom {
            color: #495057; /* Gris foncé pour le lien */
            text-decoration: none;
        }
        a.text-custom:hover {
            color: #212529; /* Noir au survol */
            text-decoration: underline;
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="header">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h3 class="text-white mb-0">SportConnect</h3>
            <div>
                <a href="#" class="btn btn-sports text-white">Home</a>
                <a href="#" class="btn btn-sports text-white">Entraineur</a>
                <a href="#" class="btn btn-sports text-white">Membre</a>
            </div>
        </div>
    </div>
</header>

<!-- Login Form -->
<div class="login-container">
    <h2 class="text-center mb-4">Connexion</h2>
    <form>
        <div class="mb-3">
            <label for="username" class="form-label fw-bold">Nom Utilisateur</label>
            <input type="text" class="form-control" id="username" placeholder="Entrez votre nom d'utilisateur">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label fw-bold">Mot de passe</label>
            <input type="password" class="form-control" id="password" placeholder="Entrez votre mot de passe">
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-login btn-lg text-white">Se connecter</button>
        </div>
    </form>
    <p class="text-center mt-3">
        <a href="#" class="text-custom">Mot de passe oublie ?</a>
    </p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>