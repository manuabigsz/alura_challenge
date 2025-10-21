package br.com.alura.projeto.login;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;
import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.course.CourseRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        List<Course> allCourses = courseRepository.findAll();
        
        Map<Long, List<String>> coursesByCategory = new HashMap<>();
        
        for (Course course : allCourses) {
            if (course.getCategory() != null) {
                Long categoryId = course.getCategory().getId();
                
                if (!coursesByCategory.containsKey(categoryId)) {
                    coursesByCategory.put(categoryId, new ArrayList<>());
                }
                
                coursesByCategory.get(categoryId).add(course.getName());
            }
        }
        
        model.addAttribute("categories", categories);
        model.addAttribute("coursesByCategory", coursesByCategory);
        
        return "login";
    }
}