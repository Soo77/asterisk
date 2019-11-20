// 수정 버튼 초기값 세팅
$("#submit").attr("disabled", true);

// 비밀번호 유효성
$("#inputPassword").blur(function () {
    var idpwtest = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/
    var inputPassword = document.getElementById("inputPassword").value;
    var inputPasswordCheck = document.getElementById("inputPasswordCheck").value;

    if (!idpwtest.test(inputPassword)) {
      $("#pw_check").text("비밀번호는 4~12자의 영문과 숫자로 이루어져야 합니다");
      $("#pw_check").css("color", "red");
      $("#inputPasswordCheck").css("color", "red");
      $("#inputPassword").css("color", "red");
      $("#submit").attr("disabled", true);
    } else if (inputPasswordCheck == "") {
      $('#pw_check').text('비밀번호 확인을 해주세요');
      $('#pw_check').css('color', 'red');
      $("#submit").attr("disabled", true);
    } else {
      if (inputPassword != inputPasswordCheck) {
        $("#pw_check").text("비밀번호가 틀립니다");
        $("#pw_check").css("color", "red");
        $("#inputPasswordCheck").css("color", "red");
        $("#inputPassword").css("color", "red");
        $("#submit").attr("disabled", true);
      } else {
        $("#pw_check").text("비밀번호가 일치합니다");
        $("#pw_check").css("color", "green");
        $("#inputPasswordCheck").css("color", "green");
        $("#inputPassword").css("color", "green");
        $("#submit").attr("disabled", false);
      }
    }
  });

// 비밀번호 확인
  $("#inputPasswordCheck").blur(function () {
    var idpwtest = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/
    var inputPassword = document.getElementById("inputPassword").value;
    var inputPasswordCheck = document.getElementById("inputPasswordCheck").value;

    if (!idpwtest.test(inputPasswordCheck)) {
      $("#pw_check").text("비밀번호는 4~12자의 영문과 숫자로 이루어져야 합니다");
      $("#pw_check").css("color", "red");
      $("#inputPasswordCheck").css("color", "red");
      $("#inputPassword").css("color", "red");
      $("#submit").attr("disabled", true);
    } else if (inputPassword == "") {
      $('#pw_check').text('비밀번호를 입력해주세요');
      $('#pw_check').css('color', 'red');
      $("#submit").attr("disabled", true);
    } else {
      if (inputPassword != inputPasswordCheck) {
        $("#pw_check").text("비밀번호가 틀립니다");
        $("#pw_check").css("color", "red");
        $("#inputPasswordCheck").css("color", "red");
        $("#inputPassword").css("color", "red");
        $("#submit").attr("disabled", true);
      } else {
        $("#pw_check").text("비밀번호가 일치합니다");
        $("#pw_check").css("color", "green");
        $("#inputPasswordCheck").css("color", "green");
        $("#inputPassword").css("color", "green");
        $("#submit").attr("disabled", false);
      }
    }
  });