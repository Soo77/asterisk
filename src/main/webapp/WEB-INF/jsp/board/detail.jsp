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

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #ffffff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #00AFA0;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em; /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

.content {
  border: solid 1px #00AFA0;
  padding: 10px 10px 10px 10px;
}

.col-1 .form-control {
  background-color: #00AFA0;
  color: #ffffff;
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

  <form id="form1" name="frm1" action='update' method='post'
    enctype='multipart/form-data'>
    <input type="hidden" name="boardTypeNo" value="${board.boardTypeNo}">
    <input type="hidden" name="boardNo" value="${board.boardNo}">
    <br>

    <div class="form-group row">
      <div class="col-1">
        <input type="text" readonly class="form-control" value="제목"
          style="width: 80px">
      </div>
      <div class="col">
        <input type="text" readonly class="form-control" id="inputTitle"
          name="title" value="${board.title}">
      </div>
    </div>

    <hr>

    <div class="form-group row">
      <div class="col-1">
        <input type="text" readonly class="form-control" value="작성자"
          style="width: 80px">
      </div>
      <div class="col-3">
        <input type="text" readonly class="form-control" name="id"
          value="${board.memberId}">
      </div>

      <div class="col-1">
        <input type="text" readonly class="form-control" value="작성일"
          style="width: 80px">
      </div>
      <div class="col-3">
        <input type="text" readonly class="form-control"
          name="createdDate" value="${board.createdDate}">
      </div>

      <div class="col-1">
        <input type="text" readonly class="form-control" value="조회"
          style="width: 80px">
      </div>
      <div class="col-3">
        <input type="text" readonly class="form-control"
          name="viewCount" value="${board.viewCount}">
      </div>
    </div>

    <div class="content">
      <div class="form-group row">
        <div class="col">
          <textarea id="inputContents" class="form-control"
            name="contents" rows="30" style="resize: none;" readonly>${board.contents}</textarea>
        </div>
      </div>

      <hr>

      <div id="boardFiles">
        <p>
          <c:forEach items="${board.files}" var="file">
            <img src='/upload/board/${file.fileName}' class='photo2'
              onerror="this.style.display='none'" alt=''>
          </c:forEach>
        </p>
      </div>
      </div>
      </form>
      <hr>

      댓글 8<br>

<!--   <div class="container">
    <label for="content">comment</label>
    <form name="commentInsertForm">
      <div class="input-group">
        <input type="hidden" name="bno" value="${detail.bno}" /> <input
          type="text" class="form-control" id="content" name="content"
          placeholder="내용을 입력하세요."> <span
          class="input-group-btn">
          <button class="btn btn-default" type="button"
            name="commentInsertBtn">등록</button>
        </span>
      </div>
    </form>
  </div> -->

  <div class="container">
    <div class="commentList">
      <c:forEach items="${comments}" var="comment">
        <div>
        <img src="/upload/board/${comment.profilePhoto}" class="photo2">
        <input type="text" readonly value="${comment.memberId}">
        <input type="text" readonly value="${comment.createdDate}">
        <input type="text" readonly value="${comment.contents}">
        </div>
      </c:forEach>
    </div>
  </div>

















  













  <!--     <div id="insertBoardPhotos">
      <input type="file" multiple id="gallery-photo-add" name="fileName">
      <div class="row">
        <div class="col">
          <div class="gallery"></div>
        </div>
      </div>
    </div> -->
    
    <div id="insertBoardPhotos">
      <div class="row">
        <div class="col">
          <div class="filebox"> 
          <input class="upload-name" disabled="disabled">
          <label for="gallery-photo-add">파일선택</label> 
          <input type="file" multiple id="gallery-photo-add" name="fileName">
          </div>
        </div>
      </div>
        
      <!-- <input type="file" multiple id="gallery-photo-add" name="fileName"> -->
      <div class="row">
        <div class="col">
          <div class="gallery"></div>
        </div>
      </div>
    </div>
    
    

      <br>
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
			
			/* $(function() {
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
			}); */
			
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
					$('.upload-name').val('파일' + this.files.length + '개');
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
			
			
			
			
			var bno = '${detail.bno}'; //게시글 번호
			 
			$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
			    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
			    commentInsert(insertData); //Insert 함수호출(아래)
			});
			 
			 
			 
			//댓글 목록 
			function commentList(){
			    $.ajax({
			        url : '/comment/list',
			        type : 'get',
			        data : {'bno':bno},
			        success : function(data){
			            var a =''; 
			            $.each(data, function(key, value){ 
			                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
			                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
			                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
			                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
			                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
			                a += '</div></div>';
			            });
			            
			            $(".commentList").html(a);
			        }
			    });
			}
			 
			//댓글 등록
			function commentInsert(insertData){
			    $.ajax({
			        url : '/comment/insert',
			        type : 'post',
			        data : insertData,
			        success : function(data){
			            if(data == 1) {
			                commentList(); //댓글 작성 후 댓글 목록 reload
			                $('[name=content]').val('');
			            }
			        }
			    });
			}
			 
			//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
			function commentUpdate(cno, content){
			    var a ='';
			    
			    a += '<div class="input-group">';
			    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
			    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
			    a += '</div>';
			    
			    $('.commentContent'+cno).html(a);
			    
			}
			 
			//댓글 수정
			function commentUpdateProc(cno){
			    var updateContent = $('[name=content_'+cno+']').val();
			    
			    $.ajax({
			        url : '/comment/update',
			        type : 'post',
			        data : {'content' : updateContent, 'cno' : cno},
			        success : function(data){
			            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
			        }
			    });
			}
			 
			//댓글 삭제 
			function commentDelete(cno){
			    $.ajax({
			        url : '/comment/delete/'+cno,
			        type : 'post',
			        success : function(data){
			            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
			        }
			    });
			}
			 
			 
			 
			 
			$(document).ready(function(){
			    commentList(); //페이지 로딩시 댓글 목록 출력 
			});
			 


</script>

</body>

</html>
