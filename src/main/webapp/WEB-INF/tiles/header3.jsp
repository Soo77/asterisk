<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-color-on-scroll navbar-transparent fixed-top navbar-expand-lg" color-on-scroll="100">
  <div class="container">
    <div class="navbar-translate">
      <a class="navbar-brand my-logo" href="/index.html">
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
        <li class="nav-item my-login-menu-item">
          <a class="nav-link" href="/app/auth/form">
            로그인
          </a>
        </li>
        <li class="nav-item my-loggedin-menu-item">
          <a class="nav-link" href="/app/member/list?memberTypeNo=3">
            선생님 찾기
          </a>
        </li>
        <li class="nav-item my-loggedin-menu-item">
          <a class="nav-link" href="/app/member/list?memberTypeNo=1">
            학생 찾기
          </a>
        </li>
        <li class="dropdown nav-item my-loggedin-menu-item">
          <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
            게시판
          </a>
          <div class="dropdown-menu dropdown-with-icons" style="overflow-y: hidden;">
            <a href="/app/board/list?boardTypeNo=4" class="dropdown-item">
              <i class="material-icons">layers</i> 공지사항
            </a>
            <a href="/app/board/list?boardTypeNo=1" class="dropdown-item">
              <i class="material-icons">layers</i> 공부상담
            </a>
            <a href="/app/board/list?boardTypeNo=2" class="dropdown-item">
              <i class="material-icons">layers</i> 입시상담
            </a>
            <a href="/app/board/list?boardTypeNo=3" class="dropdown-item">
              <i class="material-icons">content_paste</i> 문제풀이
            </a>
          </div>
        </li>
        <li class="dropdown nav-item my-loggedin-menu-item">
          <a href="#" class="dropdown-toggle nav-link my-loggedin-user" data-toggle="dropdown">
            홍길동
          </a>
          <div class="dropdown-menu dropdown-with-icons" style="overflow-y: hidden;">
            <a href="/app/mypage/detail" class="dropdown-item">
              <i class="material-icons">layers</i> 마이페이지
            </a>
            <a href="/app/auth/logout" class="dropdown-item">
              <i class="material-icons">content_paste</i> 로그아웃
            </a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>


<!--   Core JS Files   -->
<script src="/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script src="/assets/js/plugins/moment.min.js"></script>
<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="/assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="/assets/js/material-kit.js?v=2.0.6" type="text/javascript"></script>

<script>
  $.ajax({
    url: '/app/loginCheck',
    type: 'get',
    success: function (result) {
      if (result.signIn == true) {
        let loginMenu = document.getElementsByClassName('my-login-menu-item')[0];
        let loginUserName = document.getElementsByClassName('my-loggedin-user')[0];
        loginMenu.style.display = 'none';
        loginUserName.innerHTML = result.loginUserName;

      } else {
        let loggedinMenu = document.getElementsByClassName('my-loggedin-menu-item');
        for (let menu of loggedinMenu) {
          menu.style.display = 'none';
        }

      }
    }

  });
</script>