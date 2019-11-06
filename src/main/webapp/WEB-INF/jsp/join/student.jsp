<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
  <style>
    /* .container {
      padding: 0;
    }

    .row {
      margin: 0;
    } */

    a {
      color: #ffffff;
    }
  </style>
</head>

<div class="container" style="height:650px; overflow-y: scroll;">

  <div class="row">
    <div class="col-1"></div>
    <div class="col-10">
      <h4><b>회원가입</b></h4>
      <hr>
      <div class="row">
        <div class="col-3">
          <div class="form-group">
            <input type="image" class="form-control" id="photo" src="/images/photo.png"
              style="width:150px; height:150px;">
            <button type="submit" class="btn btn-block text-white" style="width: 150px; background-color: #1abc9c;">파일첨부</button>
          </div>
        </div>
        <div class="col-8">
          <form class="form-group row">
            <label for="user-id" class="col-4 col-form-label">아이디</label>
            <div class="col-8">
              <input class="form-control" type="text" value="ID" id="inputId">
            </div>
          </form>
          <form class="form-group row">
            <label for="password" class="col-4 col-form-label">비밀번호</label>
            <div class="col-8">
              <input class="form-control" type="text" value="Password" id="inputPw">
              <label for="message" style="font-size:8px">8~20자리의 영문, 숫자 조합</label>
            </div>
          </form>
          <form class="form-group row">
            <label for="pw-confirm" class="col-4 col-form-label">비밀번호 확인</label>
            <div class="col-8">
              <input class="form-control" type="text" value="PasswordConfirm" id="inputPwConfirm">
            </div>
          </form>
          <form class="form-group row">
            <label for="user-name" class="col-4 col-form-label">이름</label>
            <div class="col-8">
              <input class="form-control" type="text" value="Name" id="inputName">
            </div>
          </form>
          <form class="form-group row">
            <label for="user-gender" class="col-4 col-form-label">성별</label>
            <div class="col-8" style="padding-top:5px; padding-bottom:5px;">
              <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
                <label class="custom-control-label" for="customRadioInline1">남자</label>
              </div>
              <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
                <label class="custom-control-label" for="customRadioInline2">여자</label>
              </div>
            </div>
          </form>
          <form class="form-group row">
            <label for="user-birth" class="col-4 col-form-label">생년월일</label>
            <div class="form-inline col-8">
              <div class="col-4" style="padding:5px;">
                <select class="custom-select" id="inputYear" style="width:100%">
                  <option selected>2019년</option>
                  <option value="2018">2018년</option>
                  <option value="2017">2017년</option>
                  <option value="2016">2016년</option>
                </select>
              </div>
              <div class="col-4" style="padding:5px;">
                <select class="custom-select" id="inputMonth" style="width:100%">
                  <option selected>1월</option>
                  <option value="2">2월</option>
                  <option value="3">3월</option>
                  <option value="4">4월</option>
                </select>
              </div>
              <div class="col-4" style="padding:5px;">
                <select class="custom-select" id="inputDay" style="width:100%">
                  <option selected>1일</option>
                  <option value="2">2일</option>
                  <option value="3">3일</option>
                  <option value="4">4일</option>
                </select>
              </div>
            </div>
          </form>
          <form class="form-group row">
            <label for="email" class="col-4 col-form-label">이메일</label>
            <div class="col-8">
              <input class="form-control" type="text" value="Email" id="inputEmail">
            </div>
          </form>
          <form class="form-group row">
            <label for="phone" class="col-4 col-form-label">휴대전화</label>
            <div class="form-inline col-8">
              <div class="col-4" style="padding:5px;">
                <input class="form-control" type="text" value="010" id="phone-number1" style="width:100%">
              </div>
              <div class="col-4" style="padding:5px;">
                <input class="form-control" type="text" value="0000" id="phone-number2" style="width:100%">
              </div>
              <div class="col-4" style="padding:5px;">
                <input class="form-control" type="text" value="0000" id="phone-number3" style="width:100%">
              </div>
            </div>
          </form>
          <form class="form-group row">
            <label for="address1" class="col-4 col-form-label">주소</label>
            <div class="col-8">
              <input class="form-control" type="text" value="Address1" id="inputaddr1">
            </div>
          </form>
          <form class="form-group row">
            <label for="address2" class="col-4 col-form-label">상세주소</label>
            <div class="col-8">
              <input class="form-control" type="text" value="Address2" id="inputaddr2">
            </div>
          </form>
          <form class="form-group row">
            <div class="col-8"> </div>
            <div class="col-4">
              <a class="btn btn-block text-white" href="#" style="width:100%; background-color: #1abc9c">주소찾기</a>
            </div>
          </form>
          <form class="form-group row">
            <label for="class" class="col-4 col-form-label">원하는 과목</label>
            <div class="col-8">
              <select class="custom-select" id="inputClass" style="width:100%">
                <option selected>국어</option>
                <option value="English">영어</option>
                <option value="Math">수학</option>
                <option value="Science">과학</option>
              </select>
            </div>
          </form>
          <form class="form-group row">
            <label for="address1" class="col-4 col-form-label">과외 가능 요일</label>
            <div class="col-8">
            </div>
          </form>
          <form class="form-group row">
            <label for="address1" class="col-1 col-form-label"></label>
            <div class="col-11">
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="" id="checkbox1" value="option1">
                  월
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="" id="checkbox2" value="option2">
                  화
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="" id="checkbox3" value="option3">
                  수
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="" id="checkbox4" value="option4">
                  목
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="" id="checkbox5" value="option5">
                  금
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="" id="checkbox6" value="option6">
                  토
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="" id="checkbox7" value="option7">
                  일
                </label>
              </div>
            </div>
          </form>
          <form class="form-group row">
            <label for="address1" class="col-4 col-form-label">과외 가능 시간</label>
            <div class="form-inline col-8">
              <div class="col-5">
                <select class="custom-select" id="inputBeginTime" style="width:100%">
                  <option selected>00:00</option>
                  <option value="1">01:00</option>
                  <option value="2">02:00</option>
                  <option value="3">03:00</option>
                </select>
              </div>
              <div class="col-2">~</div>
              <div class="col-5">
                <select class="custom-select" id="inputEndTime" style="width:100%">
                  <option selected>00:00</option>
                  <option value="1">01:00</option>
                  <option value="2">02:00</option>
                  <option value="3">03:00</option>
                </select>
              </div>
            </div>
          </form>
          <form class="form-group row">
            <label for="forteacher" class="col-6 col-form-label">선생님에게 바라는 것</label>
            <div class="col-6"></div>
            <input type="text" class="form-control " id="forteacher" style="width:500px; height:300px;">
          </form>
          <p></p>
          <form class="form-group row">
            <div class="col-4"> </div>
            <div class="col-4">
              <a class="btn btn-block text-white justify-content-center" href="#"
                style="width:200px; background-color: #1abc9c">회원가입하기</a>
            </div>
            <div class="col-4"> </div>
          </form>
          <p></p>
        </div>
        <div class="col-1"></div>
      </div>
    </div>
    <div class="col-1"></div>
    <p></p>
  </div>
