<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
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

</head>
<script src="https://kit.fontawesome.com/c5804f7418.js" crossorigin="anonymous"></script>

<div class="container">
  <form action='login' method='post' class="form-signin">
    <div class="row" style="height:650px;">
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
            <a href="/app/join/registration" style="text-decoration: none;"><button type="button"
                class="btn btn-block text-white mb-2" style="background-color: #1abc9c">회원가입</button></a>
            <button class="btn btn-block text-white" style="background-color: #1abc9c">로그인</button>
            <a class="btn btn-block text-white" href="index.html" style="background-color: #1abc9c">ID/PassWord 찾기</a>
          </form>
        </div>
      </div>
    </div>
</div>
</form>

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