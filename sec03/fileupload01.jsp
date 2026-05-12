<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<title>File Upload</title>
</head>
<body>
    <form name = "fileform" method="post" action="fileupload01_process.jsp"
        enctype="multipart/form-data">

        <p> 이름: <input type="text" name="title">
        <p> 제목: <input type="text" name="subject">
        <p> 파일: <input type="file" name="filename">
        <input type="submit" value="업로드">
    </form>
</body>
</html>