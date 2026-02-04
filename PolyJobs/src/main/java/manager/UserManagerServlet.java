package manager;

import java.io.IOException;
import dao.UserDAO;
import dao.UserDAOImpl;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/admin/users", "/admin/user/edit", "/admin/user/update"})
public class UserManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserManagerServlet() {
        super();      
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO dao = new UserDAOImpl();
        
        String uri = req.getRequestURI();
        if (uri.contains("edit")) {
            String id = req.getParameter("id");
            User user = dao.findById(id);
            req.setAttribute("userEdit", user);
        }
        
        req.setAttribute("users", dao.findAll());
        req.getRequestDispatcher("/admin/users.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO dao = new UserDAOImpl();
        try {
            // Lấy dữ liệu từ form cập nhật quyền
            String id = req.getParameter("id");
            String fullname = req.getParameter("fullname");
            String email = req.getParameter("email");
            boolean admin = req.getParameter("admin") != null; // Checkbox checked = true

            User user = dao.findById(id);
            user.setFullname(fullname);
            user.setEmail(email);
            user.setAdmin(admin);
            
            dao.update(user);
            req.setAttribute("message", "Cập nhật thành công!");
        } catch (Exception e) {
            req.setAttribute("message", "Lỗi: " + e.getMessage());
        }
        resp.sendRedirect("users");
    }
}