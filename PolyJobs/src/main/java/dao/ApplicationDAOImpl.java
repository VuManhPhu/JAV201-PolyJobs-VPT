package dao;

import entity.Application;
import utils.XJPA;
import jakarta.persistence.*;
import java.util.List;

public class ApplicationDAOImpl extends AbstractDAO<Application, Long> implements ApplicationDAO {

	public ApplicationDAOImpl() {
		super(Application.class);
	}

	@Override
	public List<Application> findByUserId(String userId) {
		EntityManager em = XJPA.getEntityManager();
		try {
			// Sắp xếp theo ngày nộp mới nhất lên đầu
			String jpql = "SELECT o FROM Application o WHERE o.user.id = :uid ORDER BY o.appliedDate DESC";
			TypedQuery<Application> query = em.createQuery(jpql, Application.class);
			query.setParameter("uid", userId);
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public boolean isApplied(String userId, String jobId) {
		EntityManager em = XJPA.getEntityManager();
		try {
			// Đếm số lượng bản ghi khớp User và Job
			String jpql = "SELECT count(o) FROM Application o WHERE o.user.id = :uid AND o.job.id = :jid";
			TypedQuery<Long> query = em.createQuery(jpql, Long.class);
			query.setParameter("uid", userId);
			query.setParameter("jid", jobId);

			// Nếu > 0 nghĩa là đã nộp rồi
			return query.getSingleResult() > 0;
		} finally {
			em.close();
		}
	}
}