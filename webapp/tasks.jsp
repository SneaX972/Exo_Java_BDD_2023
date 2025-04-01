<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList, com.votrepackage.Task" %>
<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body>
    <h1>Liste des Tâches</h1>
    <form action="TaskServlet" method="post">
        <input type="text" name="title" placeholder="Titre" required>
        <input type="text" name="description" placeholder="Description" required>
        <input type="date" name="dueDate" required>
        <input type="hidden" name="action" value="add">
        <button type="submit">Ajouter</button>
    </form>

    <ul>
    <%
        ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
        if (tasks != null) {
            for (int i = 0; i < tasks.size(); i++) {
                Task task = tasks.get(i);
    %>
                <li>
                    <strong><%= task.getTitle() %></strong> - <%= task.getDescription() %> - Échéance: <%= task.getDueDate() %>
                    <% if (!task.isCompleted()) { %>
                        <form action="TaskServlet" method="post" style="display:inline;">
                            <input type="hidden" name="index" value="<%= i %>">
                            <input type="hidden" name="action" value="complete">
                            <button type="submit">Terminer</button>
                        </form>
                    <% } %>
                    <form action="TaskServlet" method="post" style="display:inline;">
                        <input type="hidden" name="index" value="<%= i %>">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit">Supprimer</button>
                    </form>
                </li>
    <% } } %>
    </ul>
</body>
</html>
