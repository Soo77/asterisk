<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    #mypage-form {
      padding: 0px 20px 0px 20px;
    }

    @media (max-width: 575.98px) {
      #mypage-form {
        padding: 0;
      }
    }

    @media (max-width: 767.98px) {
      #mypage-form {
        padding: 0;
      }
    }

    textarea {
      resize: none;
    }

    @media (max-width: 575.98px) {
      #address2-label {
        display: none;
      }
    }

    @media (max-width: 767.98px) {
      #address2-label {
        display: none;
      }
    }

    .modification-button-div {
      text-align: right;
    }
  </style>
</head>

<body>

  <div class="contatiner">
    <div class="row-fluid">
      <div class="col">
        <form id="mypage-form">
          <div class="form-group row">
            <label for="inputId" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="inputId" value="${loginUser.id}" readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="inputPassword">
            </div>
          </div>

          <div class="form-group row">
            <label for="inputPasswordCheck" class="col-sm-2 col-form-label">비밀번호확인</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="inputPasswordCheck">
            </div>
          </div>



          <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-5">
              <input type="text" class="form-control mb-2" id="inputEmail" value="${email[0]}">
            </div>
            <div class="col-sm-5">
              <div class="input-group mb-2">
                <div class="input-group-prepend">
                  <div class="input-group-text">@</div>
                </div>
                <input type="text" class="form-control" id="inputEmail2" value="${email[1]}">
              </div>
            </div>
          </div>

          <div class="form-group row">
            <label for="inputDateOfBirth" class="col-sm-2 col-form-label">생년월일</label>
            <div class="col-sm-10">
              <input type="date" class="form-control" id="inputDateOfBirth" value='${loginUser.dateOfBirth}'>
            </div>
          </div>

          <div class="form-group row" style="margin-bottom: 0px;">
            <label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
            <div class="col-sm-10">
              <div class="input-group mb-2">
                <input type="text" id="inputAddress" class="form-control" readonly aria-label="Recipient's username"
                  aria-describedby="button-addon2" value="${loginUser.addressCity}">
                <div class="input-group-append">
                  <button class="btn btn-outline-success" type="button" id="addressSearchButton">주소검색</button>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group row">
            <label for="inputAddress2" id="address2-label" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="inputAddress2" value="${loginUser.addressSuburb}" readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="inputTel" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="inputTel" value="${loginUser.tel}">
            </div>
          </div>

          <div class="form-group row">
            <label for="inputBankName" class="col-sm-2 col-form-label">은행명</label>
            <div class="col-sm-10">
              <select id="inputBankName" class="form-control">
                <option selected>은행선택</option>
                <option>국민은행</option>
                <option>우리은행</option>
                <option>신한은행</option>
              </select>
            </div>
          </div>

          <div class="form-group row">
            <label for="inputAccountNo" class="col-sm-2 col-form-label">계좌번호</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="inputAccountNo" value="${memberInfoMap.teacher.accountNo}">
            </div>
          </div>

          <div class="form-group row">
            <label for="inputHighSchool" class="col-sm-2 col-form-label">고등학교</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="inputHighSchool" value="${teacher.}" readonly>
            </div>
          </div>
          <div class="form-group row">
            <label for="inputUniversity" class="col-sm-2 col-form-label">대학교</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="inputUniversity" value="비트대학교" readonly>
            </div>
          </div>

          <div class="form-group row wantedSubjects">
            <div class="col-sm-2">
              <label for="inputSubject" class="wantedSubjectLabel col-form-label">희망과목</label>&nbsp;&nbsp;
              <div class="d-inline-flex">
                <button type="button" class="btn btn-outline-success btn-sm"><strong>&minus;</strong></button>
              </div>
            </div>
            <div class="col-sm-10">
              <select class="form-control mb-2 wantedSubject-school">
                <option value=1>초등학교</option>
                <option value=2>중학교</option>
                <option value=3>고등학교</option>
              </select>
              <select class="form-control mb-2 wantedSubject-subject">
                <option value=1>국어</option>
                <option value=2>영어</option>
                <option value=3>수학</option>
                <option value=4>과학</option>
                <option value=5>사회</option>
              </select>
              <select class="form-control mb-2 wantedSubject-fee">
                <option value=1>20만원이하</option>
                <option value=2>30만원~40만원</option>
                <option value=3>20만원~30만원</option>
                <option value=4>40만원이상</option>
              </select>
            </div>
          </div>
          <div class="subjectAddButtonDiv mb-3">
            <button type="button" class="btn btn-outline-success subjectAddButton">&nbsp;&nbsp;추가&nbsp;&nbsp;</button>
          </div>

          <div class="form-group row align-items-center">
            <label for="inputSubjectDay" class="col-sm-2 col-form-label">과외가능 요일</label><br>
            <div class="col-sm-10">
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="checkboxSunday" value="sunday">
                <label class="form-check-label" for="checkboxSunday">일</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="checkboxMonday" value="monday">
                <label class="form-check-label" for="checkboxMonday">월</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="checkboxTuesday" value="tuesday">
                <label class="form-check-label" for="checkboxTuesday">화</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="checkboxWednesday" value="wednesday">
                <label class="form-check-label" for="checkboxWednesday">수</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="checkboxThursday" value="thursday">
                <label class="form-check-label" for="checkboxThursday">목</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="checkboxFriday" value="friday">
                <label class="form-check-label" for="checkboxFriday">금</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="checkboxSaturday" value="saturday">
                <label class="form-check-label" for="checkboxSaturday">토</label>
              </div>
            </div>
          </div>


          <div class="form-group row align-items-center">
            <label for="subject-start-time" class="col-sm-2 col-form-label">과외 시작시간</label><br>
            <div class="col-sm-10">
              <input type='time' value='18:00' id="subject-start-time" class="form-control" />
            </div>
          </div>

          <div class="form-group row align-items-center">
            <label for="subject-end-time" class="col-sm-2 col-form-label">과외 종료시간</label><br>
            <div class="col-sm-10">
              <input type='time' value='20:00' id="subject-end-time" class="form-control" />
            </div>
          </div>


          <div class="form-group row">
            <label for="inputRequirements" class="col-sm-2 col-form-label">과외 희망사항</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="inputRequirements" rows="8"></textarea>
            </div>
          </div>

          <div class="form-group row">
            <label for="inputIntro" class="col-sm-2 col-form-label">자기소개</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="inputIntro" rows="8"></textarea>
            </div>
          </div>

          <div class="form-group row align-items-center">
            <label for="inputIntroVideo" class="col-sm-2 col-form-label">자기소개동영상</label>
            <a href="https://www.youtube.com/watch?v=eEXNY-fNZtc"
              class="col-sm-10 text-break">https://www.youtube.com/watch?v=eEXNY-fNZtc</a>
          </div>

          <div class="form-group row childId">
            <div class="col-sm-2">
              <label for="inputChildId" class="wantedSubjectLabel col-form-label">자녀아이디</label>&nbsp;&nbsp;
              <div class="d-inline-flex">
                <button type="button" class="btn btn-outline-success btn-sm"><strong>&minus;</strong></button>
              </div>
            </div>
            <div class="col-sm-10">
              <div class="input-group">
                <input type="text" class="form-control" value="hong111" aria-label="Recipient's username"
                  aria-describedby="button-addon2">
                <div class="input-group-append">
                  <button class="btn btn-outline-success" type="button" id="button-addon2">과외현황</button>
                </div>
              </div>
            </div>
          </div>
          <div class="childAddButtonDiv mb-3">
            <button type="button" class="btn btn-outline-success childAddButton">&nbsp;&nbsp;추가&nbsp;&nbsp;</button>
          </div>

          <div class="form-group row">
            <div class="col-sm">
              <input type="checkbox" id="kakaotalkCheckbox">
              <label class="form-check-label" for="kakaotalkCheckbox">과외 내용을 카톡으로 수신</label>
            </div>
          </div>

          <div class="modification-button-div mb-2">
            <a class="btn btn-success" href="#">수정</a>
          </div>
      </div>
      </form>
    </div>
  </div>
  </div>

  <script>
    window.onload = () => {
      console.log('${memberInfoMap.teacher}');
      console.log('${memberInfoMap.teacher.bankName}');
    };
  </script>


  <!-- 희망과목 추가 버튼 -->
  <script>
    let subjectAddButton = document.getElementsByClassName('subjectAddButton');
    subjectAddButton[0].addEventListener('click', () => {
      let wantedSubjects = document.getElementsByClassName('wantedSubjects');
      let wantedSubjectTemplate = wantedSubjects[0].cloneNode(true);

      wantedSubjectTemplate.setAttribute('id', 'wantedTest');
      // wantedSubectLabel.innerHTML = 'test';
      wantedSubjects[0].parentNode.insertBefore(wantedSubjectTemplate, wantedSubjects[0].nextSibling);

      let wantedSubectLabel = document.querySelector('#wantedTest > div:nth-child(1) > label');
      wantedSubectLabel.innerHTML = '희망과목2';
    });
  </script>


</body>

</html>