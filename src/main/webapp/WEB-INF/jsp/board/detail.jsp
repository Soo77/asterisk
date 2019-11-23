<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
  <style>
    #boardButton {
      text-align: right;
    }
    
    #insertBoardPhotos {
      display: none;
    }
    
    #btnSave {
      display: none;
    }
    
    #btnCancel {
      display: none;
    }
    
    #btnCommentAdd {
      width: 100%;
      height: 100%;
      margin: 0px;
    }
    
    .form-control{
      border-radius: 5px;
    }
    
    .commentUpdateAndDelete {
      text-align: right;
    }
    
    .photo2 {
      height: 150px;
      width: 150px;
      margin: 2px;
      object-fit: cover;
    }
    
    .filebox label {
      display: inline-block;
      padding: .5em .75em;
      color: #ffffff;
      font-size: inherit;
      line-height: normal;
      vertical-align: middle;
      background-color: #9c27b0;
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

    .cmt {
      padding: 20px;
    }
    
    .comment-img {
     text-align: center;
    }
    
    #my-comment-img {
      width: 30px;
      height: 30px;
      object-fit: cover;
    }
    
    .complete {
      text-align: right;
    }
    
    .commentUpdate {
      background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0) 2px),
        linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
      border: 0.5px solid #d2d2d2;
      border-radius: .25rem;
    }
    
    #commentContents {
      padding: 10px;
      border-radius: 5px;
    }

    @media (min-width: 576px) {
      #my-comment-img {
        width: 50px;
        height: 50px;
      }
    }

    @media (min-width: 768px) {
      #my-comment-img {
        width: 70px;
        height: 70px;
      }
    }

    @media (min-width: 992px) {
      #my-comment-img {
        width: 100px;
        height: 100px;
      }
    }

    @media (min-width: 1200px) {
      #my-comment-img {
        width: 125px;
        height: 125px;
      }
    }

    #wrap {
      width: 100%;
      height: 100%;
      position: relative;
      display: inline-block;
    }
    
    #wrap textarea {
      width: 100%;
      height: 100%;
      resize: none;
    }
    
    #wrap span {
      position: absolute;
      bottom: 20px;
      right: 10px;
    }
    
    #counter {
      background: #E3C4FF;
      border-radius: 0.5em;
      padding: 0 .5em 0 .5em;
      font-size: 0.75em;
    }
    
    .my-images {
      max-width: 16.3rem;

    }

    .my-teacher-images {
      width: 16.3rem;
      height: 16.3rem;
      object-fit: cover;
    }

    @media (min-width: 576px) {
      .my-images {
        max-width: 28rem;
      }

      .my-teacher-images {
        width: 28rem;
        height: 28rem;
        object-fit: cover;
      }
    }

    /* Medium devices (tablets, 768px and up) */
    @media (min-width: 768px) {
      .my-images {
        max-width: 18.2rem;
      }

      .my-teacher-images {
        width: 18.2rem;
        height: 18.2rem;
        object-fit: cover;
      }
    }

    /* Large devices (desktops, 992px and up) */
    @media (min-width: 992px) {
      .my-images {
        max-width: 25rem;
      }

      .my-teacher-images {
        width: 25rem;
        height: 25rem;
        object-fit: cover;
      }
    }

    /* Extra large devices (large desktops, 1200px and up) */
    @media (min-width: 1200px) {
      .my-images {
        max-width: 15rem;
      }

      .my-teacher-images {
        width: 15rem;
        height: 15rem;
        object-fit: cover;
      }
    }
    
  </style>
</head>

