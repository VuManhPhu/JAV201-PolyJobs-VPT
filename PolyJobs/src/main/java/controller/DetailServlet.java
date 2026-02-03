package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.AbstractDAO;
import dao.GenericDAO;
import entity.Job;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetailServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. Lấy ID từ tham số trên URL (Ví dụ: /detail?id=JOB01)
		String id = req.getParameter("id");

		if (id != null) {
			// 2. Gọi DAO để tìm công việc theo ID
			GenericDAO<Job, String> dao = new AbstractDAO<Job, String>(Job.class) {
			};
			Job job = dao.findById(id);

			// 3. Đẩy dữ liệu công việc sang trang JSP
			req.setAttribute("job", job);
		}

		// 4. Mở trang chi tiết
		req.getRequestDispatcher("/views/detail.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}