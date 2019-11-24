<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
  <style>
    #boardAddAndCancel {
      text-align: right;
    }
    
    .photo2 {
      height: 150px;
      width: 150px;
      margin: 2px;
      object-fit: cover;
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
    
    #exampleFormControlTextarea1 {
      background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0) 2px),
        linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
      border: 0.5px solid #d2d2d2;
      border-radius: .25rem;
    }
    
  </style>
</head>

<div id="background" class="page-header header-filter" data-parallax="true">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <c:if test="${boardTypeNo == 1}">
            <h1>글쓰기</h1>
            <h3>공부상담</h3>
          </c:if>
          <c:if test="${boardTypeNo == 2}">
            <h1>글쓰기</h1>
            <h3>입시상담</h3>
          </c:if>
          <c:if test="${boardTypeNo == 3}">
            <h1>글쓰기</h1>
            <h3>문제풀이</h3>
          </c:if>
          <c:if test="${boardTypeNo == 4}">
            <h1>글쓰기</h1>
            <h3>공지사항</h3>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container p-3">
    <form id="form1" name="frm1" action='add' method='post'
      enctype='multipart/form-data'>

      <input type="hidden" name="boardTypeNo" value="${boardTypeNo}">
      
      <div class="row">
        <div class="col">
          <div class="form-group bmd-form-group">
            <label class="bmd-label-static">제목</label>
            <input type="text" class="form-control"  id="inputTitle" name='title' >
          </div>
        </div>
      </div>
    
      <div class="row">
          <div class="col">
          <div class="form-group bmd-form-group">
            <label for="exampleFormControlTextarea1">내용</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="30" style="resize: none;"></textarea>
          </div>
        </div>
      </div>

      <hr>

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

      <div class="row">
        <div class="col">
          <div id="boardAddAndCancel">
            <button id="btnAdd" type="button" class="btn btn-primary">등록</button>
            <button id="btnCancel" type="button"
              class="btn btn-danger my-view-group">취소</button>
          </div>
        </div>
      </div>

    </form>
  </div>
</div>
  
<script>
    let boardTypeNo = $('input[name=boardTypeNo]').val();
    
    if (boardTypeNo == 4) {
      document.getElementById('background').style.backgroundImage= "url('/assets/img/bg/bg19.jpg')"
    } else { 
      document.getElementById('background').style.backgroundImage= "url('/assets/img/bg/bg10.jpg')" 
    } 
</script>

<script type="text/javascript">
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
          location.href = "list?boardTypeNo=" + ${boardTypeNo};
        } else {
        }
      });
    });
    
    var addButton = document.querySelector('#btnAdd');
    addButton.addEventListener('click', function() {
      var form = document.frm1;
      
      var title = $("#inputTitle").val().replace(/(\s*)/g, "");
      var contents = $("#exampleFormControlTextarea1").val().replace(/(\s*)/g, "");
      
      if (title.length == 0) {
        swal("제목을 입력하세요.");
      } else if (contents.length == 0) {
        swal("내용을 입력하세요.");
      } else {
        swal({
          title: "글쓰기",
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
</script>

<script>
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
