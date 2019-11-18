<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
  <style>
    #title {
      font-weight: bold;
    }
    #addReview {
      text-align: right;
    }
    
    #star_grade a{
      font-size: 30px;
      text-decoration: none;
      color: gray;
    }
    #star_grade a.on{
      font-size: 30px;
      color: #FFCD12;
    }
  </style>
  
</head>

<div class="page-header header-filter" data-parallax="true"
  style="background-image: url('assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>후기 작성</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container p-3">
      
      <h4 id="title">선생님에 대한 평가를 들려주세요</h4>
      <hr>
      
      <form id="form1" name="frm1" action="review" method="post">
        <input type="hidden" name="lessonNo" value="${lessonNo}">
        <div class="row">
          <div class="col">
            <textarea name="studentReview" id="studentReview" class="form-control" rows="20" placeholder="후기를 입력하세요."></textarea>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <input type="hidden" id="teacherEvaluation" name="teacherEvaluation" value="">
            <p id="star_grade">
              <a href="#">★</a>
              <a href="#">★</a>
              <a href="#">★</a>
              <a href="#">★</a>
              <a href="#">★</a>
            </p>
          </div>
          <div class="col">
            <div id="addReview">
              <button type="button" id="btnAdd" class="btn btn-primary">등록</button>
            </div>
          </div>
        </div>
      </form>
      
  </div>
</div>


<script>
$('#star_grade a').click(function(){
    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
    return false;
});
</script>

<script>
  var addButton = document.querySelector('#btnAdd');
  addButton.addEventListener('click', function() {
	  var rating = $('.on').length;
	  $("#teacherEvaluation").val(rating);
    var form = document.frm1;
      if (form.studentReview.value.length == 0) {
        swal("내용을 입력하세요.");
        form.studentReview.focus();
        return;
      } else {
        swal({
            title: "후기",
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


