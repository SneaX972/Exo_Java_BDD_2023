<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="task.jspf" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter ou Supprimer une tâche</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="text-center">📌 Gestion des Tâches</h1>

    <div class="row">
        <!-- Formulaire d'ajout -->
        <div class="col-md-6">
            <div class="card shadow-sm p-4">
                <h3 class="text-center">➕ Ajouter une tâche</h3>
                <form action="ajout.jsp" method="post">
                    <div class="mb-3">
                        <label for="title" class="form-label">Titre :</label>
                        <input type="text" name="title" id="title" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description :</label>
                        <textarea name="description" id="description" rows="4" class="form-control" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="dueDate" class="form-label">Date d’échéance :</label>
                        <input type="date" name="dueDate" id="dueDate" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-success w-100">✅ Ajouter la tâche</button>
                </form>
            </div>
        </div>

        <!-- Formulaire de suppression -->
        <div class="col-md-6">
            <div class="card shadow-sm p-4">
                <h3 class="text-center">🗑 Supprimer une tâche</h3>
                <form action="supprimer.jsp" method="post">
                    <div class="mb-3">
                        <label for="index" class="form-label">Numéro de la tâche à supprimer :</label>
                        <input type="number" name="index" id="index" class="form-control" min="0" required>
                    </div>
                    <button type="submit" class="btn btn-danger w-100">🗑 Supprimer</button>
                </form>
            </div>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="afficher.jsp" class="btn btn-primary">📋 Voir les tâches</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
