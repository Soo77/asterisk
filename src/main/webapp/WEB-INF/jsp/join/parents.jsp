<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>가입 화면</title>

  <style>
    .filebox input[type="file"] {
      /* 파일 필드 숨기기 */
      position: absolute;
      clip: rect(0, 0, 0, 0);
    }

    #view_file {
      /*  display: none; */
      width: 150px;
      height: 150px;

    }

    #mail {
      display: none;
    }

    .img-raised.rounded-circle.img-fluid {
      height: 160px;
      object-fit: cover;
    }

    .req {
      margin-top: 2px;
      font-size: large;
      color: purple;
    }

    #view_file {
      height: 160px;
      object-fit: cover;
    }
  </style>
</head>

<body>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/bg/bg5.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <h1>회원가입</h1>
          </div>
        </div>
      </div>
    </div>
  </div>

  <form method="post" action="parentsjoin" name="userInfo" id="form1" 
  onsubmit='return joinAndEmail();' enctype="multipart/form-data">
    <div class="main main-raised profile-page">
      <div class="container">
        <div class="row-fluid">
          <div class="col">
            <div class="row">
              <div class="col-md-6 ml-auto mr-auto">
                <div class="profile">
                  <div class="avatar">
                    <img src="/upload/join/default.png" alt="Circle Image" id="view_file"
                      class="img-raised rounded-circle img-fluid">
                  </div>
                  <div class="name">
                    <div class="filebox">
                      <label for="filePath" class="btn btn-primary btn-sm" style="margin-top: 15px;">사진선택</label>
                      <input type="file" id='filePath' name='filePath'>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div>
              <b>
                <font size="6" color="gray">학부모 회원가입</font>
              </b><br> <br>

              <div class="form-group">
                <label for="id">아이디
                  <span class="req"> *</span>
                </label>
                <input type="text" class="form-control" name="id" id="id" maxlength="50" required>
                <div class="redch" id="id_check"></div>
              </div>

              <div class="form-group">
                <label for="pw">비밀번호
                  <span class="req"> *</span>
                </label>
                <input type="password" class="form-control" name="password" id="pw" maxlength="50" required>
              </div>

              <div class="form-group">
                <label for="okpw">비밀번호 확인
                  <span class="req"> *</span>
                </label>
                <input type="password" class="form-control" name="okpw" id="okpw" maxlength="50" required>
                <div class="redch" id="pw_check"></div>
              </div>

              <div class="form-group">
                <label for="name">이름
                  <span class="req"> *</span>
                </label>
                <input type="text" class="form-control" name="name" id="name" maxlength="50" required>
              </div>

              <div class="form-check mb-3">
                <label for="exampleInput1" class="bmd-label-floating">성별
                  <span class="req"> *</span>
                </label><br>
                <div class="my-wrapper ml-2">
                  <label class="form-check-label">
                    <input class="form-check-input" type="radio" name="gender" value="M" checked>
                    남&ensp; <span class="circle">
                      <span class="check"></span>
                    </span>
                  </label>
                  <label class="form-check-label">
                    <input class="form-check-input" type="radio" name="gender" value="F">
                    여 <span class="circle"> <span class="check"></span>
                    </span>
                  </label>
                </div>
              </div>

              <div class="form-group">
                <label for="YEAR">생년월일
                  <span class="req"> *</span>
                </label>
                <Input type="date" max="9999-12-31" name="birthDay" id="YEAR" class="form-control">
              </div>

              <div id="mailselect">
                <div class="input-group form-group">
                  <label for="email">이메일
                    <span class="req"> *</span>
                  </label>
                  <input type="text" class="form-control" name="email" id="email" maxlength="50" required>
                  <div class="input-group-text">@</div>
                  <input type="text" class="form-control" name="mail" id="mail" value="" required>
                  <select name="mail2" id="mail2" class="form-control">
                    <option selected disabled>메일 선택</option>
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="nate.com">nate.com</option>
                    <option value="">직접 입력</option>
                  </select>
                </div>
              </div>
              <div class="redch" id="email_check"></div>

              <div class="form-group">
                <label for="tel">휴대전화
                <span class="req"> *</span>
                </label>
                <input type="tel" class="form-control" name="tel" id="tel" maxlength="11" required>
                <div class="redch" id="tel_check"></div>
              </div>


              <label for="addressSearchButton">주소</label>
              <div class="form-group row pt-1 mb-0">
                <div class="col">
                  <div class="d-flex">
                    <div class="flex-item pr-1" style="flex-basis: 93%;">
                      <input type="text" id="sido" name="addressCity" class="form-control" readonly>
                    </div>
                    <div class="flex-item" style="flex-basis: 7%;">
                      <button class="btn btn-sm btn-outline-primary" type="button" id="addressSearchButton"
                        style="margin-top: 2px;" onclick="execDaumPostcode()">주소검색</button>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group pt-1">
                <label for="inputAddress2" id="address2-label" class="col-sm-2 col-form-label"></label>
                <input type="text" id="sigungu" class="form-control" name="addressSuburb" readonly>
              </div>

              <label for="addressSearchButton">자녀 아이디</label>
              <div class="form-group row pt-1 mb-3">
                <div class="col">
                  <div class="d-flex">
                    <div class="flex-item pr-1" style="flex-basis: 93%;">
                      <input type="text" class="form-control" id="textverify" placeholder="자녀 아이디" name="studentId"
                        readonly>
                    </div>
                    <div class="flex-item" style="flex-basis: 7%;">
                      <button type="button" class="btn btn-outline-primary btn-sm" id="verify" style="margin-top: 2px;"
                        data-toggle="modal" data-target="#exampleModal">등록하기</button>
                    </div>

                    <div id="exampleModal" class="modal fade" data-backdrop="false">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                              <span>×</span>
                            </button>
                          </div>
                          <div class="messageRow">
                            <input type="text" id="std" placeholder="학생 아이디 입력">
                            <button type="button" onclick="childSearch()" class="btn btn-primary btn-sm">검색</button>
                          </div>
                          <div id="checkverify"></div>
                          <input type="text" class="form-control" id="choiceId" placeholder="자녀 아이디" readOnly>
                          <button type="button" id="inInput" data-dismiss="modal"
                            class="btn btn-primary btn-sm">확인</button>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>

              <div style="padding-bottom: 20px; text-align: right;">
                <button type="submit" class="btn btn-primary" id="submitBtn">가입</button>
                <input id="cancelbtn" class="btn btn-primary" type="button" value="취소">
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </form>

  <script>
	  $(document).keydown(function() {
		  if (event.keyCode == 13) {
		    return false;
		  };
		});
	  
   	function joinAndEmail() {
     
     var va = document.querySelectorAll(".redch");
     for (var i = 0; i < va.length; i++) {
       if (va[i].style.color == "red") {
         va[i].focus();
         return false;
       }
     }
     
     event.preventDefault();
     
     swal({
       title: "인증링크를 보냈습니다",
       text: "이메일을 확인해주세요",
       icon: "success",
       button: "로그인",
     })
       .then((value) => {
         document.getElementById('form1').submit();
       });
   	}
  </script>
  
  <!-- 취소 -->
  <script>
    var cbtn = document.querySelector("#cancelbtn");
    cbtn.addEventListener("click", function () {
      location.href = "../auth/form";
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
        $('#id_check').text('아이디를 입력해주세요');
        $('#id_check').css('color', 'red');
        $("#submitBtn").attr("disabled", true);
      } else if (!idpwtest.test(id)) {
        $("#id_check").text("아이디는 4~12자의 영문이나 숫자로 이루어져야 합니다");
        $("#id_check").css("color", "red");
        $("#id").css("color", "red");
        $("#submitBtn").attr("disabled", true);
      } else {
        $.ajax({
          url: 'idCheck',
          type: 'post',
          data: "id=" + id,
          success: function (result) {
            if (result == 1) {
              $("#id_check").text("사용중인 아이디입니다");
              $("#id_check").css("color", "red");
              $("#id").css("color", "red");
              $("#submitBtn").attr("disabled", true);
            } else {
              $("#id_check").text("사용 가능한 아이디입니다");
              $("#id_check").css("color", "green");
              $("#id").css("color", "green");
              $("#submitBtn").attr("disabled", false);
            }
          },
          error: function () {
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
        $("#pw_check").text("비밀번호는 4~12자의 영문과 숫자로 이루어져야 합니다");
        $("#pw_check").css("color", "red");
        $("#okpw").css("color", "red");
        $("#pw").css("color", "red");
        $("#submitBtn").attr("disabled", true);
      } else if (okpw == "") {
        $('#pw_check').text('비밀번호 확인을 해주세요');
        $('#pw_check').css('color', 'red');
        $("#submitBtn").attr("disabled", true);
      } else {
        if (pw != okpw) {
          $("#pw_check").text("비밀번호가 틀립니다");
          $("#pw_check").css("color", "red");
          $("#okpw").css("color", "red");
          $("#pw").css("color", "red");
          $("#submitBtn").attr("disabled", true);
        } else {
          $("#pw_check").text("비밀번호가 일치합니다");
          $("#pw_check").css("color", "green");
          $("#okpw").css("color", "green");
          $("#pw").css("color", "green");
          $("#submitBtn").attr("disabled", false);
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
        $("#pw_check").text("비밀번호는 4~12자의 영문과 숫자로 이루어져야 합니다");
        $("#pw_check").css("color", "red");
        $("#okpw").css("color", "red");
        $("#pw").css("color", "red");
        $("#submitBtn").attr("disabled", true);
      } else if (pw == "") {
        $('#pw_check').text('비밀번호를 입력해주세요');
        $('#pw_check').css('color', 'red');
        $("#submitBtn").attr("disabled", true);
      } else {
        if (pw != okpw) {
          $("#pw_check").text("비밀번호가 틀립니다");
          $("#pw_check").css("color", "red");
          $("#okpw").css("color", "red");
          $("#pw").css("color", "red");
          $("#submitBtn").attr("disabled", true);
        } else {
          $("#pw_check").text("비밀번호가 일치합니다");
          $("#pw_check").css("color", "green");
          $("#okpw").css("color", "green");
          $("#pw").css("color", "green");
          $("#submitBtn").attr("disabled", false);
        }
      }
    });
  </script>

  <script>
    var dp = document.getElementById("mail");
  </script>

  <!--   이메일 확인 -->
  <script>
    $("#mailselect").focusout(function () {
      emailCheck();
    })

    $("#mail2").change(function () {
      if ($('#mail2').val() == "") {
        dp.style.display = 'block';
        $('#mail2').css('display', 'none');
      }
      document.getElementById("mail").value = document.getElementById("mail2").value;
      emailCheck();
    });

    function emailCheck() {
      var email = $('#email').val();
      var mail = $('#mail').val();
      var addmail = email + '@' + mail;
      var mailtest = /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

      if (mail == "") {
        dp.readOnly = false;
        $('#email_check').text('이메일을 입력해주세요');
        $('#email_check').css('color', 'red');
        $("#submitBtn").attr("disabled", true);
      } else if (!mailtest.test(mail)) {
        dp.readOnly = false;
        $("#email_check").text("이메일 형식이 맞지 않습니다");
        $("#email_check").css("color", "red");
        $("#email").css("color", "red");
        $("#mail").css("color", "red");
        $("#submitBtn").attr("disabled", true);
      } else {
        $.ajax({
          url: 'emailCheck',
          type: 'post',
          data: "email=" + addmail,
          success: function (result) {
            if (result == 1) {
              dp.readOnly = false;
              $("#email_check").text("사용중인 이메일입니다");
              $("#email_check").css("color", "red");
              $("#email").css("color", "red");
              $("#mail").css("color", "red");
              $("#submitBtn").attr("disabled", true);
            } else {
              if (email) {
                $("#email_check").text("사용 가능한 이메일입니다");
                $("#email_check").css("color", "green");
                $("#email").css("color", "green");
                $("#mail").css("color", "green");
                $("#submitBtn").attr("disabled", false);
              } else if (email == "") {
                dp.readOnly = false;
                $('#email_check').text('이메일을 입력해주세요');
                $('#email_check').css('color', 'red');
                $("#submitBtn").attr("disabled", true);
              }
            }
          },
          error: function () {
            console.log("실패");
          }
        });
      }
    }
  </script>

  <!--   휴대전화 중복 -->
  <script>
  $("#tel").blur(function () {
      var tel = $('#tel').val();
      var teltest = /^[0-9]{11}$/;

      if (tel == "") {
  	  	$('#tel_check').text('전화번호를 입력해주세요');
        $('#tel_check').css('color', 'red');
        $("#submitBtn").attr("disabled", true);
      } else if (!teltest.test(tel)) {
        $("#tel_check").text("11개의 숫자만 입력해주세요");
        $("#tel_check").css("color", "red");
        $("#tel").css("color", "red");
        $("#submitBtn").attr("disabled", true);
      } else {
        $.ajax({
          url: 'telCheck',
          type: 'post',
          data: "tel=" + tel,
          success: function (result) {
            if (result == 1) {
              $("#tel_check").text("사용중인 번호입니다");
              $("#tel_check").css("color", "red");
              $("#tel").css("color", "red");
              $("#submitBtn").attr("disabled", true);
            } else {
                $("#tel_check").text("가입 가능한 번호입니다");
                $("#tel_check").css("color", "green");
                $("#tel").css("color", "green");
                $("#submitBtn").attr("disabled", false);
            }
          }, error: function () {
            console.log("실패");
          }
        });
      }
    });
  </script>

  <!--     자녀 아이디 인증 -->
  <script>
    function childSearch() {
      var id = $('#std').val();
      $.ajax({
        url: 'childCheck',
        type: 'post',
        data: "id=" + id,
        success: function (data) {
          if (data == "") {
            $("#checkverify").text("없는 아이디입니다");
            $("#checkverify").css("color", "red");
            $("#std").css("color", "red");
            return false;
          }

          $("#checkverify").css("color", "black");
          $("#std").css("color", "black");
          $("#checkverify").text("");
          for (var i in data) {
            let std = "아이디: <a href='javascript:void(0)'";
            std += " onclick='selectId(this)'";
            std += " id=" + data[i].memberNo + ">" + data[i].id + "</a>";
            std += " 이름: " + data[i].name;
            std += " 성별: " + data[i].gender;
            std += " 생년월일: " + data[i].dateOfBirth + "<br>";
            $('#checkverify').append(std);
          }
        }, error: function () {
          console.log("실패");
        }
      });
    }
    
      //아이디 선택
      function selectId(clickId) {
        let memNo = clickId.id;
        let val = clickId.text;
        $("#choiceId").attr("placeholder", val)
        $("#textverify").attr("value", val)
      }
  </script>
</body>

</html>