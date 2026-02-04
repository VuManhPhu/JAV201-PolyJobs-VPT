package dao;

import entity.User;

// Kế thừa GenericDAO với T=User, K=String (vì ID user là String)
public interface UserDAO extends GenericDAO<User, String> {
    // Hàm riêng: Kiểm tra đăng nhập
    User checkLogin(String username, String password);
    
    // Hàm riêng: Tìm theo Email (cho chức năng Quên mật khẩu)
    User findByEmail(String email);
}