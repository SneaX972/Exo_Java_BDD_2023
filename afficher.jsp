<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="task.jspf" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="text-center">📋 Mes Tâches</h1>

    <%
        Object obj = session.getAttribute("taches");

        if (obj == null || !(obj instanceof List)) {
    %>
        <div class="alert alert-warning text-center">Aucune tâche enregistrée.</div>
    <%
        } else {
            List taches = (List) obj;
    %>
        <p class="text-center">Total de tâches : <strong><%= taches.size() %></strong></p>

        <div class="row">
        <%
            for (int i = 0; i < taches.size(); i++) {
                Object element = taches.get(i);
                if (element instanceof Task) {
                    Task t = (Task) element;
        %>
            <div class="col-md-6">
                <div class="card shadow-sm mb-3">
                    <div class="card-body">
                        <h5 class="card-title"><%= t.getTitle() %></h5>
                        <p class="card-text"><strong>Description :</strong> <%= t.getDescription() %></p>
                        <p class="card-text"><strong>Échéance :</strong> <%= t.getDueDate() %></p>
                        <p class="card-text">
                            <strong>Statut :</strong> 
                            <span class="<%= t.isDone() ? "text-success" : "text-warning" %>">
                                <%= t.isDone() ? "✔ Terminée" : "⏳ En cours" %>
                            </span>
                        </p>

                        <div class="d-flex justify-content-between">
                            <a href="terminer.jsp?index=<%= i %>" class="btn btn-success btn-sm">✅ Marquer comme terminée</a>
                            <a href="#" class="btn btn-danger btn-sm" onclick="confirmDelete(<%= i %>)">🗑 Supprimer</a>
                        </div>
                    </div>
                </div>
            </div>
        <%
                } else {
                    out.println("<p>⚠ Élément inconnu : " + element + "</p>");
                }
            }
        %>
        </div>
    <%
        }
    %>

    <div class="text-center mt-4">
        <a href="tasks.jsp" class="btn btn-primary">➕ Ajouter une tâche</a>
    </div>
</div>

<!-- JavaScript pour la confirmation avant suppression -->
<script>
    function confirmDelete(index) {
        if (confirm("Voulez-vous vraiment supprimer cette tâche ?")) {
            window.location.href = "supprimer.jsp?index=" + index;
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
