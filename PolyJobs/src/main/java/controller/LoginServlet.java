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
		req.getRequestDispatcher("/common/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("username");
		String pass = req.getParameter("password");
		UserDAO dao = new UserDAOImpl();
		User user = dao.checkLogin(id, pass);
		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			if (user.getAdmin()) {
				resp.sendRedirect("admin/jobs");
			} else {
				resp.sendRedirect("home");
			}
		} else {
			req.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu!");
			req.setAttribute("username", id); // Giữ lại tên user để đỡ phải nhập lại
			req.getRequestDispatcher("/common/login.jsp").forward(req, resp);
		}
	}
}