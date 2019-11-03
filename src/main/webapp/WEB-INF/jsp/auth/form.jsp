<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> -->

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>엄과외</title>

  <!-- Bootstrap core CSS -->
  <style>
    .container {
      padding: 0;
    }

    .row {
      margin: 0;
    }

    .card-login {
      max-width: 25rem;
    }
  </style>

  <script src="https://kit.fontawesome.com/c5804f7418.js" crossorigin="anonymous"></script>
</head>

<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light bg-white static-top">
    <div class="container">
      <a class="navbar-brand" href="index.html"><img src="/landing_images/eomtutor.png" alt="main brand"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">로그인
              <span class="sr-only">(current)</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container">
    <form action='login' method='post' class="form-signin">
      <div class="row" style="width:1200px;height:650px;">
        <div class="card card-login mx-auto my-auto" style="width: 20rem;">
          <div class="card-header text-center">로그인</div>
          <div class="card-body">
            <form>
              <div class="form-group">
                <div class="form-label-group">
                  <input type="text" id="id" name="id" class="form-control" placeholder="ID" required autofocus>
                </div>
              </div>
              <div class="form-group">
                <div class="form-label-group">
                  <input type='password' name='pw' class="form-control" placeholder="암호" required>
                </div>
              </div>
              <div class="form-group">
                <div class="checkbox form-check-inline">
                  <label>
                    <input type="checkbox" id="idmemory" value="아이디 기억">
                    아이디 기억
                  </label>
                </div>
              </div>
              <a href="/app/join/form" style="text-decoration: none;"><button type="button"
                  class="btn btn-block text-white mb-2" style="background-color: #1abc9c">회원가입</button></a>
              <button class="btn btn-block text-white" style="background-color: #1abc9c">로그인</button>
              <a class="btn btn-block text-white" href="index.html" style="background-color: #1abc9c">ID/PassWord 찾기</a>
            </form>
          </div>
        </div>
      </div>
  </div>
  </form>

  <!-- Footer -->
  <div class="container">
    <div class="row bg-dark text-white">
      <div class="col-3 py-3">
        <a class="btn btn-dark d-block text-left" href="#" role="button" style="font-size:12px">회사소개</a>
        <a class="btn btn-dark d-block text-left" href="#" role="button" style="font-size:12px">이용약관</a>
        <a class="btn btn-dark d-block text-left" href="#" role="button" style="font-size:12px">개인정보 취급방침</a>
      </div>
      <div class="col-1"></div>
      <div class="col-4">
        <div class="row-3">
          <p> </p>
        </div>
        <div class="row-3 mx-auto d-block text-center">
          <i class="fab fa-facebook-f fa-1.5x p-2" style="color: #1abc9c"></i>
          <i class="fab fa-twitter fa-1.5x p-2" style="color: #1abc9c"></i>
          <i class="fab fa-youtube fa-1.5x p-2" style="color: #1abc9c"></i>
          <i class="fab fa-blogger-b fa-1.5x p-2" style="color: #1abc9c"></i>
          <i class="fab fa-line fa-1.5x p-2" style="color: #1abc9c"></i>
        </div>
        <div class="row-3 text-center">
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-2 mw-100">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                aria_label="Search" aria-describedby="basic-addon1">
              <div class="input-group-append">
                <button class="btn btn-light" type="button"><i class="fas fa-search"></i></button>
              </div>
            </div>
          </form>
        </div>
        <div class="row-3">
          <p class="m-0 text-center text-white" style="font-size:10px">Copyright &copy; Your Website 2019</p>
        </div>
      </div>
      <div class="col-1"></div>
      <div class="col-3 py-3 d-none d-sm-block">
        <p style="font-size:12px">
          엄과외(주)</br>
          서울특별시 서초구 서초동 서초대로 74길 33</br>
          TEL: 02-123-4567 / FAX:02-765-4321</br>
          EMAIL: support@eomcs.co.kr</br>
          대표이사: 비트비트</br>
          사업자등록번호: 110-11-123456</br>
        </p>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="/node_modules/jquery/dist/jquery.min.js"></script>


  <!--   아이디 기억 -->
  <script>

    $(document).ready(function () {
      var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
      var eq = document.getElementById("id");
      eq.value = userInputId;

      if (document.getElementById("id").val != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
        // 아이디 저장하기 체크되어있을 시,
        $("#idmemory").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
      }

      document.getElementById("idmemory").onchange = function () { // 체크박스에 변화가 있다면,
        if ($("#idmemory").is(":checked")) { // ID 저장하기 체크했을 때,
          var userInputId = document.getElementById("id").val;
          console.log(document.getElementById("id").val);
          setCookie("userInputId", userInputId, 5);
        } else { // ID 저장하기 체크 해제 시,
          deleteCookie("userInputId");
        }
      };

      // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
      $("input[name='id']").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
        if ($("#idmemory").is(":checked")) { // ID 저장하기를 체크한 상태라면,
          var userInputId = $("input[name='id']").val();
          setCookie("userInputId", userInputId, 5); // 7일 동안 쿠키 보관
        }
      });

    });

    function setCookie(cookieName, value, exdays) {
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
      var expireDate = new Date();
      expireDate.setDate(expireDate.getDate() - 1);
      document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
      cookieName = cookieName + '=';
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = '';
      if (start != -1) {
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1) end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
    }

  </script>
</body>

</html>