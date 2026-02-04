package controller;

import dao.JobDAO;
import dao.JobDAOImpl;
import entity.Job;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeServlet() {
        super();     
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JobDAO dao = new JobDAOImpl();
        List<Job> list;
        String keyword = req.getParameter("keyword");
        if (keyword != null && !keyword.isEmpty()) { // search theo tên
            list = dao.findByTitle(keyword);
            req.setAttribute("keyword", keyword);
        } else {
            list = dao.findAllActive(); // không search thì chỉ hiện active job
        }
        
        req.setAttribute("jobs", list);
        req.getRequestDispatcher("/common/index.jsp").forward(req, resp);
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}