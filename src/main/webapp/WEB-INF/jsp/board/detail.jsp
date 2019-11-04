<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 보기</title>

<style>
#insertBoardPhotos {
  display: none;
}

#btnSave {
  display: none;
}

#btnCancle {
  display: none;
}

.photo1 {
  height: 120px;
}

.photo2 {
  height: 100px;
  margin: 2px;
}

/* div{
border: 1px solid;
} */
</style>
</head>
<body>

  <div class="title">
    <c:if test="${board.boardTypeNo == 1}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">공부상담</h2>
    </c:if>
    <c:if test="${board.boardTypeNo == 2}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">입시상담</h2>
    </c:if>
    <c:if test="${board.boardTypeNo == 3}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">문제풀이</h2>
    </c:if>
    <c:if test="${board.boardTypeNo == 4}">
      <h1 style="display: inline">공지사항</h1>
    </c:if>
  </div>

  <hr>

    <form id="form1" name="frm1" action='update' method='post' enctype='multipart/form-data'>
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

       <div id="boardFiles">
          <p>
            <c:forEach items="${board.files}" var="file">
              <img src='/upload/board/${file.fileName}' class='photo2' onerror="this.style.display='none'" alt=''>
            </c:forEach>
          </p>
      </div> 

    <div id="insertBoardPhotos">
      <input type="file" multiple id="gallery-photo-add" name="fileName">
      <div class="row">
        <div class="col">
          <div class="gallery"></div>
        </div>
      </div>
    </div>
    
    <hr> 
      
      <div class="form-group row">
        <div class="col">
          <button id="btnList" type="button" class="btn btn-secondary" onclick="location='list?boardTypeNo=${board.boardTypeNo}'">글목록</button>
          <c:if test="${board.memberNo == memberNo or sessionScope.memberNo != null and sessionScope.memberNo == 4}">
            <button id="btnDelete" type="button" class="btn btn-danger my-view-group" data-toggle="modal" data-target="#deleteModal" style="float: right;">삭제</button>
          </c:if>
          <c:if test="${board.memberNo == memberNo}">
            <button id="btnUpdate" type="button" class="btn btn-info" style="float: right;" >수정</button>
            <button id="btnCancle" type="button" class="btn btn-danger my-view-group" data-toggle="modal" data-target="#cancelModal" style="float: right;">취소</button>
            <!-- <button id="btnSave" type="button" class="btn btn-info" data-toggle="modal" data-target="#updateModal" style="float: right;">등록</button> -->
            <button id="btnSave" type="button" class="btn btn-info" onclick="add_board()" style="float: right;">등록</button>
          </c:if>
        </div>
      </div>
    </form>
    
<!-- delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="location='delete?no=${board.boardNo}'">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- update Modal -->
<!-- <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        수정하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button id="btnSubmit" type="button" class="btn btn-primary"  onclick="form_submit()">확인</button>
      </div>
    </div>
  </div>
</div> -->

<!-- cancel Modal -->
<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">취소</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        취소하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary"  onclick="location='detail?no=${board.boardNo}'">확인</button>
      </div>
    </div>
  </div>
</div>

  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script>
			var modifyButton = document.querySelector('#btnUpdate');
			modifyButton.addEventListener('click', function() {
				modifyButton.style.display = 'none';
				document.querySelector('#btnDelete').style.display = 'none';
				document.querySelector('#btnList').style.display = 'none';
				document.querySelector('#btnSave').style.display = 'inline';
				document.querySelector('#btnCancle').style.display = 'inline';
				document.querySelector('#inputTitle').readOnly = false;
				document.querySelector('#inputContents').readOnly = false;
				var boardPhotos = document.querySelector('#insertBoardPhotos');
				boardPhotos.style.display = 'inline';
			});
			
			$(function() {
				var imagesPreview = function(input, placeToInsertImagePreview) {
					if (input.files) {
						var filesAmount = input.files.length;
						for (i = 0; i < filesAmount; i++) {
							var reader = new FileReader();
							reader.onload = function(event) {
								$($.parseHTML('<img style="height:100px; margin-top:10px;">'))
										.attr('src', event.target.result)
										.appendTo(placeToInsertImagePreview);
							}
							reader.readAsDataURL(input.files[i]);
						}
					}
				};

				$('#gallery-photo-add').on('change', function() {
					imagesPreview(this, 'div.gallery');
				});
			});
			
			function submit_form() {
			    document.getElementById("form1").submit();
			   }    
			
			function add_board() {
 				var form = document.frm1;
 				if (form.title.value.length == 0) {
 					alert("제목을 입력하세요.");
 					form.title.focus();
 					return;
 				}
 				if (form.contents.value.length == 0) {
 					alert("내용을 입력하세요.");
 					form.contents.focus();
 					return;
 				}
 				else {
 					submit_form();
 				}
 			}
</script>

</body>

</html>
