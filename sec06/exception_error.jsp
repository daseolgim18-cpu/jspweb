<%@ page contentType="text/html; charset=utf-8"%>
<%@ page isErrorPage="true" %>
<html>
<head>
<title>Exception</title>
</head>
<body>
   <P> 오류가 발생하였습니다.
   <P> 예외 유형 : <%=exception.toString() %>
   <P> toString() : <%=exception.toString() %>
   <P> getClass().getName() : <%=exception.getClass().getName() %>
   <P> getMessage() : <%=exception.getMessage() %>
</body> 
</html>