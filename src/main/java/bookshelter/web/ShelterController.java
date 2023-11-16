package bookshelter.web;

import bookshelter.service.ShelterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ShelterController {

	@Autowired
	ShelterService shelterService;

	@RequestMapping("books")
	public String doGet(Model model) {
		
		model.addAttribute("books", shelterService.getAllBooks());
		
		return "bookshelter";
	}

	@RequestMapping("get-books")
	public String getBook(Model model) {

		model.addAttribute("books", shelterService.getAllBooks());

		return "book";
	}
	
}