<div class="page-header header-filter" data-parallax="true"
  style="background-image: url('assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <c:if test="${board.boardTypeNo == 1}">
            <h1>공부상담</h1>
          </c:if>
          <c:if test="${board.boardTypeNo == 2}">
            <h1>입시상담</h1>
          </c:if>
          <c:if test="${board.boardTypeNo == 3}">
            <h1>문제풀이</h1>
          </c:if>
          <c:if test="${board.boardTypeNo == 4}">
            <h1>공지사항</h1>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container p-3">
    <form id="form1" name="frm1" action='update' method='post' enctype='multipart/form-data'>
      <input type="hidden" name="boardTypeNo"
        value="${board.boardTypeNo}"> <input type="hidden"
        name="boardNo" value="${board.boardNo}">

      <div class="row">
        
        <div class="col">
          <div class="form-group">
            <label for="inputTitle">제목</label>
            <input type="text" class="form-control pl-3" id="inputTitle" name="title" value="${board.title}" readonly>
          </div>
        </div>
      </div>

      <div class="row">
        
        <div class="col">
          <div class="form-group">
            <label for="id">작성자</label>
            <input type="text" class="form-control pl-3" id="id" value="${board.memberId}" readonly>
          </div>
        </div>

        <div class="col">
          <div class="form-group">
            <label for="createdDate">작성일</label>
            <input type="text" class="form-control pl-3" id="createdDate" name="createdDate" value="${board.createdDate}" readonly>
          </div>
        </div>

        <div class="col">
          <div class="form-group">
            <label for="viewCount">조회수</label>
            <input type="text" class="form-control pl-3" id="viewCount" name="viewCount" value="${board.viewCount}" readonly>
          </div>
        </div>
        
      </div>
      
      <div class="row">
        <div class="col-12">
          <textarea id="inputContents" class="form-control pl-3"
            name="contents" rows="30" style="resize: none;" readonly>${board.contents}</textarea>
        </div>
      </div>
  
      <div class="row">
        <div class="col">
          <label for="boardFile">첨부파일</label>
          <div class="boardFile" id="boardFile">
            <c:forEach items="${board.files}" var="file">
              <img src='/upload/board/${file.fileName}' class='photo2'
                onerror="this.style.display='none'" alt='' style="cursor: pointer;"
                 onclick="openLayer('/upload/board/${file.fileName}','layerPop', event)" >
            </c:forEach>
          </div>
        </div>
      </div>
      
      <div id="layerPop" style="position:absolute; display:none; border:3px solid #ccc; z-index: 1;"><!-- 오픈레이어 테두리 -->
        <img style="border:none; cursor: pointer;" id="image" src="" onclick="closeLayer('layerPop')"> <!--큰 이미지 오픈-->
      </div>

       <div id="insertBoardPhotos">
        <hr>
        <div class="row">
          <div class="col">
            <div class="filebox">
              <input class="upload-name" disabled="disabled"> <label
                for="gallery-photo-add">파일선택</label> <input type="file"
                multiple="multiple" id="gallery-photo-add"
                name="fileName">
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <div class="gallery"></div>
          </div>
        </div>
      </div>

    </form>
    
    <hr>
    
    <div class="form-group row" id="boardButton">
      <div class="col">
        <c:if test="${board.memberNo == loginUser.memberNo}">
          <button id="btnUpdate" type="button" class="btn btn-primary">수정</button>
          <button id="btnSave" type="button" class="btn btn-primary">수정완료</button>
          <button id="btnCancel" type="button"
            class="btn btn-danger my-view-group">수정취소</button>
        </c:if>
        <c:if
          test="${board.memberNo == loginUser.memberNo or loginUser.memberTypeNo == 4}">
          <button id="btnDelete" type="button"
            class="btn btn-danger my-view-group">삭제</button>
        </c:if>
        <button id="btnList" type="button" class="btn btn-primary"
          onclick="location='list?boardTypeNo=${board.boardTypeNo}'">목록</button>
      </div>
    </div>
    
    <hr>
    
     <c:if test="${board.boardTypeNo != 4}">
      <div class="cmt">
        <div class="container">
          <label for="commentContents">댓글</label>
          <form name="commentInsertForm">
            <input type="hidden" name="boardNo" value="${board.boardNo}" />
            <div class="row">
              <div class="col-2 p-1 comment-img">
                <img src="/upload/join/${loginUser.profilePhoto}"
                  onError="javascript:src='/upload/join/default.png'"
                  alt="" class="img-raised rounded-circle img-fluid my-comment-img" id="my-comment-img">
              </div>
              <div class="col-9 p-1" id="wrap">
                <textarea id="commentContents" name="commentContents" rows="5"
                  maxlength="300" placeholder="댓글을 입력하세요."></textarea>
                <span id="counter">0/300</span>
              </div>
              <div class="col-1 p-1" id="commentAdd">
                <button class="btn btn-primary btn-sm" type="button"
                  name="commentInsertBtn" id="btnCommentAdd">등록</button>
              </div>
            </div>
          </form>
        </div>

        <div class="container">
          <div class="commentList"></div>
        </div>
      </div>
    </c:if>

  </div>
