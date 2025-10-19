package br.com.alura.projeto.course;

public record CourseDTO(Long id, String name, String code, String instructorEmail, String description, String status) {
    public CourseDTO(Course course) {
        this(
            course.getId(),
            course.getName(),
            course.getCode(),
            course.getInstructor(),
            course.getDescription(),
            course.getStatus().name()
        );
    }
}
