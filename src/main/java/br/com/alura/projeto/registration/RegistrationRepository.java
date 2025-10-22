package br.com.alura.projeto.registration;

import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RegistrationRepository extends JpaRepository<Registration, Long> {

    boolean existsByUserAndCourse(User user, Course course);

    @Query(value = """
        SELECT 
            c.name AS courseName,
            c.code AS courseCode,
            c.instructor AS instructorName,
            c.instructor AS instructorEmail,
            COUNT(r.id) AS totalRegistrations
        FROM Registration r
        INNER JOIN Course c ON r.course_id = c.id
        GROUP BY c.id, c.name, c.code, c.instructor
        ORDER BY totalRegistrations DESC, c.name ASC
    """, nativeQuery = true)
    List<RegistrationReportProjection> findRegistrationReport();
}