<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date" %>

<html>
<head>
    <title>Welcome</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body>

<div class="container py-4">

    <!-- Home 아이콘 -->
    <header class="pb-3 mb-4 border-bottom">
        <a href="./welcome.jsp"
           class="d-flex align-items-center text-dark text-decoration-none">

            <i class="bi bi-house-fill fs-3"></i>

            <span class="fs-4 ms-2">Home</span>
        </a>
    </header>

    <%! 
        String greeting = "도서 쇼핑몰에 오신 것을 환영합니다";
        String tagline = "Welcome to Web Market!";
    %>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold"><%= greeting %></h1>
            <p class="col-md-8 fs-4">BookMarket</p>
        </div>
    </div>

</div>

</body>
</html>