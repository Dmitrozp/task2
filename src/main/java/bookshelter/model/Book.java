package bookshelter.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@Entity
@Table(name = "book")
public class Book {
	@Id()
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "bookname")
	private String bookName;
	@Column(name = "dateofbook")
	private LocalDateTime dateOfBook;

}
