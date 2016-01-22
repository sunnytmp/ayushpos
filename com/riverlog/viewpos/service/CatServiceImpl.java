package com.riverlog.viewpos.service;

import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.riverlog.viewpos.model.Category; 

//import net.codejava.spring.dao.CategoryDAO;
//import net.codejava.spring.model.Category;
 
@Service("CatService")
@Transactional
public class CatServiceImpl implements CatService{
     
    private static final AtomicInteger counter = new AtomicInteger();
     
    private static List<Category> categorys;
    static{
    	categorys= populateDummyCategorys();
    }
//	@Autowired
//	private CategoryDAO CategoryDao;
     
      public List<Category> findAllCategorys() {
        return populateDummyCategorys();
    }
     
    public Category findById(int id) {
    
    	     for(Category cat : categorys){
    	    	 System.out.println("Category " + cat.getId());
    	            if(cat.getId() == id){
    	                return cat;
    	            }
    	        }
    	        return null;
    }
     
    public Category findByName(String name) {
        
        for(Category cat : categorys){
            if(cat.getName().equalsIgnoreCase(name)){
                return cat;
            }
        }
        return null;
    }
     
    
    public void saveCategory(Category cat) {
        cat.setId(counter.incrementAndGet());
        categorys.add(cat);
    }
 
    public void updateCategory(Category cat) {
        int index = categorys.indexOf(cat);
        categorys.set(index, cat);
    }
 
    public void deleteCategoryById(int id) {
        for (Iterator<Category> iterator = categorys.iterator(); iterator.hasNext(); ) {
            Category cat = iterator.next();
            if (cat.getId() == id) {
                iterator.remove();
            }
        }
  
    }
 
    public boolean isCategoryExist(Category cat) {
      return findByName(cat.getName())!=null;
    }
     
 

	public void deleteAllCategorys(){
      //  Categorys.clear();
    }
 
    private static
    List<Category> populateDummyCategorys(){
 		List<Category> listCategorys = new ArrayList<Category>();;
	/**	try {
			listCategorys = CategoryDao.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} **/
 		listCategorys.add(new Category(counter.incrementAndGet(),"Spices", "Speices Desc"));
 		listCategorys.add(new Category(counter.incrementAndGet(),"Grrains", "Grains Desc"));
 		listCategorys.add(new Category(counter.incrementAndGet(),"Sweets", "Sweets Desc"));
       
        return listCategorys;
    }
 
   // @ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/applicationContext.xml"})
    public static void main(String[] args){
        ApplicationContext context = new ClassPathXmlApplicationContext("servlet-context.xml");
        
        
        CatService itmImpl = (CatService) context.getBean("catService");
  /**      Category Category = new Category(23);
        Category.setName("HotChips");
        Category.setDescp("Hot Chipsmjj  jjj P");
        if(!itmImpl.isCategoryExist(Category))
    	      itmImpl.saveCategory(Category); 
        else
        	System.out.println("Category already exists");
        Category category1 = itmImpl.findById(1); 
        category1.setName("DLY PODI");
        itmImpl.updateCategory(category1);
    	List<Category> categorys1 = itmImpl.findByName("POD"); **/ 
       List<Category> categorys = itmImpl.findAllCategorys();
    	for(Category cat1 : categorys){
    		System.out.println(cat1.getName());
    		System.out.println(cat1.getDescp());
    	}
    	/**Category.setEmail("New Email update.com");
    	usrImpl.updateCategory(Category);
    	Category.setId(2);
    	usrImpl.deleteCategoryById(Category.getId()); **/
    	System.exit(0);
    }

	
}