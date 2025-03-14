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
            background: url('https://images.Sportflow.avif/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.9); /* Légèrement plus opaque pour la lisibilité */
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
        }
        .header {
            background: rgba(220, 53, 69, 0.9); /* Rouge semi-transparent */
            padding: 1rem;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }
        .btn-sports {
            background-color: #28a745;
            border: none;
            margin: 0 5px;
        }
        .btn-sports:hover {
            background-color: #218838;
        }
        .form-control:focus {
            border-color: #dc3545;
            box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
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
    <h2 class="text-center mb-4 text-danger">Connexion</h2>
    <form>
        <div class="mb-3">
            <label for="username" class="form-label fw-bold">Nom d'utilisateur</label>
            <input type="text" class="form-control" id="username" placeholder="Entrez votre nom d'utilisateur">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label fw-bold">Mot de passe</label>
            <input type="password" class="form-control" id="password" placeholder="Entrez votre mot de passe">
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-danger btn-lg">Se connecter</button>
        </div>
    </form>
    <p class="text-center mt-3">
        <a href="#" class="text-danger text-decoration-none">Mot de passe oublie?</a>
    </p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>