<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Book Shelter</title>
	<style>
		th {
			cursor: pointer;
			text-decoration: underline;
		}
		button {
			background-color: #2cffb8;
			border: none;
			color: white;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			border-radius: 10px;
			cursor: pointer;
		}
		.table {
			width: 100%;
			margin-bottom: 20px;
			border: 5px solid #fff;
			border-top: 5px solid #fff;
			border-bottom: 3px solid #fff;
			border-collapse: collapse;
			outline: 3px solid #ffd300;
			font-size: 15px;
			background: #fff!important;
		}
		.table th {
			font-weight: bold;
			padding: 7px;
			background: #ffd300;
			border: none;
			text-align: left;
			font-size: 15px;
			border-top: 3px solid #fff;
			border-bottom: 3px solid #ffd300;
		}
		.table td {
			padding: 7px;
			border: none;
			border-top: 3px solid #fff;
			border-bottom: 3px solid #fff;
			font-size: 15px;
		}
		.table tbody tr:nth-child(even){
			background: #f8f8f8!important;
		}
		.container{
			max-width: 800px;
			background: #fff;
			width: 800px;
			padding: 25px 40px 10px 40px;
			box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
		}
		.container .text{
			text-align: center;
			font-size: 41px;
			font-weight: 600;
			font-family: 'Poppins', sans-serif;
			background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
		}
		.container form{
			padding: 30px 0 0 0;
		}
		.container form .form-row{
			display: flex;
			margin: 32px 0;
		}
		.form-row .input-data{
			width: 100%;
			height: 40px;
			margin: 0 20px;
			position: relative;
		}
		.form-row .textarea{
			height: 70px;
		}
		.input-data input,
		.textarea textarea{
			display: block;
			width: 100%;
			height: 100%;
			border: none;
			font-size: 17px;
			border-bottom: 2px solid rgba(0,0,0, 0.12);
		}
		.input-data input:focus ~ label, .textarea textarea:focus ~ label,
		.input-data input:valid ~ label, .textarea textarea:valid ~ label{
			transform: translateY(-20px);
			font-size: 14px;
			color: #3498db;
		}
		.textarea textarea{
			resize: none;
			padding-top: 10px;
		}
		.input-data label{
			position: absolute;
			pointer-events: none;
			bottom: 10px;
			font-size: 16px;
			transition: all 0.3s ease;
		}
		.textarea label{
			width: 100%;
			bottom: 40px;
			background: #fff;
		}
		.input-data .underline{
			position: absolute;
			bottom: 0;
			height: 2px;
			width: 100%;
		}
		.input-data .underline:before{
			position: absolute;
			content: "";
			height: 2px;
			width: 100%;
			background: #3498db;
			transform: scaleX(0);
			transform-origin: center;
			transition: transform 0.3s ease;
		}
		.input-data input:focus ~ .underline:before,
		.input-data input:valid ~ .underline:before,
		.textarea textarea:focus ~ .underline:before,
		.textarea textarea:valid ~ .underline:before{
			transform: scale(1);
		}
		.submit-btn .input-data{
			overflow: hidden;
			height: 45px!important;
			width: 25%!important;
		}
		.submit-btn .input-data .inner{
			height: 100%;
			width: 300%;
			position: absolute;
			left: -100%;
			background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
			transition: all 0.4s;
		}
		.submit-btn .input-data:hover .inner{
			left: 0;
		}
		.submit-btn .input-data input{
			background: none;
			border: none;
			color: #fff;
			font-size: 17px;
			font-weight: 500;
			text-transform: uppercase;
			letter-spacing: 1px;
			cursor: pointer;
			position: relative;
			z-index: 2;
		}
		@media (max-width: 700px) {
			.container .text {
				font-size: 30px;
			}

			.container form {
				padding: 10px 0 0 0;
			}

			.container form .form-row {
				display: block;
			}

			.form-row .input-data {
				margin: 35px 0 !important;
			}

			.submit-btn .input-data {
				width: 40% !important;
			}
		}
	</style>
</head>
<body>

<table class="table" id="booksTable" border="1">
	<thead>
	<tr>
		<th onclick="sortTable(0)">ID</th>
		<th onclick="sortTable(1)">Автор</th>
		<th onclick="sortTable(2)">Рік видання</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${books}" var="book">
		<tr>
			<td>${book.id}</td>
			<td>${book.bookName}</td>
			<td>${book.dateOfBook}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br>




<div class="container">
		<div class="form-row">
			<div class="input-data">
				<input type="text" name="bookname" id="newBookTitle" oninput="validateInput()" required>
				<div class="underline"></div>
				<label for="newBookTitle">Назва книги</label>
			</div>
			<p style="background-color: red; font-size: xx-large" id="errorMessage"></p>
		</div>
	<br>
	<button onclick="addBook()">Додати</button>
</div>



<script>
	function validateInput() {
		var input = document.getElementById("newBookTitle");
		var errorMessage = document.getElementById("errorMessage");

		if (input.value.length > 10) {
			errorMessage.textContent = "довга назва";
		} else {
			errorMessage.textContent = "";
		}
	}

	function sortTable(columnIndex) {
		var table, rows, switching, i, x, y, shouldSwitch;
		table = document.getElementById("booksTable");
		switching = true;

		while (switching) {
			switching = false;
			rows = table.rows;

			for (i = 1; i < (rows.length - 1); i++) {
				shouldSwitch = false;
				x = rows[i].getElementsByTagName("td")[columnIndex];
				y = rows[i + 1].getElementsByTagName("td")[columnIndex];

				if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
					shouldSwitch = true;
					break;
				}
			}

			if (shouldSwitch) {
				rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
				switching = true;
			}
		}
	}

	function addBook() {
		var newBookTitle = document.getElementById("newBookTitle").value;

		fetch('/api/books', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ bookName: newBookTitle }),
		})
				.then(response => response.json())
				.then(data => {
					updateTable();
				})
				.catch(error => console.error('Помилка:', error));
	}

	function updateTable() {
		$("#booksTable tbody").empty();

		$.ajax({
			type: "GET",
			url: "/api/books",
			success: function (books) {
				books.forEach(function (book) {
					$("#booksTable tbody").append("<tr><td>" + book.id + "</td><td>" + book.bookName + "</td><td>" + book.dateOfBook + "</td></tr>");
				});
			},
			error: function (error) {
				console.log("Ошибка при получении списка книг: " + error);
			}
		});
	}

</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>
