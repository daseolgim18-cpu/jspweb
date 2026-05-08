<%@ page contentType="text/html; charset=utf-8" %>
<%@ page isELIgnored = "false" %>
<%!
    int pageCount=0;
    void addCount() {
        pageCount++;
    }
%>
<%
    addCount();
%>
<P>이 사이트 방문은 <%=pageCount %>번재 입니다.<P>
