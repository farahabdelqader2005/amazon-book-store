package com.adminPanelApp.service;

import com.adminPanelApp.dao.CategoryDao;
import com.adminPanelApp.model.Book;
import com.adminPanelApp.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    public List<Category> getAllCategories() {
        return categoryDao.getAllCategories();
    }

    public List<Category> getCategoriesByPage(int firstResult) {
        return categoryDao.getCategoriesByPage(firstResult);
    }

    public List<Category> searchCategories(String keyword) {
        return categoryDao.searchCategories(keyword);
    }

    public List<Category> searchCategoriesByPage(
            String keyword,
            int firstResult) {

        return categoryDao.searchCategoriesByPage(
                keyword,
                firstResult
        );
    }

    public Category getCategoryById(Long id) {
        return categoryDao.getCategoryById(id);
    }

    public void saveCategory(Category category) {
        categoryDao.saveCategory(category);
    }

    public boolean deleteCategory(Long id) {

        Category category =
                categoryDao.getCategoryById(id);

        if (category == null) {
            return false;
        }

        for (Book book : category.getBooks()) {
            book.getCategories().remove(category);
        }

        category.getBooks().clear();

        categoryDao.deleteCategory(id);

        return true;
    }
}
