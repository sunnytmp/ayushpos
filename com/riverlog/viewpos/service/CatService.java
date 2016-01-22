package com.riverlog.viewpos.service;

import java.util.List;

import com.riverlog.viewpos.model.Category;
  
public interface CatService {
     
    Category findById(int id);
     
   Category findByName(String name);
     
    void saveCategory(Category category);
     
    void updateCategory(Category category);
     
    void deleteCategoryById(int id);
 
    List<Category> findAllCategorys(); 
     
    void deleteAllCategorys();
     
    public boolean isCategoryExist(Category category);
     
}