</div>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>

<!-- 	생년월일 -->
<script>
  $(document).ready(function () {
    setDateBox();
  });

  // select box 연도 , 월 표시
  function setDateBox() {
    var dt = new Date();
    var year = "";
    var com_year = dt.getFullYear();
    // 발행 뿌려주기
    $("#YEAR").append("<option value=''>년도</option>");
    // 올해 기준으로 -1년부터 +5년을 보여준다.
    for (var y = (com_year - 118); y <= (com_year); y++) {
      $("#YEAR").append("<option value='" + y + "'>" + y + " 년" + "</option>");
    }
    // 월 뿌려주기(1월부터 12월)
    var month;
    $("#MONTH").append("<option value=''>월</option>");
    for (var i = 1; i <= 12; i++) {
      $("#MONTH").append("<option value='" + i + "'>" + i + " 월" + "</option>");
    }

    var day;
    $("#DAY").append("<option value=''>일</option>");
    for (var i = 1; i <= 31; i++) {
      $("#DAY").append("<option value='" + i + "'>" + i + " 일" + "</option>");
    }
  }
</script>

<!-- 취소 -->
<script>
  var cbtn = document.querySelector("#cancelbtn");
  cbtn.addEventListener("click", function () {
    location.href = "../board/list";
  });

</script>

<!-- 다음 우편 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sido').value = data.sido;
        document.getElementById('sigungu').value = data.sigungu;
      }
    }).open();
  }
</script>

