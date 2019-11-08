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

.col-1 .form-control {
  background-color: #00AFA0;
  color: #ffffff;
}

.wrap {
    width: 100%;
    position: relative;
    display: inline-block;
}
.wrap textarea {
    resize: none;
}
.wrap span {
    position: absolute;
    bottom: 5px;
    right: 5px;
}
#counter {
  background:rgba(255,0,0,0.5);
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
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

      <div id="boardFiles">
        <p>
          <c:forEach items="${board.files}" var="file">
            <img src='/upload/board/${file.fileName}' class='photo2'
              onerror="this.style.display='none'" alt=''>
          </c:forEach>
        </p>
      </div>
    </div>

    <hr>

    <div id="insertBoardPhotos">
      <div class="row">
        <div class="col">
          <div class="filebox">
            <input class="upload-name" disabled="disabled"> <label
              for="gallery-photo-add">파일선택</label> <input type="file"
              multiple id="gallery-photo-add" name="fileName">
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col">
          <div class="gallery"></div>
        </div>
      </div>

      <hr>
    </div>

  </form>

  <c:if test="${board.boardTypeNo != 4}">
    <div class="container">
      <label for="contents">댓글</label>
      <form name="commentInsertForm">
          <input type="hidden" name="boardNo" value="${board.boardNo}" />
          <div class="wrap">
            <textarea class="form-control" id="commentContents"
            name="contents" rows="3" maxlength="300" placeholder="내용을 입력하세요."></textarea>
            <span id="counter">0/300</span>
          </div>
          <div>
            <button class="btn btn-info btn-sm" type="button"
              name="commentInsertBtn" style="float: right;">등록22</button>
          </div>
      </form>
    </div>
    <br>

    <div class="container">
      <div class="commentList"></div>
    </div>
    <hr>
  </c:if>

  <div class="form-group row">
    <div class="col">
      <button id="btnList" type="button" class="btn btn-secondary"
        onclick="location='list?boardTypeNo=${board.boardTypeNo}'">글목록</button>
      <c:if
        test="${board.memberNo == loginUser.memberNo or loginUser.memberTypeNo == 4}">
        <button id="btnDelete" type="button"
          class="btn btn-danger my-view-group" style="float: right;">삭제</button>
      </c:if>
      <c:if test="${board.memberNo == loginUser.memberNo}">
        <button id="btnUpdate" type="button" class="btn btn-info"
          style="float: right;">수정</button>
        <button id="btnCancle" type="button"
          class="btn btn-danger my-view-group" style="float: right;">취소</button>
        <button id="btnSave" type="button" class="btn btn-info"
          style="float: right;">등록</button>
      </c:if>
    </div>
  </div>

  <br>

  <script src="/node_modules/sweetalert/dist/sweetalert.min.js"></script>
  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script>
			var UpdateButton = document.querySelector('#btnUpdate');
			UpdateButton.addEventListener('click', function() {
				UpdateButton.style.display = 'none';
				document.querySelector('.container').style.display = 'none';
				document.querySelector('#btnDelete').style.display = 'none';
				document.querySelector('#btnList').style.display = 'none';
				document.querySelector('#btnSave').style.display = 'inline';
				document.querySelector('#btnCancle').style.display = 'inline';
				document.querySelector('#inputTitle').readOnly = false;
				document.querySelector('#inputContents').readOnly = false;
				var boardPhotos = document.querySelector('#insertBoardPhotos');
				boardPhotos.style.display = 'inline';
			});

			var cancleButton = document.querySelector('#btnCancle');
			  cancleButton.addEventListener('click', function() {
				  swal({
					  title: "취소",
					  text: "취소하시겠습니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						  location.href = "detail?no=" + ${board.boardNo};
					  } else {
					  }
					});
				});
			  
		  var saveButton = document.querySelector('#btnSave');
		  saveButton.addEventListener('click', function() {
			  var form = document.frm1;
					if (form.title.value.length == 0) {
						swal("제목을 입력하세요.");
						form.title.focus();
						return;
					}
					if (form.contents.value.length == 0) {
						swal("내용을 입력하세요.");
						form.contents.focus();
						return;
					}
					else {
						swal({
							  title: "수정",
							  text: "등록하시겠습니까?",
							  buttons: true,
							})
							.then((willDelete) => {
							  if (willDelete) {
							    swal("등록되었습니다.", {
							      icon: "success",
							    });
							    document.getElementById("form1").submit();
							  } else {
							  }
							});
					}
			});
		  
		  var deleteButton = document.querySelector('#btnDelete');
		  deleteButton.addEventListener('click', function() {
			  swal({
				  title: "삭제",
				  text: "삭제하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  location.href = "delete?no=" + ${board.boardNo};
				  } else {
				  }
				});
			});
	</script>

  <script>
			$(function() {
				var imagesPreview = function(input, placeToInsertImagePreview) {
					if (input.files) {
						var filesAmount = input.files.length;
						for (i = 0; i < filesAmount; i++) {
							var reader = new FileReader();
							reader.onload = function(event) {
								$(
										$
												.parseHTML('<img style="height:100px; margin-top:10px;">'))
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
			
	</script>

  <script>
			var boardNo = '${board.boardNo}'; //게시글 번호

			$('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
				var commentContents = document.querySelector('#commentContents');
				if (commentContents.value.length > 0) {
				var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
				commentInsert(insertData); //Insert 함수호출(아래)
				$("#counter").html("0/300");
				} else {
					swal("내용을 입력하세요.");
				}
			});
			// 댓글 글자수 제한
			$(function() {
			      $('#commentContents').keyup(function (e){
			          var content = $(this).val();
			          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			          $('#counter').html(content.length + '/300');
			      });
			      $('#commentContents').keyup();
			});

			//댓글 목록 
			function commentList() {
				$.ajax({
						url : 'comment/list',
						type : 'get',
						data : {
							'boardNo' : boardNo
						},
						success : function(data) {
							var a = '';
							$.each(
										data,
										function(key, value) {
											a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
											a += '<div class="commentInfo'+value.commentNo+'">'
													+ value.memberId
											
											if (value.memberNo == ${loginUser.memberNo}){
												a += '<button class="btn btn-outline-danger btn-sm" id="commentDelete" type="button" style="float: right;" onclick="commentDelete('
  													+ value.commentNo
  													+ ');"> 삭제 </button>'
  											a += '<button class="btn btn-outline-info btn-sm" id="commentUpdate" type="button" style="float: right;" onclick="commentUpdate('
  													+ value.commentNo
  													+ ',\''
  													+ value.contents
  													+ '\');"> 수정 </button>'
											}
											
											a += '</div>';
											a += '<div class="commentContent'+value.commentNo+'" style="word-break:break-all;">'
													+ value.contents;
											a += '</div>' + value.createdDate + '</div>';
										});

							$(".commentList").html(a);
						}
					});
			}

			//댓글 등록
			function commentInsert(insertData) {
				$.ajax({
					url : 'comment/add',
					type : 'post',
					data : insertData,
					success : function(data) {
						if (data == 1) {
							commentList(); //댓글 작성 후 댓글 목록 reload
							$('[name=contents]').val('');
						}
					}
				});
			}
			

			//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
			function commentUpdate(commentNo, contents) {
				var a = '';

				a += '<div class="input-group">';
				a += '<input type="text" class="form-control" name="contents_'+commentNo+'" value="'+contents+'"/>';
				a += '<span class="input-group-btn"><button class="btn btn-outline-success btn-sm" type="button" onclick="commentUpdateProc('
						+ commentNo + ');">수정</button> </span>';
				a += '</div>';

				$('.commentContent' + commentNo).html(a);

			}

			//댓글 수정
			function commentUpdateProc(commentNo) {
				var updateContent = $('[name=contents_' + commentNo + ']')
						.val();

				$.ajax({
					url : 'comment/update',
					type : 'post',
					data : {
						'contents' : updateContent,
						'commentNo' : commentNo
					},
					success : function(data) {
						if (data == 1)
							commentList(boardNo); //댓글 수정후 목록 출력 
					}
				});
			}

			//댓글 삭제 
			function commentDelete(commentNo) {
				$.ajax({
					url : 'comment/delete/' + commentNo,
					type : 'post',
					success : function(data) {
						if (data == 1)
							commentList(boardNo); //댓글 삭제후 목록 출력 
					}
				});
			}

			$(document).ready(function() {
				commentList(); //페이지 로딩시 댓글 목록 출력 
			});
		</script>

</body>

</html>