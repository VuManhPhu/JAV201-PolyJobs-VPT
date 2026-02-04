package dao;

import utils.XJPA;
import jakarta.persistence.*;
import java.util.List;

public abstract class AbstractDAO<T, K> implements GenericDAO<T, K> {
    
    // Class của Entity (để JPA biết đang query bảng nào)
    private Class<T> entityClass;

    public AbstractDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    @Override
    public T create(T entity) {
        EntityManager em = XJPA.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(entity);
            trans.commit();
            return entity;
        } catch (Exception e) {
            trans.rollback();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public T update(T entity) {
        EntityManager em = XJPA.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(entity); //update
            trans.commit();
            return entity;
        } catch (Exception e) {
            trans.rollback();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(K id) {
        EntityManager em = XJPA.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            T entity = em.find(entityClass, id);
            if (entity != null) {
                em.remove(entity);
            }
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public T findById(K id) {
        EntityManager em = XJPA.getEntityManager();
        try {
            return em.find(entityClass, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<T> findAll() {
        EntityManager em = XJPA.getEntityManager();
        try {
            // Câu lệnh JPQL động: "SELECT o FROM [TênClass] o"
            String jpql = "SELECT o FROM " + entityClass.getSimpleName() + " o";
            TypedQuery<T> query = em.createQuery(jpql, entityClass);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}