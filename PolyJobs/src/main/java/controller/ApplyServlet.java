package controller;

import dao.ApplicationDAO;
import dao.ApplicationDAOImpl;
import dao.JobDAO;
import dao.JobDAOImpl;
import entity.Application;
import entity.Job;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApplyServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");

		// bắt buộc login trước
		if (user == null) {
			resp.sendRedirect("login");
			return;
		}

		String jobId = req.getParameter("jobId");
		JobDAO jobDao = new JobDAOImpl();
		ApplicationDAO appDao = new ApplicationDAOImpl();

		try {
			// kiểm tra xem đã ứng tuyển chưa?
			if(appDao.isApplied(user.getId(), jobId)) {
				req.setAttribute("error", "Bạn đã ứng tuyển công việc này rồi!");
			} else {
				Job job = jobDao.findById(jobId);
				if (job != null) {
					Application app = new Application();
					app.setUser(user);
					app.setJob(job);
					app.setAppliedDate(new Date());
					app.setStatus(0); // chờ duyệt
					appDao.create(app);
					req.setAttribute("message", "Ứng tuyển thành công!");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
		}

		req.getRequestDispatcher("/home").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}