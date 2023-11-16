package bookshelter.web;

import bookshelter.model.Book;
import bookshelter.service.ShelterService;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/api/books")
public class RESTController {

    private final ShelterService shelterService;

    public RESTController(ShelterService shelterService) {
        this.shelterService = shelterService;
    }

    @GetMapping
    public List<Book> getAllBooks() {
        return shelterService.getAllBooks();
    }

    @PostMapping
    public Book addBook(@RequestBody Book book) {
        book.setDateOfBook(LocalDateTime.now());
        return shelterService.addBook(book);
    }
}
