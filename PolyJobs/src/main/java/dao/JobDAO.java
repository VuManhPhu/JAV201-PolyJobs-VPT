package dao;

import entity.Job;
import java.util.List;

public interface JobDAO extends GenericDAO<Job, String> {
    List<Job> findAllActive(); // Chỉ lấy công việc đang mở
    List<Job> findByTitle(String keyword); // Tìm kiếm
    List<Object[]> getJobStatistics(); // Thống kê
}