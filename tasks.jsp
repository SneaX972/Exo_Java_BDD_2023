<%@ page import="java.util.*" %>
<%@ include file="task.jspf" %>

<%
    // Récupération des tâches stockées dans la session
    List tasksRaw = (List) session.getAttribute("tasks");
    List<Task> tasks = new ArrayList<>();

    try {
        if (tasksRaw != null) {
            for (Object o : tasksRaw) {
                tasks.add((Task) o);
            }
        }
    } catch (Exception e) {
        session.invalidate();
        response.sendRedirect("tasks.jsp");
        return;
    }

    // Traitement du formulaire
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    if (title != null && !title.isEmpty()) {
        Task t = new Task(title, description, dueDate);
        tasks.add(t);
        session.setAttribute("tasks", tasks);
%>
        <p style="color: green;">✅ Tâche "<strong><%= title %></strong>" ajoutée avec succès !</p>
<%
    }
%>

<h2>Ajouter une tâche</h2>
<form method="post" action="tasks.jsp">
    <label for="title">Titre :</label>
    <input type="text" id="title" name="title" required><br><br>

    <label for="description">Description :</label><br>
    <textarea id="description" name="description" rows="4" cols="50"></textarea><br><br>

    <label for="dueDate">Date d’échéance :</label>
    <input type="date" id="dueDate" name="dueDate"><br><br>

    <input type="submit" value="Ajouter">
</form>

    <a href="afficher.jsp">Voir les tâches</a>
   

<a href="index.html">Retour à l'accueil</a>
</body>
</html>
