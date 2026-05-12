<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<title>File Upload</title>
</head>
<body>
    <form name = "fileform" method="post" action="fileupload02_process.jsp"
        enctype="multipart/form-data">

        <P> 이름 1:<input type="text" name="name1">
            제목 1:<input type="text" name="subject1">
            파일 1:<input type="file" name="file1">

        <P> 이름 2:<input type="text" name="name2">
            제목 2:<input type="text" name="subject2">
            파일 2:<input type="file" name="file2">

        <P> 이름 3:<input type="text" name="name3">
            제목 3:<input type="text" name="subject3">
            파일 3:<input type="file" name="file3">
    <input type="submit" value="업로드">
</form>
</body>
</html>