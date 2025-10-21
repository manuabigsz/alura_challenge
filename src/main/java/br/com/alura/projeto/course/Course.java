package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.time.LocalDateTime;

@Entity
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(unique = true)
    private String code;

    @NotBlank
    private String name;

    @NotBlank
    private String description;

    @NotBlank
    private String instructor;

    @ManyToOne(optional = false)
    @JoinColumn(name = "categoryId") 
    private Category category;


    @Enumerated(EnumType.STRING)
    private Status status = Status.ACTIVE;
    
    private LocalDateTime inactivationDate;

    private LocalDateTime createdAt = LocalDateTime.now();

    @Deprecated
    public Course() {}

    public Course(String name, String code, String description, String instructorEmail, Category category) {
        this.name = name;
        this.code = code;
        this.description = description;
        this.instructor = instructorEmail;
        this.category = category;
        this.status = Status.ACTIVE;
    }

    public void inactivate() {
        this.status = Status.INACTIVE;
        this.inactivationDate = LocalDateTime.now();
    }
    
    public void activate() {
        this.status = Status.ACTIVE;
        this.inactivationDate = null;
    }

    public Long getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }


    public Category getCategory() {
        return category;
    }

    public Status getStatus() {
        return status;
    }

    public LocalDateTime getInactivationDate() {
        return inactivationDate;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
}
