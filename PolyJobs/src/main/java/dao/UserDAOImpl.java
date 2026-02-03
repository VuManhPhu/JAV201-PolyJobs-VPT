package dao;

import entity.User;
import utils.XJPA;
import jakarta.persistence.*;
import java.util.List;

public class UserDAOImpl extends AbstractDAO<User, String> implements UserDAO {

    public UserDAOImpl() {
        super(User.class); // Truyền class User vào cho cha (AbstractDAO) xử lý
    }

    @Override
    public User checkLogin(String username, String password) {
        EntityManager em = XJPA.getEntityManager();
        try {
            // Dùng JPQL để tìm user có id và pass trùng khớp
            String jpql = "SELECT u FROM User u WHERE u.id = :uid AND u.password = :pwd";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("uid", username);
            query.setParameter("pwd", password);
            
            // getSingleResult sẽ ném lỗi nếu ko tìm thấy, nên dùng getResultList cho an toàn
            List<User> list = query.getResultList();
            if (list.isEmpty()) {
                return null; // Sai thông tin
            }
            return list.get(0); // Đăng nhập thành công
        } finally {
            em.close();
        }
    }

    @Override
    public User findByEmail(String email) {
        EntityManager em = XJPA.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("email", email);
            
            List<User> list = query.getResultList();
            return list.isEmpty() ? null : list.get(0);
        } finally {
            em.close();
        }
    }
}