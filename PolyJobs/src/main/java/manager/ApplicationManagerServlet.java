package manager;

import java.io.IOException;
import dao.ApplicationDAO;
import dao.ApplicationDAOImpl;
import entity.Application;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/applications")
public class ApplicationManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApplicationManagerServlet() {
        super();     
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || !user.getAdmin()) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        ApplicationDAO dao = new ApplicationDAOImpl();
        
        // Xử lý hành động Duyệt/Từ chối nếu có tham số 'action'
        String action = req.getParameter("action");
        if (action != null) {
            try {
                Long id = Long.parseLong(req.getParameter("id"));
                Application app = dao.findById(id);
                
                if (action.equals("approve")) {
                    app.setStatus(1); // 1: Đã duyệt / Mời phỏng vấn
                } else if (action.equals("reject")) {
                    app.setStatus(3); // 3: Từ chối
                }
                
                dao.update(app);
                req.setAttribute("message", "Đã cập nhật trạng thái hồ sơ!");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Load danh sách hiển thị
        req.setAttribute("apps", dao.findAll());
        req.getRequestDispatcher("/admin/applications.jsp").forward(req, resp);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
