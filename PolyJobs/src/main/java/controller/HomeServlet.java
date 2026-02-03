package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import dao.GenericDAO;
import dao.AbstractDAO;
import entity.Job;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeServlet() {
        super();     
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. Dùng trực tiếp DAO (hoặc AbstractDAO nếu chưa làm JobDAO)
        // Ở đây tớ ví dụ dùng luôn AbstractDAO để lấy toàn bộ Job
        GenericDAO<Job, String> jobDao = new AbstractDAO<Job, String>(Job.class) {};
        
        List<Job> list = jobDao.findAll();
        
        // 2. Đẩy danh sách jobs vào request để JSP lấy ra dùng
        req.setAttribute("jobs", list);
        
        // 3. Mở trang index.jsp
        req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}