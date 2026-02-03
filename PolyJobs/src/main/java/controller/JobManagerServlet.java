package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import dao.AbstractDAO;
import dao.GenericDAO;
import entity.Job;
import entity.User;

/**
 * Servlet implementation class JobManagerServlet
 */
@WebServlet({ "/admin/jobs", "/admin/job/create", "/admin/job/update", "/admin/job/delete", "/admin/job/edit",
		"/admin/job/reset" })
public class JobManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JobManagerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. CHỐT CHẶN BẢO MẬT (Chỉ Admin mới được vào)
		User user = (User) req.getSession().getAttribute("user");
		if (user == null || !user.getAdmin()) {
			resp.sendRedirect(req.getContextPath() + "/login"); // Đá về trang login
			return;
		}

		// 2. Khởi tạo DAO
		GenericDAO<Job, String> dao = new AbstractDAO<Job, String>(Job.class) {
		};

		// 3. Phân loại hành động dựa trên URL
		String uri = req.getRequestURI();
		String message = "";
		Job job = new Job(); // Job rỗng dùng cho form

		try {
			if (uri.contains("edit")) {
				// Lấy ID từ URL -> Tìm Job -> Đẩy lên Form
				String id = req.getParameter("id");
				job = dao.findById(id);
			} else if (uri.contains("create")) {
				// Đọc dữ liệu từ Form -> Tạo mới
				BeanUtils.populate(job, req.getParameterMap());
				dao.create(job);
				message = "Thêm mới thành công!";
				job = new Job(); // Reset form
			} else if (uri.contains("update")) {
				// Đọc dữ liệu -> Cập nhật
				BeanUtils.populate(job, req.getParameterMap());
				dao.update(job);
				message = "Cập nhật thành công!";
			} else if (uri.contains("delete")) {
				// Lấy ID -> Xóa
				String id = req.getParameter("id");
				dao.delete(id);
				message = "Xóa thành công!";
				job = new Job(); // Reset form
			} else if (uri.contains("reset")) {
				job = new Job();
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "Lỗi: " + e.getMessage();
		}

		// 4. Load lại danh sách và Form
		req.setAttribute("job", job); // Đẩy job vào form
		req.setAttribute("jobs", dao.findAll()); // Đẩy list vào bảng
		req.setAttribute("message", message);

		// 5. Mở trang JSP
		req.getRequestDispatcher("/views/admin-jobs.jsp").forward(req, resp);
	}

}
