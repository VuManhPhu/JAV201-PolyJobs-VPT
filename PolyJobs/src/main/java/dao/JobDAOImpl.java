package dao;

import entity.Job;
import utils.XJPA;
import jakarta.persistence.*;
import java.util.List;

public class JobDAOImpl extends AbstractDAO<Job, String> implements JobDAO {

	public JobDAOImpl() {
		super(Job.class);
	}

	@Override
	public List<Job> findAllActive() {
		EntityManager em = XJPA.getEntityManager();
		try {
			String jpql = "SELECT o FROM Job o WHERE o.active = true";
			TypedQuery<Job> query = em.createQuery(jpql, Job.class);
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Job> findByTitle(String keyword) {
		EntityManager em = XJPA.getEntityManager();
		try {
			String jpql = "SELECT o FROM Job o WHERE o.title LIKE :kw";
			TypedQuery<Job> query = em.createQuery(jpql, Job.class);
			query.setParameter("kw", "%" + keyword + "%");
			return query.getResultList();
		} finally {
			em.close();
		}
	}
	
	@Override
	public List<Object[]> getJobStatistics() {
	    EntityManager em = XJPA.getEntityManager();
	    try {
	        String jpql = "SELECT r.job.title, COUNT(r), MIN(r.appliedDate), MAX(r.appliedDate) " +
	                      "FROM Application r GROUP BY r.job.title";
	        return em.createQuery(jpql, Object[].class).getResultList();
	    } finally {
	        em.close();
	    }
	}
}