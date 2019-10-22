<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>글쓰기</h1>

<form action='add' method=post enctype='multipart/form-data'>>
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

<jsp:include page="../footer.jsp"/>

</body>
</html>