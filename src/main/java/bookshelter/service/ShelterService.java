package bookshelter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bookshelter.dao.ShelterRepository;
import bookshelter.model.Book;

@Service("ShelterService")
@Transactional
public class ShelterService {

	@Autowired
	private ShelterRepository repository;
	
	public List<Book> getAllBooks(){
		return repository.findAll();
	}

	public Book addBook(Book book){
		return repository.saveAndFlush(book);
	}


	
}
