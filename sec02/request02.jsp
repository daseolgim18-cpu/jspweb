<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
    <%
       Enumeration en=request.getHeaderNames();
       while (en.hasMoreElements()) {
            String headername = (String) en.nextElements();
            String headerValue = request.getHeader(headerName);
      
    %>
    <%=headerName %> : <%=headerValue %><br>
    <%  
       }
    %>
</body>
</html>