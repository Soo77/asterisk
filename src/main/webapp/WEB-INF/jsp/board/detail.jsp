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

#header {
  width: 1100px;
  margin: 0 auto;
}

#header img {
  height: 35px;
}

#footer {
  background-color: #524845;
  color: #ffffff;
  height: 40px;
  width: 1100px;
  text-align: center;
  vertical-align: middle;
  padding-top: 10px;
  margin: auto auto;
}

#content {
  width: 1100px;
  padding-top: 10px;
  margin: auto auto;
}

.photo1 {
  height: 120px;
}

.photo2 {
  height: 100px;
  margin: 2px;
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
    
    <hr>

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
        <label>내용</label>
        <div class="col">
        <textarea id="inputContents" class="form-control" name="contents" rows="10" style="resize: none;" readonly>${board.contents}</textarea>
        </div>
      </div>
      
      <hr>
      
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
      
      <hr> 
      
      <div class="form-group row">
        <div class="col">
          <button id="btnList" type="button" class="btn btn-secondary" onclick="location='list?boardTypeNo=${board.boardTypeNo}'">글목록</button>
          <c:if test="${board.memberNo == memberNo}">
            <button id="btnDelete" type="button" class="btn btn-danger my-view-group" style="float: right;" onclick="location='delete?no=${board.boardNo}'">삭제</button>
            <button id="btnSave" type="submit" class="btn btn-primary my-add-group" style="float: right; background-color: #00AFA0; border-color: #00AFA0;">등록</button>
            <button id="btnUpdate" type="button" class="btn btn-primary my-view-group" style="float: right; background-color: #00AFA0; border-color: #00AFA0;" >수정</button>
          </c:if>
        </div>
      </div>
    </form>
  
  </div>

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

</body>

</html>