<!-- 프로필 사진 -->
<script>
  $("#filePath").change(function () {
    var input = document.getElementById("filePath");
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#view_file').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
    var dp = document.getElementById("view_file");
    dp.style.display = "block";

  });
</script>

<!-- 아이디 유효성 검사(1 = 중복 / 0 != 중복) -->
<script>
  $("#id").blur(function () {
    var idpwtest = /^[a-zA-Z0-9]{4,12}$/
    var id = $('#id').val();
    if (id == "") {
      $('#id_check').text('아이디를 입력해주세요 :)');
      $('#id_check').css('color', 'red');
      $("#submit").attr("disabled", true);
    } else if (!idpwtest.test(id)) {
      $("#id_check").text("아이디는 4~12자의 영문과 숫자로만 입력");
      $("#id_check").css("color", "red");
      $("#id").css("color", "red");
      $("#submit").attr("disabled", true);
    } else {
      $.ajax({
        url: 'idCheck',
        type: 'get',
        data: "id=" + id,
        success: function (result) {
          if (result == 1) {
            $("#id_check").text("사용중인 아이디입니당");
            $("#id_check").css("color", "red");
            $("#id").css("color", "red");
            $("#submit").attr("disabled", true);
          } else {
            $("#id_check").text("사용 가능한 아이디입니당");
            $("#id_check").css("color", "green");
            $("#id").css("color", "green");
            $("#submit").attr("disabled", false);
          }
        }, error: function () {
          console.log("실패");
        }
      });
    }
  });
</script>

<!-- 비밀번호 유효성 -->
<script>
  $("#pw").blur(function () {
    var idpwtest = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/
    var pw = document.getElementById("pw").value;
    var okpw = document.getElementById("okpw").value;

    if (!idpwtest.test(pw)) {
      $("#pw_check").text("비밀번호는 4~12자의 영문과 숫자를 섞어");
      $("#pw_check").css("color", "red");
      $("#okpw").css("color", "red");
      $("#pw").css("color", "red");
      $("#submit").attr("disabled", true);
    } else if (okpw == "") {
      $('#pw_check').text('비밀번호 확인을 해주세요 :)');
      $('#pw_check').css('color', 'red');
      $("#submit").attr("disabled", true);
    } else {
      if (pw != okpw) {
        $("#pw_check").text("비밀번호가 틀립니다");
        $("#pw_check").css("color", "red");
        $("#okpw").css("color", "red");
        $("#pw").css("color", "red");
        $("#submit").attr("disabled", true);
      } else {
        $("#pw_check").text("비밀번호가 일치합니당");
        $("#pw_check").css("color", "green");
        $("#okpw").css("color", "green");
        $("#pw").css("color", "green");
        $("#submit").attr("disabled", false);
      }
    }
  });
</script>

<!--     비밀번호 확인 -->
<script>
  $("#okpw").blur(function () {
    var idpwtest = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/
    var pw = document.getElementById("pw").value;
    var okpw = document.getElementById("okpw").value;

    if (!idpwtest.test(okpw)) {
      $("#pw_check").text("비밀번호는 4~12자의 영문과 숫자를 섞어");
      $("#pw_check").css("color", "red");
      $("#okpw").css("color", "red");
      $("#pw").css("color", "red");
      $("#submit").attr("disabled", true);
    } else if (pw == "") {
      $('#pw_check').text('비밀번호를 입력해주세요 :)');
      $('#pw_check').css('color', 'red');
      $("#submit").attr("disabled", true);
    } else {
      if (pw != okpw) {
        $("#pw_check").text("비밀번호가 틀립니다");
        $("#pw_check").css("color", "red");
        $("#okpw").css("color", "red");
        $("#pw").css("color", "red");
        $("#submit").attr("disabled", true);
      } else {
        $("#pw_check").text("비밀번호가 일치합니당");
        $("#pw_check").css("color", "green");
        $("#okpw").css("color", "green");
        $("#pw").css("color", "green");
        $("#submit").attr("disabled", false);
      }
    }
  });
</script>

