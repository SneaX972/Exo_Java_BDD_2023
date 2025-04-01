import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");

        if (tasks == null) {
            tasks = new ArrayList<>();
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dueDate = request.getParameter("dueDate");
            tasks.add(new Task(title, description, dueDate));
        } else if ("delete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            tasks.remove(index);
        } else if ("complete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            tasks.get(index).setCompleted(true);
        }

        session.setAttribute("tasks", tasks);
        response.sendRedirect("tasks.jsp");
    }
}
