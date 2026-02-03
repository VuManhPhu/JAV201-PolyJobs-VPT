package dao;

import java.util.List;

public interface GenericDAO<T, K> {
    T create(T entity);
    T update(T entity);
    void delete(K id);
    T findById(K id);
    List<T> findAll();
}