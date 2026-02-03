package entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Applications", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"UserId", "JobId"}) // Tránh ứng tuyển 2 lần 1 job
})

public class Application {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long id;

    // Quan hệ ManyToOne: Nhiều đơn ứng tuyển thuộc về 1 User
    @ManyToOne
    @JoinColumn(name = "UserId")
    private User user;

    // Quan hệ ManyToOne: Nhiều đơn ứng tuyển thuộc về 1 Job
    @ManyToOne
    @JoinColumn(name = "JobId")
    private Job job;

    @Column(name = "AppliedDate")
    @Temporal(TemporalType.DATE)
    private Date appliedDate = new Date();

    @Column(name = "CVFile")
    private String cvFile; // Tên file CV (nếu có)
    
    @Column(name = "Status")
    private Integer status = 0; // Mặc định 0: Pending/Chờ duyệt
}