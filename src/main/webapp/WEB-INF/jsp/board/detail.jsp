<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 보기</title>
<link rel='stylesheet'
  href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='/css/common.css'>
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

  <jsp:include page="../header.jsp" />

  <div id='content'>
    <div class="title">
      <h1 style="display:inline">질문게시판 ㅣ</h1>
      <c:if test="${board.boardTypeNo == 1}">
        <h2 style="display:inline">공부상담</h2>
      </c:if>
      <c:if test="${board.boardTypeNo == 2}">
        <h2 style="display:inline">입시상담</h2>
      </c:if>
      <c:if test="${board.boardTypeNo == 3}">
        <h2 style="display:inline">문제풀이</h2>
      </c:if>
    </div>

  <form action='update' method='post' enctype='multipart/form-data'>
    <input type="hidden" name="boardTypeNo" value="${board.boardTypeNo}">
    <input type="hidden" name="boardNo" value="${board.boardNo}"> <br>
    
    <div class="form-group row">
      <label>제목</label>
      <div class="col">
        <input type="text" readonly class="form-control" id="inputTitle" name="title" value="${board.title}">
      </div>
    </div>
    
    <hr>
    
    <div class="form-group row">
      <label>작성자</label>
      <div class="col">
        <input type="text" readonly class="form-control" name="name" value="${board.memberName}">
      </div>
      
      <label>작성일</label>
      <div class="col">
        <input type="text" readonly class="form-control" name="createdDate" value="${board.createdDate}">
      </div>
      
      <label>조회수</label>
      <div class="col">
        <input type="text" readonly class="form-control" name="viewCount" value="${board.viewCount}">
      </div>
    </div>
    
    <div class="form-group row">
      <textarea id="inputContents" class="form-control" name="contents" rows="10" readonly>${board.contents}</textarea>
    </div>
    
    <div id="boardFiles">
        <p>
          <c:if test="${not empty board.files}">
            <c:forEach items="${board.files}" var="file">
              <img src='/upload/board/${file.fileName}' class='photo2'>
            </c:forEach>
          </c:if>
        </p>
    </div>

    <div id="insertBoardPhotos">
      <c:forEach begin="1" end="6">
      사진: <input type='file' name='fileName'>
        <br>
      </c:forEach>
    </div>
      
    <div class="form-group row">
      <div class="col">
        <button id="btnList" type="button" class="btn btn-secondary" onclick="location='list?boardTypeNo=${board.boardTypeNo}'">글목록</button>
        <c:if test="${board.memberNo == memberNo}">
          <button id="btnDelete" type="button" class="btn btn-danger my-view-group" style="float: right;" onclick="location='delete?no=${board.boardNo}'">삭제</button>
          <button id="btnSave" type="submit" class="btn btn-primary my-add-group" style="float: right;">등록</button>
          <button id="btnUpdate" type="button" class="btn btn-primary my-view-group" style="float: right;">수정</button>
        </c:if>
      </div>
    </div>
  </form>
  
  </div>



 <%--    <form action='update' method='post' enctype='multipart/form-data'>
      <input type='hidden' name='boardTypeNo' value='${board.boardTypeNo}'>
      <input type='hidden' name='boardNo' value='${board.boardNo}' readonly> <br>
      
              제목 : <input id="my-title-input" type='text' name='title' value='${board.title}' readonly> <br>
              작성자 : <input type='text' name='name' value='${board.memberName}' readonly> <br>
              작성일 : <input type='text' name='createdDate' value='${board.createdDate}' readonly> <br>
              조회 : <input type='text' name='viewCount' value='${board.viewCount}' readonly> <br>
              내용 : <textarea id="my-contents-input" name='contents' rows='5'cols='50' readonly>${board.contents}</textarea> <br>

      <div id="boardFiles">
        <p>
          <c:if test="${not empty board.files}">
            <c:forEach items="${board.files}" var="file">
              <img src='/upload/board/${file.fileName}' class='photo2'>
            </c:forEach>
          </c:if>
        </p>
      </div>

      <div id="insertBoardPhotos">
        <c:forEach begin="1" end="6">
        사진: <input type='file' name='fileName'>
          <br>
        </c:forEach>
      </div>

      <button type="button"
        onclick="location='list?boardTypeNo=${board.boardTypeNo}'">글목록</button>
      <c:if test="${board.memberNo == memberNo}">
        <button type="button" id="btnUpdate">수정</button>
        <button id="btnSave">저장</button>
        <button type="button"
          onclick="location='delete?no=${board.boardNo}'">삭제</button>
      </c:if>
    </form>
  </div> --%>

  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

  <script>
			var modifyButton = document.querySelector('#btnUpdate');

			modifyButton.addEventListener('click', function() {
				modifyButton.style.display = 'none';
				document.querySelector('#btnSave').style.display = 'inline';
				document.querySelector('#inputTitle').readOnly = false;
				document.querySelector('#inputContents').readOnly = false;
				var boardPhotos = document.querySelector('#insertBoardPhotos');
				boardPhotos.style.display = 'inline';
			});
		</script>

  <jsp:include page="../footer.jsp" />
</body>

</html>
