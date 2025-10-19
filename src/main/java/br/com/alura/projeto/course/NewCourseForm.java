package br.com.alura.projeto.course;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.Length;

import br.com.alura.projeto.category.Category;
import jakarta.validation.constraints.Pattern;

public class NewCourseForm {

    @NotBlank
    private String name;

    @NotBlank
    @Pattern(regexp = "^[a-z]+(-[a-z]+)*$", message = "Código deve conter apenas letras minúsculas e hífens")
    @Length(min = 4, max = 50)
    private String code;

    private String description;

    @NotBlank
    @Email
    private String instructorEmail;
    
    @NotBlank
    private String categoryCode;

    public NewCourseForm() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInstructorEmail() {
        return instructorEmail;
    }

    public void setInstructorEmail(String instructorEmail) {
        this.instructorEmail = instructorEmail;
    }
    
    public String getCategoryCode() {
    	return categoryCode; 
    }
    
    public void setCategoryCode(String categoryCode) {
    	this.categoryCode = categoryCode;
    }

    public Course toModel(Category category) {
        return new Course(name, code, description, instructorEmail, category);
    }
}
