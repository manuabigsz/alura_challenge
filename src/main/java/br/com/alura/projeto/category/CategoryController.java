package br.com.alura.projeto.category;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class CategoryController {

    private final CategoryRepository categoryRepository;

    public CategoryController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/admin/categories")
    public String list(Model model) {
        List<CategoryDTO> list = categoryRepository.findAll()
                .stream()
                .map(CategoryDTO::new)
                .toList();

        model.addAttribute("categories", list);
        return "admin/category/list";
    }

    @GetMapping("/admin/category/new")
    public String create(NewCategoryForm newCategory, Model model) {
        model.addAttribute("isEdit", false);
        return "admin/category/form";
    }

    @Transactional
    @PostMapping("/admin/category/new")
    public String save(@Valid NewCategoryForm form, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("isEdit", false);
            return "admin/category/form";
        }

        if (categoryRepository.existsByCode(form.getCode())) {
            result.rejectValue("code", "code.exists", "Código já existe");
            model.addAttribute("isEdit", false);
            return "admin/category/form";
        }

        categoryRepository.save(form.toModel());
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/category/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Categoria não encontrada"));
        
        NewCategoryForm form = new NewCategoryForm();
        form.setId(id);
        form.setName(category.getName());
        form.setCode(category.getCode());
        form.setColor(category.getColor());
        form.setOrder(category.getOrder());
        
        model.addAttribute("newCategoryForm", form);
        model.addAttribute("isEdit", true);
        
        return "admin/category/form";
    }

    @Transactional
    @PostMapping("/admin/category/edit/{id}")
    public String update(@PathVariable Long id, @Valid NewCategoryForm form, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("isEdit", true);
            return "admin/category/form";
        }

        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Categoria não encontrada"));

        if (categoryRepository.existsByCodeAndIdNot(form.getCode(), id)) {
            result.rejectValue("code", "code.exists", "Código já existe");
            model.addAttribute("isEdit", true);
            return "admin/category/form";
        }

        category.setName(form.getName());
        category.setCode(form.getCode());
        category.setColor(form.getColor());
        category.setOrder(form.getOrder());
        
        categoryRepository.save(category);
        
        return "redirect:/admin/categories";
    }
}