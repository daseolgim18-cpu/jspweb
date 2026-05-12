<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
    <table border="1">
        <tr>
            <th>요청 파라미터 이름<th>
            <th>요청 파라미터 값<th>
        <tr>
        <%
           request.setCharacterEncoding("UTF-8"); 

          Enumeration<String> params = request.getParameterNames();

            while (params.hasMoreElements()) {

                String name = (String) params.nextElement();
                out.print("<tr><td>" + name + "</td>\n");
                String paraValue = request.getParameter(name);
                out.println("<td>" + paraValue + "</td></tr>\n");
            }
        %>
    </table>
</body>
</html>