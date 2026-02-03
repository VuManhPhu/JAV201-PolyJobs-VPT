package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import dao.UserDAO;
import dao.UserDAOImpl;
import entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. Lấy thông tin từ form
		String id = req.getParameter("username");
		String pass = req.getParameter("password");

		// 2. Gọi DAO để kiểm tra
		UserDAO dao = new UserDAOImpl();
		User user = dao.checkLogin(id, pass);

		// 3. Xử lý kết quả
		if (user != null) {
			// Đăng nhập thành công -> Lưu vào Session
			HttpSession session = req.getSession();
			session.setAttribute("user", user);

			// Nếu là Admin thì chuyển sang trang quản trị, User thì về trang chủ
			if (user.getAdmin()) {
				resp.sendRedirect("admin/jobs"); // Cần tạo servlet này sau
			} else {
				resp.sendRedirect("home"); // Cần tạo servlet này sau
			}
		} else {
			// Đăng nhập thất bại -> Báo lỗi và quay lại trang login
			req.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu!");
			req.setAttribute("username", id); // Giữ lại tên user để đỡ phải nhập lại
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
		}
	}
}