</div>

<script>
  // 게시글 수정
  var UpdateButton = document.querySelector('#btnUpdate');
  UpdateButton.addEventListener('click', function() {
    UpdateButton.style.display = 'none';
    if (${board.boardTypeNo != 4}) {
    	document.querySelector('.cmt').style.display = 'none';
    }
    document.querySelector('#btnDelete').style.display = 'none';
    document.querySelector('#btnList').style.display = 'none';
    document.querySelector('#btnSave').style.display = 'inline';
    document.querySelector('#btnCancel').style.display = 'inline';
    document.querySelector('#inputTitle').readOnly = false;
    document.querySelector('#inputContents').readOnly = false;
    document.querySelector('#inputContents').style =
      'background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0) 2px),'
      +'linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);'
      +'border: 0.5px solid #d2d2d2; border-radius: .25rem;';
    var boardPhotos = document.querySelector('#insertBoardPhotos');
    boardPhotos.style.display = 'inline';
  });
</script>

<script>
  // 게시글 수정 취소
  var cancelButton = document.querySelector('#btnCancel');
  cancelButton.addEventListener('click', function() {
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
</script>

<script>
  // 게시글 수정 완료
  var saveButton = document.querySelector('#btnSave');
  saveButton.addEventListener('click', function() {
    var form = document.frm1;
    
    var title = $("#inputTitle").val().replace(/(\s*)/g, "");
    var contents = $("#inputContents").val().replace(/(\s*)/g, "");
    
    if (title.length == 0) {
      swal("제목을 입력하세요.");
    } else if (contents.length == 0) {
      swal("내용을 입력하세요.");
    } else {
      swal({
        title: "수정",
        text: "저장하시겠습니까?",
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
</script>

<script>
  // 게시글 삭제
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
	//레이어 팝업 열기
	var cnt = 0;
	function openLayer(img, IdName, event){
	  if(cnt==0){
		cnt++;
  	document.getElementById("image").src = img;
		var pop = document.getElementById(IdName);
		pop.style.display = "block";
		pop.style.top = event.clientX + "px";
		pop.style.left = event.clientY + "px";
	  }
	}
	
	//레이어 팝업 닫기
	function closeLayer(IdName){
		var pop = document.getElementById(IdName);
		pop.style.display = "none";
		cnt=0;
	}	
</script>

<script>
  // 파일 업로드
  $(function() {
    var imagesPreview = function(input, placeToInsertImagePreview) {
      if (input.files) {
        var filesAmount = input.files.length;
        for (i = 0; i < filesAmount; i++) {
          var reader = new FileReader();
          reader.onload = function(event) {
            $($.parseHTML('<img style="height:150px; width:150px; margin:2px; object-fit: cover;">'))
                .attr('src', event.target.result)
                .appendTo(placeToInsertImagePreview);
          }
          reader.readAsDataURL(input.files[i]);
        }
      }
    };
  
    $('#gallery-photo-add').on('change', function() {
    	$(".gallery").empty();
      imagesPreview(this, 'div.gallery');
      $('.upload-name').val('파일' + this.files.length + '개');
    });
  });

</script>


<script>
      var boardNo = '${board.boardNo}';

      // 댓글 등록 버튼 클릭시 
      $('[name=commentInsertBtn]').click(function() {
    	  var commentContents = $("#commentContents").val().replace(/(\s*)/g, "");
    	  
    	  if (commentContents.length == 0) {
    		  swal("댓글을 입력하세요.");
    	  } else {
    		  var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    	    commentInsert(insertData); //Insert 함수호출(아래)
    	  }
      });
      
      // 댓글 글자수 제한
      $(function() {
            $('#commentContents').keyup(function (e){
                var commentContents = $(this).val();
                $(this).height(((commentContents.split('\n').length + 1) * 1.5) + 'em');
                $('#counter').html(commentContents.length + '/300');
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
                        a += '<div class="commentArea" style="border-bottom:1px solid darkgray; padding:10px;">';
                        a += '<div class="row">';
                        a += '<div class="col-1">';
                        if (value.profilePhoto == null) {
                            a += '<img src="/upload/join/default.png"';
                            a += ' alt="" class="img-raised rounded-circle img-fluid">';
                        } else {
                          	a += '<img src="/upload/join/' + value.profilePhoto+'"';
                            a += ' class="img-raised rounded-circle img-fluid">';
                        }
                        a += '</div>';
                        a += '<div class="col-11">'
                        a += '<div class="commentInfo'+value.commentNo+'" style="display: inline-block; margin-right: 10px; font-weight: bold;">'
                            + value.memberId + '</div>'
                        a += '<div class="createdDate'+value.commentNo+'" style="display: inline-block; font-size: 80%">' + value.createdDate + '</div>';
                        a += '<div class="commentContents'+value.commentNo+'" style="word-break:break-all;">'
                            + value.commentContents + '</div>'
                        if (value.memberNo == ${loginUser.memberNo}){
                        	  a += '<div class="commentUpdateAndDelete" id="commentUpdateAndDelete' + value.commentNo + '">'
                            a += '<button class="btn btn-outline-primary btn-round btn-sm" id="commentUpdate" type="button" onclick="commentUpdate('
                                + value.commentNo
                                + ',\''
                                + value.commentContents
                                + '\');"> 수정 </button>'
                            a += '<button class="btn btn-outline-danger btn-round btn-sm" id="commentDelete" type="button" onclick="commentDelete('
                                + value.commentNo
                                + ');"> 삭제 </button>'
                            a += '</div>'
                          }
                        a += '</div>'
                      	  a += '</div>'
                      		  a += '</div>'
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
              $('[name=commentContents]').val('');
            }
          }
        });
      }
      
       //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
      function commentUpdate(commentNo, commentContents) {
    	  document.querySelector('#commentUpdateAndDelete'+commentNo).style.display = 'none';
        var a = '';
        a += '<div class="row">';
        a += '<div class="col">';
        a += '<textarea class="form-control commentUpdate" name="commentContents_'+commentNo+'" rows="3" maxlength="300">' + commentContents + '</textarea>';
        a += '</div></div>';
        a += '<div class="row">';
        a += '<div class="col complete"> <button class="btn btn-outline-success btn-round btn-sm" type="button" onclick="commentUpdateProc('
            + commentNo + ');">수정완료</button>';
        a += '</div></div>';

        $('.commentContents' + commentNo).html(a);

      } 
      
      //댓글 수정
      function commentUpdateProc(commentNo) {
    	  var updateContent = $('[name=commentContents_' + commentNo + ']')
          .val().replace(/(\s*)/g, "");
    	  
    	  if (updateContent.length == 0) {
    		  swal("댓글을 입력하세요.");
    	  } else {
    		  $.ajax({
    	          url : 'comment/update',
    	          type : 'post',
    	          data : {
    	            'commentContents' : updateContent,
    	            'commentNo' : commentNo
    	          },
    	          success : function(data) {
    	            if (data == 1)
    	              commentList(boardNo); //댓글 수정후 목록 출력 
    	          }
    	        });
    	  }
    	  
/*         var updateContent = $('[name=commentContents_' + commentNo + ']')
            .val();

        $.ajax({
          url : 'comment/update',
          type : 'post',
          data : {
            'commentContents' : updateContent,
            'commentNo' : commentNo
          },
          success : function(data) {
            if (data == 1)
              commentList(boardNo); //댓글 수정후 목록 출력 
          }
        }); */
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
