<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="jakarta.servlet.http.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"%>

<%
    request.setCharacterEncoding("UTF-8");

    String realFolder = request.getServletContext().getRealPath("/resources/images");

    File dir = new File(realFolder);
    if (!dir.exists()) { 
        dir.mkdirs();
    }

    String bookId = request.getParameter("bookId");
    String name = request.getParameter("name");
    String unitPrice = request.getParameter("unitPrice");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    String releaseDate = request.getParameter("releaseDate");
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    String unitsInStock = request.getParameter("unitsInStock");
    String condition = request.getParameter("condition");

    int price = (unitPrice != null && !unitPrice.isEmpty()) ?
    Integer.parseInt(unitPrice) : 0;

    long stock = (unitsInStock != null && !unitsInStock.isEmpty()) ?
    Long.parseLong(unitsInStock) : 0;

    String fileName = "";
    Part part = request.getPart("bookImage"); 

    if (part != null && part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
        fileName = part.getSubmittedFileName();
        part.write(realFolder + File.separator + fileName);
    }

    BookRepository dao = BookRepository.getInstance();

    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setUnitPrice(price);
    newBook.setAuthor(author);
    newBook.setPublisher(publisher);
    newBook.setReleaseDate(releaseDate);
    newBook.setDescription(description);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setCondition(condition);
    newBook.setFilename(fileName);

    dao.addBook(newBook);

    response.sendRedirect("books.jsp");
%>