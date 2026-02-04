package manager;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import dao.JobDAO;
import dao.JobDAOImpl;
import entity.Job;
import entity.User;

@WebServlet({ "/admin/jobs", "/admin/job/create", "/admin/job/update", "/admin/job/delete", "/admin/job/edit", "/admin/job/reset" })
public class JobManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JobManagerServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// không phận sự miễn vào
		User user = (User) req.getSession().getAttribute("user");
		if (user == null || !user.getAdmin()) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		JobDAO dao = new JobDAOImpl();

		String uri = req.getRequestURI();
		String message = "";
		Job job = new Job();
		try {
			if (uri.contains("edit")) {
				String id = req.getParameter("id");
				job = dao.findById(id);
			} else if (uri.contains("create")) {
				BeanUtils.populate(job, req.getParameterMap());
				dao.create(job);
				message = "Thêm mới thành công!";
				job = new Job();
			} else if (uri.contains("update")) {
				BeanUtils.populate(job, req.getParameterMap());
				dao.update(job);
				message = "Cập nhật thành công!";
			} else if (uri.contains("delete")) {
				String id = req.getParameter("id");
				dao.delete(id);
				message = "Xóa thành công!";
				job = new Job();
			} else if (uri.contains("reset")) {
				job = new Job();
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "Lỗi: " + e.getMessage();
		}
		
		req.setAttribute("job", job);
		req.setAttribute("jobs", dao.findAll());
		req.setAttribute("message", message);

		req.getRequestDispatcher("/admin/jobs.jsp").forward(req, resp);
	}
}