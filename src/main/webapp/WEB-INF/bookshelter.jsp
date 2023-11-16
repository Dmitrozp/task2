<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=cp1251"%>
<%@ page pageEncoding="cp1251"%>

<html>
<head>
</head>

<body>
	<b>Book Shelter</b>
	<br>
	<table>
		<c:forEach items="${books}" var="book">
			<tr>
				<td>${book.id}. </td>
				<td>${book.bookName}</td>
				<td>&nbsp; ${book.dateOfBook}</td>
			</tr>
		</c:forEach>
	</table>


</body>


</html>