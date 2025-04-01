<%@ page import="java.util.*" %>
<%@ include file="task.jsp" %>

<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    // Traitement des actions (supprimer ou marquer comme terminée)
    String action = request.getParameter("action");
    String indexStr = request.getParameter("index");

    if (action != null && indexStr != null) {
        try {
            int index = Integer.parseInt(indexStr);
            if (index >= 0 && index < tasks.size()) {
                if ("delete".equals(action)) {
                    tasks.remove(index);
                } else if ("done".equals(action)) {
                    tasks.get(index).setCompleted(true); // ✅ Correction ici
                }
            }
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Index invalide</p>");
        }
    }
%>

<h2>Liste des tâches</h2>

<%
    if (tasks.isEmpty()) {
%>
    <p>Aucune tâche enregistrée.</p>
<%
    } else {
        for (int i = 0; i < tasks.size(); i++) {
            Task t = tasks.get(i);
%>
    <div style="border:1px solid #ccc; margin:10px; padding:10px; border-radius:8px;">
        <strong><%= t.getTitle() %></strong> - 
        <%= t.isCompleted() ? "✔️ Terminée" : "⏳ En cours" %><br> <!-- ✅ Correction ici -->
        <em>Description :</em> <%= t.getDescription() %><br>
        <em>Échéance :</em> <%= t.getDueDate() %><br><br>

        <!-- Formulaire pour marquer comme terminée -->
        <form action="liste.jsp" method="post" style="display:inline;">
            <input type="hidden" name="action" value="done">
            <input type="hidden" name="index" value="<%= i %>">
            <button type="submit">✅ Marquer comme terminée</button>
        </form>

        <!-- Formulaire pour supprimer -->
        <form action="liste.jsp" method="post" style="display:inline;">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="index" value="<%= i %>">
            <button type="submit">🗑️ Supprimer</button>
        </form>
    </div>
<%
        }
    }
%>

<p><a href="tasks.jsp">➕ Ajouter une nouvelle tâche</a></p>
