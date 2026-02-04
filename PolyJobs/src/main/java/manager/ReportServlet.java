package manager;

import java.io.IOException;
import java.util.List;
import dao.JobDAO;
import dao.JobDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/report")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReportServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JobDAO dao = new JobDAOImpl();
        List<Object[]> list = dao.getJobStatistics();
        
        req.setAttribute("items", list);
        req.getRequestDispatcher("/admin/report.jsp").forward(req, resp);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}