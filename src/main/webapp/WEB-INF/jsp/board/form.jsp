<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록폼</title>
<link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>글쓰기</h1>

<form action='add' method=post enctype='multipart/form-data'>
  제목 : <input type='text' name='title'><br>
<select name="boardTypeNo" id="boardTypeSelect">
  <option value=1>공부상담</option>
  <option value=2>입시상담</option>
  <option value=3>문제풀이</option>
</select>
<br>
내용 : <textarea name='contents' rows='5' cols='50'></textarea><br>
사진: <input type='file' name='fileName'><br>
사진: <input type='file' name='fileName'><br>
사진: <input type='file' name='fileName'><br>
사진: <input type='file' name='fileName'><br>
사진: <input type='file' name='fileName'><br>
사진: <input type='file' name='fileName'><br>
<button>등록</button>
</form>
</div>

<script src="/node_modules/sweetalert/dist/sweetalert.min.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<jsp:include page="../footer.jsp"/>

</body>
</html>