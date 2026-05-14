<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
<title>Internationalization</title>
</head>
<body>
    <p>-------------기본 로케일--------------
    <fmt:setLocale value="ko" />
    <fmt:setBundle basename="bundle.myBundle" var="resourceBundle" />
    <p> 제목 : <fmt:message key="title" bundle="${resourceBundle}" />
    <p> <fmt:message key="username" var="userMsg" bundle="${resourceBundle}" /> 이름 : ${userMsg} 

    <p>-------------영문 로케일--------------
    <fmt:setLocale value="en" />
    <fmt:setBundle basename="bundle.myBundle" var="resourceBundle" />
    <p> 제목 : <fmt:message key="title" bundle="${resourceBundle}" /> </p>
    <p> 이름 : <fmt:message key="username" bundle="${resourceBundle}" /> </p>
</body>
</html>