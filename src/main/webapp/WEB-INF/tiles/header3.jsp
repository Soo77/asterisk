<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  .my-logo {
    font-weight: bold;
  }
  
  @media (max-width: 991px) {
  #noticeHidden {
  display: none !important;
  }
  }
</style>

<nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100"
id="sectionsNav">
  <div class="container">
    <div class="navbar-translate">
      <a class="navbar-brand my-logo" href="/">
        Eom-Tutor</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="sr-only">Toggle navigation</span>
        <span class="navbar-toggler-icon"></span>
        <span class="navbar-toggler-icon"></span>
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item my-login-menu-item my-login-li" style="display: none;">
          <a class="nav-link" href="/app/auth/form">
            로그인
          </a>
        </li>
        <li class="nav-item my-loggedin-menu-item my-teacher-li" style="display: none;">
          <a class="nav-link" href="/app/member/list?memberTypeNo=3">
            선생님 찾기
          </a>
        </li>
        <li class="nav-item my-loggedin-menu-item my-student-li" style="display: none;">
          <a class="nav-link" href="/app/member/list?memberTypeNo=1">
            학생 찾기
          </a>
        </li>
        <li class="dropdown nav-item my-loggedin-menu-item my-board-li" style="display: none;">
          <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
            게시판
          </a>
          <div class="dropdown-menu dropdown-with-icons" style="overflow-y: hidden;">
            <a href="/app/board/list?boardTypeNo=4" class="dropdown-item">
              <i class="material-icons">content_paste</i> 공지사항
            </a>
            <a href="/app/board/list?boardTypeNo=1" class="dropdown-item">
              <i class="material-icons">create</i> 공부상담
            </a>
            <a href="/app/board/list?boardTypeNo=2" class="dropdown-item">
              <i class="material-icons">group</i> 입시상담
            </a>
            <a href="/app/board/list?boardTypeNo=3" class="dropdown-item">
              <i class="material-icons">inbox</i> 문제풀이
            </a>
          </div>
        </li>
        <li class="dropdown nav-item my-loggedin-menu-item my-login-user-li" style="display: none;">
          <a href="#" class="dropdown-toggle nav-link my-loggedin-user" data-toggle="dropdown"></a>
          <div class="dropdown-menu dropdown-with-icons dropdown-menu-right" style="overflow-y: hidden;">
            <a href="/app/mypage/detail" class="dropdown-item">
              <i class="material-icons">person</i> 마이페이지
            </a>
            <a href="javascript:void(0)" id="message-menu" class="dropdown-item">
              <i class="material-icons">message</i> 쪽지함<span class="notice" style="color: #333"></span>
            </a>
            <a href="/app/admin/list" class="dropdown-item admin-display" style="display: none;">
              <i class="material-icons">assignment_ind</i> 관리자메뉴
            </a>
            <a href="/app/auth/logout" class="dropdown-item">
              <i class="material-icons">power_settings_new</i> 로그아웃
            </a>
          </div>
        </li>
        <span id="noticeHidden" class="notice" style="margin-left: -10px !important; 
          color: #333"></span>
      </ul>
    </div>
  </div>
</nav>

<script>
$.ajax({
  url: "/app/message/notice",
  success: function(data) {
	  let message;
	  if(data >= 100){
		  message = "&ensp;<span class='badge badge-danger badge-counter'>"+"+99"
		  message += "</span>"
	  
	  } else if(data == 0){
	  } else {
		  message = "&ensp;<span class='badge badge-danger badge-counter'>"+data
		  message += "</span>"
	  }
    $(".notice").append(message);
  }, error: function(){
    consol.elog("실패");
  }
})
</script>

<script>
  $.ajax({
    url: '/app/loginCheck',
    type: 'get',
    success: function (result) {
      if (result.signIn == true) {
        let teacherLi = document.getElementsByClassName('my-teacher-li')[0];
        let studentLi = document.getElementsByClassName('my-student-li')[0];
        let adminDisplay = document.getElementsByClassName('admin-display')[0];
        let boardsLi = document.getElementsByClassName('my-board-li')[0];
        let loginUserLi = document.getElementsByClassName('my-login-user-li')[0];
        let loginUserId = document.getElementsByClassName('my-loggedin-user')[0];

        if (result.loginUserMemberType == 1 ||
            result.loginUserMemberType == 2 ||
            result.loginUserMemberType == 4) {
          teacherLi.style.display = 'inline-block';
        }
        if (result.loginUserMemberType == 3 ||
            result.loginUserMemberType == 4) {
          studentLi.style.display = 'inline-block';
        }
        if (result.loginUserMemberType == 4) {
          // 관리자페이지 디스플레이 전용
          adminDisplay.style.display = 'flex';
        }
        
        boardsLi.style.display = 'inline-block';
        loginUserLi.style.display = 'inline-block';
        loginUserId.innerHTML = result.loginUserId;

      } else {
        let loginLi = document.getElementsByClassName('my-login-li')[0];
        loginLi.style.display = 'inline-block';

      }
    }
  });
</script>

<script>
  $("#message-menu").on('click', function() {
    popMessage();
  });
 
  function popMessage(){
    var url = "/app/message/list";
    var option = "width = 600, height = 600, top = 100, left = 200, location = no"
    window.open(url, "쪽지목록" ,option);
  }
</script>