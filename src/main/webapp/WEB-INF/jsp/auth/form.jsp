<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%> -->

<head>
  <!-- <link rel='stylesheet' -->
  <!--   href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' -->
  <!--   integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' -->
  <!--   crossorigin='anonymous'> -->
  <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
    name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css"
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="/assets/css/material-kit.css?v=2.0.6" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/assets/demo/demo.css" rel="stylesheet" />
  <script type="text/JavaScript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>

<style>
  .this-center{
    text-align: center;
    padding-top: 0px !important;
  }
  .card-login .card-body {
    padding: 1.25rem;
  }
</style>
</head>

<!--     요기부터 -->
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6 ml-auto mr-auto">
          <div class="card card-login">
              <div class="card-header card-header-primary text-center">
                <h4 class="card-title">로그인</h4>
              </div>
              
					<div class="card-body">

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="material-icons">face</i>
								</span>
							</div>
							<input type='text' id='id' name='id' value=''
								class="form-control" placeholder="아이디" required autofocus>
						</div>

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="material-icons">lock_outline</i>
								</span>
							</div>
							<input type='password' id="pw" name='pw' class="form-control"
								onKeypress="if(event.keyCode==13) {loginBtn();}" placeholder="암호" required>
						</div>
						<div id="loginCheck" class="this-center"></div>

            <div class="form-check this-center">
							<label class="form-check-label"> 
								<input class="form-check-input" type="checkbox" 
								id="idmemory"	value="아이디 기억" style="margin-left: 0px !important;">아이디 기억 
								<span class="form-check-sign">
									<span class="check"></span>
								</span>
							</label>
							</div>

						<div class="this-center">
							<div class="description">
								<button id="loginBtn" class="btn btn-primary">로그인</button>
								<a href="/app/join/form">
									<button type="button" class="btn btn-primary">회원가입</button>
								</a>
							</div>
						</div>
						<div class="text-center">
						  <br>
							<a href="../auth/findid">아이디 찾기</a><br> 
							<a href="../auth/findpw">비밀번호 찾기</a>
						</div>
					</div>
            
        </div>
      </div>
    </div>
  </div>
  <!--       요기까지 -->

<!--   Core JS Files   -->
<script src="/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script src="/assets/js/plugins/moment.min.js"></script>
<!--  Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="/assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="/assets/js/material-kit.js?v=2.0.6" type="text/javascript"></script>

<!-- 로그인 확인 -->
<script>
  $("#loginBtn").click(function(){
	  loginBtn();
  });
  
  function loginBtn(){
	  var id = document.getElementById("id").value;
	  var pw = document.getElementById("pw").value;
	  
	  $.ajax({
		  url : 'loginId',
		  data : "id="+id,
		  success : function(data){
			  if(data == 0){
				  $("#loginCheck").text("가입되지 않은 아이디입니다");
			      $("#loginCheck").css("color","red");
			  } else{
				$.ajax({
				    url : 'loginPw',
				    data : "id="+id+"&pw="+pw,
				    success : function(result) {
				    	if(result == ""){
					    	$("#loginCheck").text("비밀번호가 틀렸습니다");
					    	$("#loginCheck").css("color","red");
				    	} else if(result.memberTypeNo == 1 || result.memberTypeNo == 2){
				    		location.href="../member/list?memberTypeNo=3";
				    	} else if(result.memberTypeNo == 3){
				    		location.href="../member/list?memberTypeNo=1";
				    	} else{
				    		location.href="/";
				    	}
				    },
				    error : function() {
				      console.log("실패2");
				    }
				});
			  }
		  },
		  error : function() {
		      console.log("실패1");
		  }
	  })
	}
</script>

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