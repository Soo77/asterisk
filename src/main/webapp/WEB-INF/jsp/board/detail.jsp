<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>게시물 보기</title>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <style>
    #insertBoardPhotos {
      display: none;
    }
    
    #btnSave {
      display: none;
    }
  </style>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id='content'>
<c:if test="${board.boardTypeNo == 1}">
  <h1>공부상담</h1>
</c:if>
<c:if test="${board.boardTypeNo == 2}">
  <h1>입시상담</h1>
</c:if>
<c:if test="${board.boardTypeNo == 3}">
  <h1>문제풀이</h1>
</c:if>
<hr>

<form action='update' method='post' enctype='multipart/form-data'>
<input type='hidden' name='boardTypeNo' value='${board.boardTypeNo}'>
번호 : <input type='text' name='boardNo' value='${board.boardNo}' readonly><br>
제목 : <input id="my-title-input" type='text' name='title' value='${board.title}' readonly><br>
작성자 : <input type='text' name='name' value='${board.memberName}' readonly><br>
작성일 : <input type='text' name='createdDate' value='${board.createdDate}' readonly><br>
조회 : <input type='text' name='viewCount' value='${board.viewCount}' readonly><br>
내용 : <textarea id="my-contents-input" name='contents' rows='5'
            cols='50' readonly>${board.contents}</textarea><br>
   
<div id="boardFiles">
  <p>
  <c:if test="${not empty board.files}" >
    <c:forEach items="${board.files}" var="file">
    <img src='/upload/board/${file.fileName}' class='photo2'> 
    </c:forEach>
  </c:if>
  </p>
</div>

<div id="insertBoardPhotos">
  <c:forEach begin="1" end="6">
        사진: <input type='file' name='fileName'><br>
  </c:forEach>
</div>

<button type="button" onclick="location='list?boardTypeNo=${board.boardTypeNo}'">글목록</button>
<c:if test="${board.memberNo == memberNo}" >
  <button type="button" id="btnModify">수정</button>
  <button id="btnSave">저장</button>
  <button type="button" onclick="location='delete?no=${board.boardNo}'">삭제</button>
</c:if>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>

<script src="/node_modules/sweetalert/dist/sweetalert.min.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script>
  var modifyButton = document.querySelector('#btnModify');
  
  modifyButton.addEventListener('click', function() {
    modifyButton.style.display = 'none';
    document.querySelector('#btnSave').style.display = 'inline';
    document.querySelector('#my-title-input').readOnly = false;
    document.querySelector('#my-contents-input').readOnly = false;
    var boardPhotos = document.querySelector('#insertBoardPhotos');
    boardPhotos.style.display = 'inline';
  });
  
  
</script>

</html>
