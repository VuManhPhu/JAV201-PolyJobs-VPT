package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import entity.Application;
import entity.User;
import utils.XJPA;
import jakarta.persistence.*;

/**
 * Servlet implementation class HistoryServlet
 */
@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HistoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. Kiểm tra đăng nhập
		User user = (User) req.getSession().getAttribute("user");

		if (user == null) {
			resp.sendRedirect("login");
			return;
		}

		// 2. Query tìm danh sách đơn ứng tuyển của User này
		// (Làm trực tiếp tại đây cho nhanh, đúng tiêu chí "mì ăn liền" của cậu)
		EntityManager em = XJPA.getEntityManager();
		try {
			// JPQL: Chọn o từ bảng Application o, điều kiện là user.id trùng với user đang
			// login
			String jpql = "SELECT o FROM Application o WHERE o.user.id = :uid ORDER BY o.appliedDate DESC";
			TypedQuery<Application> query = em.createQuery(jpql, Application.class);
			query.setParameter("uid", user.getId());

			List<Application> list = query.getResultList();

			// 3. Đẩy list ra JSP
			req.setAttribute("apps", list);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Lỗi lấy dữ liệu!");
		} finally {
			em.close();
		}

		// 4. Mở trang giao diện
		req.getRequestDispatcher("/views/history.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
