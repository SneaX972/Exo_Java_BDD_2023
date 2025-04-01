<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%! 
    public class Task {
        private String title;
        private String description;
        private String dueDate;
        private boolean isCompleted;

        public Task(String title, String description, String dueDate) {
            this.title = title;
            this.description = description;
            this.dueDate = dueDate;
            this.isCompleted = false;
        }

        public String getTitle() { return title; }
        public String getDescription() { return description; }
        public String getDueDate() { return dueDate; }
        public boolean isCompleted() { return isCompleted; }
        public void setCompleted(boolean completed) { this.isCompleted = completed; }
    }
%>
