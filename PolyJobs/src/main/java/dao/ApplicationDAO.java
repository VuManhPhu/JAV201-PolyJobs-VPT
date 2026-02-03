package dao;

import entity.Application;
import java.util.List;

public interface ApplicationDAO extends GenericDAO<Application, Long> {
    // Lấy danh sách đơn ứng tuyển của một User
    List<Application> findByUserId(String userId);
    
    // Kiểm tra xem User đã nộp đơn vào Job này chưa (để tránh nộp trùng)
    boolean isApplied(String userId, String jobId);
}