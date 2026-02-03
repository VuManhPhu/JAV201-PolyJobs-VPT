package entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Shares")

public class Share {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "UserId")
    private User user;

    @ManyToOne
    @JoinColumn(name = "JobId")
    private Job job;

    @Column(name = "Emails")
    private String emails;

    @Column(name = "ShareDate")
    @Temporal(TemporalType.DATE)
    private Date shareDate = new Date();
}