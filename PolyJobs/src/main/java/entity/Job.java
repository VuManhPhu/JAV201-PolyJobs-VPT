package entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Jobs")
@NamedQueries({
    @NamedQuery(name = "Job.findAll", query = "SELECT j FROM Job j"),
    @NamedQuery(name = "Job.findByTitle", query = "SELECT j FROM Job j WHERE j.title LIKE :keyword")
})

public class Job {
    @Id
    @Column(name = "Id")
    private String id;

    @Column(name = "Title")
    private String title;

    @Column(name = "Salary")
    private Double salary;

    @Column(name = "Poster")
    private String poster;

    @Column(name = "Description")
    private String description;

    @Column(name = "Active")
    private Boolean active = true;

    // Quan hệ: Một Job có nhiều lượt Ứng tuyển
    @OneToMany(mappedBy = "job")
    private List<Application> applications;

    // Quan hệ: Một Job có nhiều lượt Chia sẻ
    @OneToMany(mappedBy = "job")
    private List<Share> shares;
}