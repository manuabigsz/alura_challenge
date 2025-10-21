package br.com.alura.projeto.login;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;
import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.course.CourseRepository;
import br.com.alura.projeto.course.Status;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class LoginController {

    private final CategoryRepository categoryRepository;
    private final CourseRepository courseRepository;

    public LoginController(CategoryRepository categoryRepository, CourseRepository courseRepository) {
        this.categoryRepository = categoryRepository;
        this.courseRepository = courseRepository;
    }

    @GetMapping("/")
    public String home(Model model) {
        List<Category> categories = categoryRepository.findAll();
        
        List<Course> activeCourses = courseRepository.findByStatus(Status.ACTIVE);

        Map<Long, List<String>> coursesByCategory = activeCourses.stream()
                .filter(course -> course.getCategory() != null)
                .collect(Collectors.groupingBy(
                        course -> course.getCategory().getId(),
                        Collectors.mapping(Course::getName, Collectors.toList())
                ));

        model.addAttribute("categories", categories);
        model.addAttribute("coursesByCategory", coursesByCategory);

        return "login";
    }
}