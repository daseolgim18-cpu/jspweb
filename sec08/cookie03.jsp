<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration" %>
<html>
<head>
<title>Session</title>
</head>
<body>
    <%
        Cookie[] cookies=request.getCookies();
        
        for(int i=0; i < cookies.length; i++) {
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
        }
        response.sendRedirect("cookie02.jsp");
    %>
</body>
</html>