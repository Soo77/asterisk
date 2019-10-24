<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>게시물 보기</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<h1>게시판</h1>

번호 : <input type='text' name='boardNo' value='${boardFileList[0].board.boardNo}' readonly><br>
제목 : <input type='text' name='title' value='${boardFileList[0].board.title}' readonly><br>
작성자 : <input type='text' name='name' value='${boardFileList[0].board.member.name}' readonly><br>
작성일 : <input type='text' name='createdDate' value='${boardFileList[0].board.createdDate}' readonly><br>
조회 : <input type='text' name='viewCount' value='${boardFileList[0].board.viewCount}' readonly><br>
내용 : <textarea name='contents' rows='5'
            cols='50' readonly>${boardFileList[0].board.contents}</textarea><br>
            
<c:forEach items="${boardFileList}">
<p>
  <img src='/upload/board/${fileName}' class='photo2'> 
</p>
</c:forEach>
<c:forEach begin="1" end="6">
  사진: <input type='file' name='fileName'><br>
</c:forEach>

<a href='list?boardTypeNo=${board.boardType.boardTypeNo}'>글목록</a>
<a href='detailedit?no=${board.boardNo}'> 수정</a>

</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