<!--   이메일 확인 -->
<script>
  $("#mailselect").change(function () {
    var dp = document.getElementById("mail");
    dp.style.display = "block";

    var email = $('#email').val();
    var mail = $('#mail').val();
    var addmail = email + '@' + mail;
    var mailtest = /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

    if (mail == "") {
      dp.readOnly = false;
      $('#email_check').text('이메일을 입력해주세요 :)');
      $('#email_check').css('color', 'red');
      $("#submit").attr("disabled", true);
    } else if (!mailtest.test(mail)) {
      dp.readOnly = false;
      $("#email_check").text("이메일 형식이 맞지 않습니다");
      $("#email_check").css("color", "red");
      $("#email").css("color", "red");
      $("#mail").css("color", "red");
      $("#submit").attr("disabled", true);
    } else {
      dp.readOnly = true;
      $.ajax({
        url: 'emailCheck',
        type: 'get',
        data: "email=" + addmail,
        success: function (result) {
          if (result == 1) {
            dp.readOnly = false;
            $("#email_check").text("사용중인 이메일입니당");
            $("#email_check").css("color", "red");
            $("#email").css("color", "red");
            $("#mail").css("color", "red");
            $("#submit").attr("disabled", true);
          } else {
            if (email) {
              $("#email_check").text("사용 가능한 이메일입니당");
              $("#email_check").css("color", "green");
              $("#email").css("color", "green");
              $("#mail").css("color", "green");
              $("#submit").attr("disabled", false);
            } else if (email == "") {
              dp.readOnly = false;
              $('#email_check').text('이메일을 입력해주세요 :)');
              $('#email_check').css('color', 'red');
              $("#submit").attr("disabled", true);
            }
          }
        }, error: function () {
          console.log("실패");
        }
      });
    }
  });
</script>

<!--     메일 선택 -->
<script>
  $("#mail2").change(function () {
    document.getElementById("mail").value = document.getElementById("mail2").value;
  });
</script>

<!--   휴대전화 중복 -->
<script>
  $("#tel").blur(function () {
    var tel = $('#tel').val();
    var teltest = /^[0-9]{11}$/;

    if (!teltest.test(tel)) {
      $("#tel_check").text("11개의 숫자만 입력해주세요");
      $("#tel_check").css("color", "red");
      $("#tel").css("color", "red");
      $("#submit").attr("disabled", true);
    } else if (tel == "") {
      $("#tel_check").text("번호를 입력해주세요");
      $("#tel_check").css("color", "red");
      $("#tel").css("color", "red");
      $("#submit").attr("disabled", true);
    } else {
      $.ajax({
        url: 'telCheck',
        type: 'get',
        data: "tel=" + tel,
        success: function (result) {
          if (result == 1) {
            $("#tel_check").text("사용중인 번호입니당");
            $("#tel_check").css("color", "red");
            $("#tel").css("color", "red");
            $("#submit").attr("disabled", true);
          } else {
            if (id) {
              $("#tel_check").text("가입 가능한 번호입니당");
              $("#tel_check").css("color", "green");
              $("#tel").css("color", "green");
              $("#submit").attr("disabled", false);
            } else if (id == "") {
              $('#tel_check').text('번호 입력해주세요 :)');
              $('#tel_check').css('color', 'red');
              $("#submit").attr("disabled", true);
            }
          }
        }, error: function () {
          console.log("실패");
        }
      });
    }
  });
</script>

<script type="text/javascript">

  // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
  function checkValue() {
    var va = document.querySelectorAll(".redch");
    for (var i = 0; i < va.length; i++) {
      if (va[i].style.color == "red") {
        va[i].focus();
        return false;
      }
    }

    if (!document.userInfo.filePath.value) {
      alert("프로필 사진을 입력하세요.");
      return false;
    }

    if (!document.userInfo.password.value) {
      alert("비밀번호를 입력하세요.");
      return false;
    }

    if (!document.userInfo.okpw.value) {
      alert("비밀번호 확인을 입력하세요.");
      return false;
    }

    if (!document.userInfo.name.value) {
      alert("이름을 입력하세요.");
      return false;
    }

    if (!document.userInfo.email.value) {
      alert("이메일을 입력하세요.");
      return false;
    }

    if (!document.userInfo.gender.value) {
      alert("성별을 선택하세요.");
      return false;
    }

    if (isNaN(form.birthyy.value)) {
      alert("년도는 숫자만 입력가능합니다.");
      return false;
    }
  }

  // 취소 버튼 클릭시 로그인 화면으로 이동
  function goLoginForm() {
    location.href = "../board/list.jsp";
  }
</script>

<script type="text/JavaScript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<!-- <script src="/node_modules/jquery/dist/jquery.min.js"></script> -->