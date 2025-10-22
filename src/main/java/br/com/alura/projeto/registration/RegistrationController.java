package br.com.alura.projeto.registration;

import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.course.CourseRepository;
import br.com.alura.projeto.course.Status;
import br.com.alura.projeto.user.Role;
import br.com.alura.projeto.user.User;
import br.com.alura.projeto.user.UserRepository;
import br.com.alura.projeto.util.ErrorItemDTO;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
public class RegistrationController {

    private final RegistrationRepository registrationRepository;
    private final UserRepository userRepository;
    private final CourseRepository courseRepository;

    public RegistrationController(RegistrationRepository registrationRepository,
                                  UserRepository userRepository,
                                  CourseRepository courseRepository) {
        this.registrationRepository = registrationRepository;
        this.userRepository = userRepository;
        this.courseRepository = courseRepository;
    }

    @Transactional
    @PostMapping(value = "/registration/new", consumes = "application/json", produces = "application/json")
    public ResponseEntity createCourse(@Valid @RequestBody NewRegistrationDTO newRegistration) {
        User user = userRepository.findByEmail(newRegistration.getStudentEmail())
                .orElse(null);

        if (user == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ErrorItemDTO("studentEmail", "Usuário não encontrado"));
        }

        if (user.getRole() != Role.STUDENT) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ErrorItemDTO("studentEmail", "Usuário não é um estudante"));
        }

        Course course = courseRepository.findByCode(newRegistration.getCourseCode())
                .orElse(null);

        if (course == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ErrorItemDTO("courseCode", "Curso não encontrado"));
        }

        if (course.getStatus() != Status.ACTIVE) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ErrorItemDTO("courseCode", "Curso não está ativo"));
        }

        if (registrationRepository.existsByUserAndCourse(user, course)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ErrorItemDTO("studentEmail", "Usuário já está matriculado neste curso"));
        }

        Registration registration = new Registration(user, course);
        registrationRepository.save(registration);

        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @GetMapping(value = "/registration/report", produces = "application/json")
    public ResponseEntity<List<RegistrationReportItem>> report() {
        List<RegistrationReportProjection> projections = registrationRepository.findRegistrationReport();
        
        List<RegistrationReportItem> items = projections.stream()
                .map(p -> new RegistrationReportItem(
                    p.getCourseName(),
                    p.getCourseCode(),
                    p.getInstructorName(),
                    p.getInstructorEmail(),
                    p.getTotalRegistrations()
                ))
                .collect(Collectors.toList());

        return ResponseEntity.ok(items);
    }
}