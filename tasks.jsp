<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // Récupération ou création de la liste des tâches en session
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    // Gestion des actions (ajout, suppression, terminer)
    String action = request.getParameter("action");

    if ("add".equals(action)) {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dueDate = request.getParameter("dueDate");
        if (title != null && description != null && dueDate != null) {
            tasks.add(new Task(title, description, dueDate));
        }
    } else if ("delete".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < tasks.size()) {
            tasks.remove(index);
        }
    } else if ("complete".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < tasks.size()) {
            tasks.get(index).setCompleted(true);
        }
    }

    session.setAttribute("tasks", tasks); // Mettre à jour la session
%>

<html>
<head>
    <title>Gestionnaire de Tâches</title>
</head>
<body>
    <h1>Liste des Tâches</h1>

    <!-- Formulaire pour ajouter une tâche -->
    <form action="tasks.jsp" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="title" placeholder="Titre" required>
        <input type="text" name="description" placeholder="Description" required>
        <input type="date" name="dueDate" required>
        <button type="submit">Ajouter</button>
    </form>

    <ul>
        <%
            for (int i = 0; i < tasks.size(); i++) {
                Task task = tasks.get(i);
        %>
                <li>
                    <strong><%= task.getTitle() %></strong> - <%= task.getDescription() %> - Échéance: <%= task.getDueDate() %>
                    <% if (!task.isCompleted()) { %>
                        <form action="tasks.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="index" value="<%= i %>">
                            <input type="hidden" name="action" value="complete">
                            <button type="submit">Terminer</button>
                        </form>
                    <% } %>
                    <form action="tasks.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="index" value="<%= i %>">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit">Supprimer</button>
                    </form>
                </li>
        <% } %>
    </ul>
    <a href="afficher.jsp">Voir les tâches</a>
    <a href="index.html">Retour à l'accueil</a>
</body>
</html>
