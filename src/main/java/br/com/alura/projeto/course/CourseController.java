package br.com.alura.projeto.course;

import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;

import org.springframework.ui.Model;

import java.util.List;

@Controller
public class CourseController {
	private final CourseRepository courseRepository;
	private final CategoryRepository categoryRepository;

	public CourseController(CourseRepository courseRepository, CategoryRepository categoryRepository) {
        this.courseRepository = courseRepository;
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/admin/courses")
    public String list(Model model) {
        List<CourseDTO> list = courseRepository.findAll()
                .stream()
                .map(CourseDTO::new)
                .toList();

        model.addAttribute("courses", list);
        return "admin/course/list";
    }

    @GetMapping("/admin/course/new")
    public String create(NewCourseForm form, Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "admin/course/newForm";
    }
    
    @Transactional
    @PostMapping("/admin/course/new")
    public String save(@Valid NewCourseForm form, Model model) {
        if (courseRepository.existsByCode(form.getCode())) {
            model.addAttribute("error", "Código de curso já existe");
            return create(form, model);
        }

        Category category = categoryRepository.findAll()
                .stream()
                .filter(c -> c.getCode().equals(form.getCategoryCode()))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Categoria inválida"));

        Course course = form.toModel(category);
        courseRepository.save(course);

        return "redirect:/admin/courses";
    }

    @PostMapping("/course/{code}/inactive")
    @Transactional
    public ResponseEntity<?> inactivateCourse(@PathVariable("code") String courseCode) {
        Course course = courseRepository.findByCode(courseCode)
                .orElseThrow(() -> new IllegalArgumentException("Curso não encontrado"));
        course.inactivate();
        courseRepository.save(course);
        return ResponseEntity.ok("Curso inativado com sucesso");
    }

    @PostMapping("/course/{code}/active")
    @Transactional
    public ResponseEntity<?> activateCourse(@PathVariable("code") String courseCode) {
        Course course = courseRepository.findByCode(courseCode)
                .orElseThrow(() -> new IllegalArgumentException("Curso não encontrado"));
        course.activate();
        courseRepository.save(course);
        return ResponseEntity.ok("Curso ativado com sucesso");
    }
}
