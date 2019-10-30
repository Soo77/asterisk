<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 등록폼</title>
<link rel='stylesheet'
  href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel='stylesheet' href='/css/common.css'>
  
  <style>
  .my-title-input{
    border-radius: 5px;
    color: #fff;
    background-color: #00AFA0;
    
    height: 50px;]
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    
    margin: auto;
  }

  .p {
    text-align:center;
    font-size:20px;
    vertical-align:middle;
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
  <h1>글쓰기</h1>
    
  <div class='my-title-input'>
    <p class="p">질문게시판 글쓰기</p>
  </div>
  <br>
  
  <form action='add' method=post enctype='multipart/form-data'>
    <div class="form-row">
      <div class="form-group col-md-6">
        <input type="text" class="form-control" id="title" name='title' placeholder="글 제목">
      </div>
      <div class="form-group col-md-6">
        <select id="boardTypeSelect" class="form-control" name="boardTypeNo">
          <option selected>카테고리 선택</option>
          <option value=1>공부상담</option>
          <option value=2>입시상담</option>
          <option value=3>문제풀이</option>
        </select>
      </div>
    </div>
    
    <div class="form-group">
      <textarea class="form-control" name='contents' rows="10" style="resize: none;" placeholder="내용을 입력해주세요"></textarea>
    </div>
    
    <hr>
    
    <div class="custom-file" id="insertBoardPhotos">
      <c:forEach begin="1" end="6">
                사진: <input type='file' name='fileName'>
        <!-- <input type="file" class="custom-file-input" id="customFile" name='fileName'>
        <label class="custom-file-label" for="customFile">파일을 선택하세요</label> -->
      <br>
      </c:forEach>
    </div>
    
    <hr>

    <div align="right">
      <button type="submit" class="btn btn-primary" style="background-color: #00AFA0; border-color: #00AFA0;">등록</button>
    </div>
  </form>
</div>

<!--   <div id='content'>
    <h1>글쓰기</h1>

     <form action='add' method=post enctype='multipart/form-data'>
             제목 : <input type='text' name='title'><br>
      <select name="boardTypeNo" id="boardTypeSelect">
        <option value=1>공부상담</option>
        <option value=2>입시상담</option>
        <option value=3>문제풀이</option>
      </select> <br> 
              내용 : <textarea name='contents' rows='5' cols='50'></textarea><br>
               사진: <input type='file' name='fileName'><br>
                사진: <input type='file' name='fileName'><br>
                사진: <input type='file' name='fileName'><br>
                사진: <input type='file' name='fileName'><br>
                사진: <input type='file' name='fileName'><br>
                사진: <input type='file' name='fileName'><br>
      <button>등록</button>
    </form>
  </div>  -->

  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>