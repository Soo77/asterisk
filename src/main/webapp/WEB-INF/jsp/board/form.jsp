<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 등록폼</title>

<style>
.photo1 {
  height: 120px;
}

.photo2 {
  height: 100px;
  margin: 2px;
}

.row {
  margin: 5px;
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

/* div{
border: 1px solid;
} */
</style>

</head>
<body>

  <div class="title">
    <c:if test="${boardTypeNo == 1}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">공부상담</h2>
    </c:if>
    <c:if test="${boardTypeNo == 2}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">입시상담</h2>
    </c:if>
    <c:if test="${boardTypeNo == 3}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">문제풀이</h2>
    </c:if>
    <c:if test="${boardTypeNo == 4}">
      <h1 style="display: inline">공지사항</h1>
    </c:if>
  </div>

  <form id="form1" name="frm1" action='add' method=post enctype='multipart/form-data'>
    <div class="row">
      <div class="col" align="center">
        <h2
          style="background-color: #00AFA0; border-color: #00AFA0; color: #ffffff;">글쓰기</h2>
      </div>
    </div>

    <div class="row">
      <div class="col">
        <input type="text" class="form-control" id="inputTitle"
          name='title' placeholder="글 제목"> <input type="hidden"
          name="boardTypeNo" value="${boardTypeNo}">
      </div>
    </div>

    <div class="row">
      <div class="col">
        <textarea class="form-control" name='contents' rows="10"
          style="resize: none;" placeholder="내용을 입력해주세요"></textarea>
      </div>
    </div>

    <hr>

<!--     <input type="file" multiple id="gallery-photo-add" name="fileName">
    <div class="gallery"></div> -->

<!--     <div id="fileDiv">
      <p>
        <input type="file" name="file_0" />
        <a href="#this" name="delete" class="btn">삭제하기</a>
      </p>
    </div>

    <a href="#this" id="add" class="btn">파일 추가하기</a> -->
    
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
    


    <!--     <div class="row">
      <div class="col">
        <div align="center">
          <button type="button" class="btn btn-outline-info">+</button>
        </div>
      </div>
    </div> -->

    <hr>

    <div class="row">
      <div class="col">
        <div align="right">
           <!-- <button id="btnAdd" type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">등록</button> -->
           <button id="btnAdd" type="button" class="btn btn-info" onclick="add_board()">등록</button>
           <button id="btnCancle" type="button" class="btn btn-danger my-view-group" data-toggle="modal" data-target="#cancelModal" style="float: right;">취소</button>
        </div>
      </div>
    </div>

<!--     add Modal-->
<!--  <div class="modal fade" id="addModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">글쓰기</h5>
            <button type="button" class="close" data-dismiss="modal"
              aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">등록하시겠습니까?</div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary"
              data-dismiss="modal">취소</button>
            <button id="btnSubmit" type="button" class="btn btn-primary"
              onclick="form_submit()">확인</button>
          </div>
        </div>
      </div>
    </div> -->

    <!-- cancel Modal -->
    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">취소</h5>
            <button type="button" class="close" data-dismiss="modal"
              aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">취소하시겠습니까?</div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary"
              data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary"
              onclick="location='list?boardTypeNo=${boardTypeNo}'">확인</button>
          </div>
        </div>
      </div>
    </div>

  </form> 


            
<!--     <div class="row">
      <div id="insertBoardPhotos">
        <c:forEach begin="1" end="6">
                     사진2: <input type='file' name='fileName'>
          <button type="button" class="btn btn-outline-info">-</button>
          <br>
        </c:forEach>
      </div>
    </div>  -->
    

    

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
  
  <script type="text/javascript">

/*  		$(function() {
		    // Multiple images preview in browser
		    var imagesPreview = function(input, placeToInsertImagePreview) {
		        if (input.files) {
		            var filesAmount = input.files.length;
		            for (i = 0; i < filesAmount; i++) {
		                var reader = new FileReader();
		                reader.onload = function(event) {
		                    $($.parseHTML('<img style="width:20%; height:70%; margin-top:10px;">' + "<a href=\"#\" value=\""
                                    + i
                                    + "\" onclick=\"deletePreview(this)\">"
                                    + "x" + "</a>")).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
		                }
		                reader.readAsDataURL(input.files[i]);
		            }
		        }
		    };

		    $('#gallery-photo-add').on('change', function() {
		        imagesPreview(this, 'div.gallery');
		    });
		});
		
		function deletePreview(obj) {
            $(".gallery").remove();
            resizeHeight();
        }  */
        
        
/*         var g_count =1;
        $(document).ready(function(){
            $("#list").on("click",function(e){
                e.preventDefault();
                fn_openBoardList();
            })
            $("#write").on("click",function(e){
                e.preventDefault();
                fn_writeBoard();
            })
            $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));
            })
            $("#add").on("click",function(e){
                e.preventDefault();
                fn_fileAdd();
            })
        });
         
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
            comSubmit.submit();
        }
         
        function fn_writeBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/writeBoard.do'/>");
            comSubmit.submit();
        }
        function fn_fileDelete(obj){
            obj.parent().remove();
        }
        function fn_fileAdd(){
            var str = "<p><input type='file' name='file_"+(g_count++)+"'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
            $("#fileDiv").append(str);
             
            $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));         
            })
        } */


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
			
		</script>
  
</body>
</html>