package entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Users")
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email")
})

public class User {
    @Id
    @Column(name = "Id")
    private String id;

    @Column(name = "Password")
    private String password;

    @Column(name = "Fullname")
    private String fullname;

    @Column(name = "Email")
    private String email;

    @Column(name = "Admin")
    private Boolean admin = false;
    
    // Quan hệ 1-Nhiều: Một User có nhiều đơn ứng tuyển
    @OneToMany(mappedBy = "user")
    private List<Application> applications;
}