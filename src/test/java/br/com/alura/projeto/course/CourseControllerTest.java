package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(CourseController.class)
class CourseControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CourseRepository courseRepository;

    @MockBean
    private CategoryRepository categoryRepository;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void newCourse__should_return_bad_request_when_code_is_blank() throws Exception {
        NewCourseForm form = new NewCourseForm();
        form.setName("Java Básico");
        form.setCode("");
        form.setInstructorEmail("instrutor@alura.com.br");
        form.setCategoryCode("programacao");

        mockMvc.perform(post("/admin/course/new")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("name", form.getName())
                        .param("code", form.getCode())
                        .param("instructorEmail", form.getInstructorEmail())
                        .param("categoryCode", form.getCategoryCode()))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/course/newForm"))
                .andExpect(model().attributeHasFieldErrors("newCourseForm", "code"));
    }

    @Test
    void newCourse__should_return_bad_request_when_code_has_uppercase() throws Exception {
        NewCourseForm form = new NewCourseForm();
        form.setName("Java Básico");
        form.setCode("Java-Basico");
        form.setInstructorEmail("instrutor@alura.com.br");
        form.setCategoryCode("programacao");

        mockMvc.perform(post("/admin/course/new")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("name", form.getName())
                        .param("code", form.getCode())
                        .param("instructorEmail", form.getInstructorEmail())
                        .param("categoryCode", form.getCategoryCode()))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/course/newForm"))
                .andExpect(model().attributeHasFieldErrors("newCourseForm", "code"));
    }

    @Test
    void newCourse__should_return_bad_request_when_code_is_too_short() throws Exception {
        NewCourseForm form = new NewCourseForm();
        form.setName("Java Básico");
        form.setCode("jav");
        form.setInstructorEmail("instrutor@alura.com.br");
        form.setCategoryCode("programacao");

        mockMvc.perform(post("/admin/course/new")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("name", form.getName())
                        .param("code", form.getCode())
                        .param("instructorEmail", form.getInstructorEmail())
                        .param("categoryCode", form.getCategoryCode()))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/course/newForm"))
                .andExpect(model().attributeHasFieldErrors("newCourseForm", "code"));
    }

    @Test
    void newCourse__should_return_bad_request_when_email_is_invalid() throws Exception {
        NewCourseForm form = new NewCourseForm();
        form.setName("Java Básico");
        form.setCode("java-basico");
        form.setInstructorEmail("instrutor");
        form.setCategoryCode("programacao");

        mockMvc.perform(post("/admin/course/new")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("name", form.getName())
                        .param("code", form.getCode())
                        .param("instructorEmail", form.getInstructorEmail())
                        .param("categoryCode", form.getCategoryCode()))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/course/newForm"))
                .andExpect(model().attributeHasFieldErrors("newCourseForm", "instructorEmail"));
    }

    @Test
    void newCourse__should_return_error_when_code_already_exists() throws Exception {
        NewCourseForm form = new NewCourseForm();
        form.setName("Java Básico");
        form.setCode("java-basico");
        form.setInstructorEmail("instrutor@alura.com.br");
        form.setCategoryCode("programacao");

        when(courseRepository.existsByCode("java-basico")).thenReturn(true);

        mockMvc.perform(post("/admin/course/new")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("name", form.getName())
                        .param("code", form.getCode())
                        .param("instructorEmail", form.getInstructorEmail())
                        .param("categoryCode", form.getCategoryCode()))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/course/newForm"))
                .andExpect(model().attributeExists("error"))
                .andExpect(model().attribute("error", "Código de curso já existe"));
    }

    @Test
    void newCourse__should_save_successfully_when_data_is_valid() throws Exception {
        NewCourseForm form = new NewCourseForm();
        form.setName("Java Básico");
        form.setCode("java-basico");
        form.setDescription("Curso de Java para iniciantes");
        form.setInstructorEmail("instrutor@alura.com.br");
        form.setCategoryCode("programacao");

        Category category = new Category("Programação", "programacao", "#FF5733", 1);

        when(courseRepository.existsByCode("java-basico")).thenReturn(false);
        when(categoryRepository.findAll()).thenReturn(Arrays.asList(category));

        mockMvc.perform(post("/admin/course/new")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("name", form.getName())
                        .param("code", form.getCode())
                        .param("description", form.getDescription())
                        .param("instructorEmail", form.getInstructorEmail())
                        .param("categoryCode", form.getCategoryCode()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/courses"));
    }

    @Test
    void listCourses__should_return_all_courses() throws Exception {
        Category category = new Category("Programação", "programacao", "#FF5733", 1);
        Course course1 = new Course("Java Básico", "java-basico", "Descrição 1", "inst1@alura.com.br", category);
        Course course2 = new Course("Python Básico", "python-basico", "Descrição 2", "inst2@alura.com.br", category);

        when(courseRepository.findAll()).thenReturn(Arrays.asList(course1, course2));

        mockMvc.perform(get("/admin/courses"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/course/list"))
                .andExpect(model().attributeExists("courses"));
    }

    @Test
    void inactivateCourse__should_inactivate_successfully() throws Exception {
        Category category = new Category("Programação", "programacao", "#FF5733", 1);
        Course course = new Course("Java Básico", "java-basico", "Descrição", "inst@alura.com.br", category);

        when(courseRepository.findByCode("java-basico")).thenReturn(Optional.of(course));

        mockMvc.perform(post("/course/java-basico/inactive"))
                .andExpect(status().isOk());
    }

    @Test
    void activateCourse__should_activate_successfully() throws Exception {
        Category category = new Category("Programação", "programacao", "#FF5733", 1);
        Course course = new Course("Java Básico", "java-basico", "Descrição", "inst@alura.com.br", category);
        course.inactivate();

        when(courseRepository.findByCode("java-basico")).thenReturn(Optional.of(course));

        mockMvc.perform(post("/course/java-basico/active"))
                .andExpect(status().isOk());
    }
}