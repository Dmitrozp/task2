package testbook;

import java.util.List;

import bookshelter.logic.BaseController;
import bookshelter.model.Book;

public class MainTest {

	public static void main(String[] args) {
		
		BaseController base = new BaseController();
		List<Book> books = base.getListOfBooks();
		
		for(Book book:books) {
			System.out.println(book.getBookName());
		}

	}

}
