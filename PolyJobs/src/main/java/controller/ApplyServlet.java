package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Date;

import dao.AbstractDAO;
import dao.GenericDAO;
import entity.Application;
import entity.Job;
import entity.User;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApplyServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. Kiểm tra đăng nhập
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		if (user == null) {
			// Chưa đăng nhập thì bắt đi Login
			resp.sendRedirect("login");
			return;
		}

		// 2. Lấy Job ID từ tham số
		String jobId = req.getParameter("jobId");

		try {
			// 3. Khởi tạo các DAO cần thiết
			GenericDAO<Job, String> jobDao = new AbstractDAO<Job, String>(Job.class) {
			};
			GenericDAO<Application, Long> appDao = new AbstractDAO<Application, Long>(Application.class) {
			};

			// 4. Tìm Job tương ứng
			Job job = jobDao.findById(jobId);

			if (job != null) {
				// 5. Tạo đối tượng Application mới
				Application app = new Application();
				app.setUser(user);
				app.setJob(job);
				app.setAppliedDate(new Date());
				app.setStatus(0); // 0: Chờ duyệt (Như logic thực tế mình đã bàn)

				// 6. Lưu vào Database
				appDao.create(app);

				req.setAttribute("message", "Ứng tuyển thành công việc làm: " + job.getTitle());
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại!");
		}

		// 7. Quay về trang chủ để xem tiếp
		req.getRequestDispatcher("/home").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
