<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*, java.util.*, jakarta.servlet.http.*" %>

<%
    // 저장 경로 설정
    String savePath = "C:\\upload";

    File uploadDir = new File(savePath);

    if (!uploadDir.exists()) {
        uploadDir.mkdir();
    }

    // 일반 파라미터 읽기
    Enumeration<String> params = request.getParameterNames();

    while (params.hasMoreElements()) {

        String pName = params.nextElement();

        String pValue = request.getParameter(pName);

        out.println(pName + " = " + pValue + "<br>");
    }
%>