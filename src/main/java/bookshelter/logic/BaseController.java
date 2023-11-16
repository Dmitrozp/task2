package bookshelter.logic;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import bookshelter.model.Book;
import bookshelter.service.ShelterService;

public class BaseController {
	
	ApplicationContext ctx = (ApplicationContext) new ClassPathXmlApplicationContext(
			"spring.xml");	
	ShelterService shelterService = (ShelterService) ctx
			.getBean("shelterService");
	
	public void closeConnection() {
		((AbstractApplicationContext) ctx).close();
	}
	
    public List<Book> getListOfBooks(){
    	return shelterService.getAllBooks();
    }
}
