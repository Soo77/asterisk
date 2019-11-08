<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 화면</title>
<link rel='stylesheet'
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
	integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
	crossorigin='anonymous'>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		var va = document.querySelectorAll(".redch");
		for (var i = 0; i < va.length; i++) {
			if (va[i].style.color == "red") {
				va[i].focus();
				console.log(va[i]);
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
<style>
 #view_file {
/* 	display: none; */
  width: 150px; 
  height: 150px;"
} 

#mail {
	display: none;
}
</style>
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="../assets/demo/demo.css" rel="stylesheet" />
</head>
<body>
	<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('assets/img/bg3.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand text-center">
						<h1>타이틀</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form method="post" action="studentjoin" name="userInfo"
		enctype="multipart/form-data" onsubmit="return checkValue()">
		<div class="main main-raised profile-page">
			<div class="container">
				<div class="row-fluid">
					<div class="col">
						<div class="row">
							<div class="col-md-6 ml-auto mr-auto">
								<div class="profile">
									<div class="avatar">
										<img src="/images/photo.png" alt="Circle Image"
											id="view_file" class="img-raised rounded-circle img-fluid">
									</div>
									<div class="name">
										<h2 class="title">프로필 사진</h2>
											<input type='file' class="text-white btn btn-primary btn-sm"
											id='filePath' name='filePath'>
									</div>
								</div>
							</div>
						</div>

						<div>
							<b><font size="6" color="gray">학생 회원가입</font></b><br> <br>

							<div class="form-group">
								<label for="id">아이디</label>
								<input type="text" class="form-control" name="id" id="id"
									maxlength="50">
								<div class="redch" id="id_check"></div>
							</div>

              <div class="form-group">
							<label for="pw">비밀번호</label>
							<input type="password" class="form-control" name="password"
								id="pw" maxlength="50">
							</div> 
								
								<div class="form-group">
								<label for="okpw">비밀번호 확인</label> 
								<input type="password" class="form-control" name="okpw" id="okpw"
								maxlength="50">
								</div>
							<div class="redch" id="pw_check"></div>

							<div class="form-group">
								<label for="name">이름</label>
								<input type="text" class="form-control" name="name" id="name"
									maxlength="50">
							</div>

							<div class="form-check">
                <label for="exampleInput1" class="bmd-label-floating">성별</label><br>
                <label class="form-check-label"> <input
                  class="form-check-input" type="radio" name="gender" value="M">
                  남&ensp; <span class="circle"> <span class="check"></span>
                </span>
                </label> <label class="form-check-label"> <input
                  class="form-check-input" type="radio" name="gender" value="F">
                  여 <span class="circle"> <span class="check"></span>
                </span>
                </label>
              </div>
							
							<div class="form-group">
                <label for="YEAR">생년월일</label>
                <div class="form-row">
                  <div class="col-md-6">
                    <Input type="date" name="birthDay" 
                    id="YEAR" class="form-control select w80"> 
                  </div>
                </div>
              </div>


							<div class="form-group bmd-form-group">
								<label for="email">이메일</label>
									<div id="mailselect">
											<div class="input-group">
												<input type="text" class="form-control" name="email"
													id="email" maxlength="50">
												<div class="input-group-text">@</div>
												<input type="text" class="form-control" name="mail"
													id="mail" value=""> 
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
							</div>
							<div class="redch" id="email_check"></div>

							<div class="form-group bmd-form-group">
								<label for="tel">휴대전화</label>
								<input type="tel" class="form-control" name="tel" id="tel"
									maxlength="11">
								<div class="redch" id="tel_check"></div>
							</div>
							
							<div class="form-row">
								<div class="col-sm-11">
									<span class="bmd-form-group is-filled"> 
									<input type="text" class="form-control" name="addressCity" 
									id="sido" placeholder="주소">
									</span>
								</div>
								<div class="col-sm-1 addr-search-btn-div">
									<input type="button" class="btn btn-primary btn-sm"
										onclick="execDaumPostcode()" value="주소검색"><br>
								</div>
							</div>
							<div class="form-group pt-1 bmd-form-group is-filled">
								<label for="inputAddress2" id="address2-label"
									class="col-sm-2 col-form-label bmd-label-static"></label> 
									<input type="text" class="form-control" name="addressSuburb"
									id="sigungu" placeholder="상세주소">
							</div>

              <div class="form-group">
							<label for="subject">원하는 과목</label>
								<select	name="subject" id="subject" class="form-control">
								<optgroup label="초등학교">
									<option value="수학">수학</option>
									<option value="영어">영어</option>
								</optgroup>
								<optgroup label="중학교">
									<option value="수학">수학</option>
									<option value="영어">영어</option>
								</optgroup>
								<optgroup label="고등학교">
									<option value="수학">수학</option>
									<option value="영어">영어</option>
								</optgroup>
							</select>
							</div>
							
							<label>과외 가능 요일</label>
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 일 <span
									class="form-check-sign"> <span class="check"></span>
								</span>
								</label> <label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 월 <span
									class="form-check-sign"> <span class="check"></span>
								</span>
								</label> <label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 화 <span
									class="form-check-sign"> <span class="check"></span>
								</span>
								</label> <label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 수 <span
									class="form-check-sign"> <span class="check"></span>
								</span>
								</label> <label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 목 <span
									class="form-check-sign"> <span class="check"></span>
								</span>
								</label> <label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 금 <span
									class="form-check-sign"> <span class="check"></span>
								</span>
								</label> <label class="form-check-label"> <input
									class="form-check-input" type="checkbox" value=""> 토 <span
									class="form-check-sign"> <span class="check"></span>
								</span>
								</label>
							</div>

							<label>과외 가능 시간</label>
              <div class="form-row">
                <div class="col-sm-8">
                  <Input type="time" name="startTime"> ~ <Input type="time" name="endTime"> 
                </div>
              </div>
							
							<div class="form-group">
							<label for="teacherhope">선생님께 바라는 것</label>
							<textarea rows="10" cols="30" class="form-control" id="teacherhope"></textarea>
							</div>

							<button type="submit" class="btn btn-primary btn-sm" id="submit">가입</button>
							<input id="cancelbtn" class="btn btn-primary btn-sm" type="button"
								value="취소">

						</div>

					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- 취소 -->
	<script>
		var cbtn = document.querySelector("#cancelbtn");
		cbtn.addEventListener("click", function() {
			location.href = "../board/list";
		});
	</script>

	<!-- 다음 우편 API -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sido').value = data.sido;
					document.getElementById('sigungu').value = data.sigungu;
				}
			}).open();
		}
	</script>

	<!-- 프로필 사진 -->
	<script>
		$("#filePath").change(function() {
			var input = document.getElementById("filePath");
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
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
		$("#id").blur(function() {
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
					url : 'idCheck',
					type : 'get',
					data : "id=" + id,
					success : function(result) {
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
					},
					error : function() {
						console.log("실패");
					}
				});
			}
		});
	</script>

	<!-- 비밀번호 유효성 -->
	<script>
		$("#pw").blur(function() {
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
		$("#okpw").blur(function() {
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
		$("#mailselect").change(function() {
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
					url : 'emailCheck',
					type : 'get',
					data : "email=" + addmail,
					success : function(result) {
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
					},
					error : function() {
						console.log("실패");
					}
				});
			}
		});
	</script>

	<!--     메일 선택 -->
	<script>
		$("#mail2").change(
				function() {
					document.getElementById("mail").value = document
							.getElementById("mail2").value;
				});
	</script>

	<!--   휴대전화 중복 -->
	<script>
		$("#tel").blur(function() {
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
					url : 'telCheck',
					type : 'get',
					data : "tel=" + tel,
					success : function(result) {
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
					},
					error : function() {
						console.log("실패");
					}
				});
			}
		});
	</script>
	<!-- <script src="/node_modules/jquery/dist/jquery.min.js"></script> -->
</body>
</html>