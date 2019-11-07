<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
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

<div class="page-header header-filter" data-parallax="true"
  style="background-image: url('assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>Your title here</h1>
          <h3 class="title text-center">Subtitle</h3>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container">
    <!-- <div class="section text-center"> -->
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

    <hr>

    <form id="form1" name="frm1" action='add' method=post
      enctype='multipart/form-data'>
      <div class="row">
        <div class="col" align="center">
          <h2
            style="background-color: #00AFA0; border-color: #00AFA0; color: #ffffff;">글쓰기</h2>
        </div>
      </div>

      <div class="row">
        <div class="col">
          <input type="text" class="form-control" id="inputTitle"
            name='title' placeholder="글 제목"> <input
            type="hidden" name="boardTypeNo" value="${boardTypeNo}">
        </div>
      </div>

      <div class="row">
        <div class="col">
          <textarea class="form-control" name='contents' rows="10"
            style="resize: none;" placeholder="내용을 입력해주세요"></textarea>
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
          <div align="right">
            <button id="btnAdd" type="button" class="btn btn-info">등록</button>
            <button id="btnCancle" type="button"
              class="btn btn-danger my-view-group" style="float: right;">취소</button>
          </div>
        </div>
      </div>

    </form>
  </div>
</div>
  
  <!-- <script src="/node_modules/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="/node_modules/jquery/dist/jquery.min.js"></script>

<script type="text/javascript">
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
          location.href = "list?boardTypeNo=" + ${boardTypeNo};
        } else {
        }
      });
    });
    
    var addButton = document.querySelector('#btnAdd');
    addButton.addEventListener('click', function() {
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
</script>
