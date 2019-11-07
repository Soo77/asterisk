<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
  <link href="/css/mypage.css" rel="stylesheet" />
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
/* 
    .modification-button-div {
      text-align: right;
    } */

    #addressSearchButton {
      margin-top: 2px;
      padding-left: 15px;
      padding-right: 15px;
    }
    
    .addr-search-btn-div, .subjectAddButtonDiv, .childAddButtonDiv {
      text-align: center;
    }

    .subjectCheckboxDiv {
      padding: 5px 0 0 15px;
    }
    @media (max-width: 495px) {
      .subjectCheckboxDiv {
        margin:0;
        text-align: center;
        max-width: 240px;
      }
      
    }

    .kakaotalkDiv {
      padding-left: 3px;
    }

    .wantedSubjectLabel {
      font-size: 0.875rem;
    }

  </style>
  
</head>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>Your title here</h1>
          <h3 class="title text-center">Subtitle</h3>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container">
    <div class="row-fluid">
      <div class="col">
        <form id="mypage-form">

          <div class="form-group">
            <label for="inputId">아이디</label>
            <input type="text" class="form-control" id="inputId" value="${loginUser.id}" readonly>
          </div>

          <div class="form-group">
            <label for="inputPassword">비밀번호</label>
            <input type="password" class="form-control" id="inputPassword">
          </div>

          <div class="form-group">
            <label for="inputPasswordCheck">비밀번호확인</label>
            <input type="password" class="form-control" id="inputPasswordCheck">
          </div>

          <div class="form-group">
            <label for="inputEmail">이메일</label>
            <div class="row">
              <div class="col">
                <input type="text" class="form-control" id="inputEmail" value="${email[0]}">
              </div>
              <div class="col">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <div class="input-group-text">@</div>
                  </div>
                  <input type="text" class="form-control" id="inputEmail2" value="${email[1]}">
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="inputDateOfBirth">생년월일</label>
            <input type="date" class="form-control" id="inputDateOfBirth" value='${loginUser.dateOfBirth}'>
          </div>
          
          <label for="addressSearchButton">주소</label>
          <div class="form-row">
            <div class="col-sm-11">
              <input type="text" id="inputAddress" class="form-control" readonly value="${loginUser.addressCity}">
            </div>
            <div class="col-sm-1 addr-search-btn-div">
              <button class="btn btn-sm btn-outline-success" type="button" id="addressSearchButton">주소검색</button>
            </div>
          </div>

          <div class="form-group pt-1">
            <label for="inputAddress2" id="address2-label" class="col-sm-2 col-form-label"></label>
            <input type="text" class="form-control" id="inputAddress2" value="${loginUser.addressSuburb}" readonly>
          </div>

          <div class="form-group">
            <label for="inputTel">전화번호</label>
            <input type="text" class="form-control" id="inputTel" value="${loginUser.tel}">
          </div>


          <div class="form-group">
            <label for="inputBankName">은행명</label>
            <select class="form-control selectpicker" data-style="btn btn-link" id="inputBankName">
              <option selected>은행선택</option>
              <option>국민은행</option>
              <option>우리은행</option>
              <option>신한은행</option>
              <option>카카오뱅크</option>
            </select>
          </div>

          <div class="form-group">
            <label for="inputAccountNo">계좌번호</label>
            <input type="text" class="form-control" id="inputAccountNo" value="${memberInfoMap.teacher.accountNo}">
          </div>

          <div class="form-group">
            <label for="inputHighSchool">고등학교</label>
            <c:forEach items="${memberInfoMap.teacher.schools}" var="school">
              <c:if test="${school.schoolTypeNo eq 3}">
                <input type="text" class="form-control" id="inputHighSchool" value="${school.schoolName}" readonly>
              </c:if>
            </c:forEach>
          </div>
          <div class="form-group">
            <label for="inputUniversity">대학교</label>
            <c:forEach items="${memberInfoMap.teacher.schools}" var="school">
              <c:if test="${school.schoolTypeNo eq 4}">
                <input type="text" class="form-control" id="inputUniversity" value="${school.schoolName}" readonly>
              </c:if>
            </c:forEach>
          </div>

          <div class="form-group row wantedSubjects">
            <div class="col-sm-2 form-group">
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
            <button type="button" class="btn btn-outline-success subjectAddButton">추가</button>
          </div>

          <div class="form-group">
            <label for="inputSubjectDay">과외가능 요일</label>
            <div class="subjectCheckboxDiv">
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="checkboxSunday" value="option1"> 일
                  <span class="form-check-sign">
                    <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id="checkboxMonday" value="option1"> 월
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id="checkboxTuesday" value="option1"> 화
                <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id="checkboxWednesday" value="option1"> 수
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id="checkboxThursday" value="option1"> 목
                <span class="form-check-sign">
                    <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id="checkboxFriday" value="option1"> 금
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id="checkboxSaturday" value="option1"> 토
                <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="subject-start-time">과외 시작시간</label><br>
            <input type='time' value='18:00' id="subject-start-time" class="form-control" />
          </div>

          <div class="form-group">
            <label for="subject-end-time">과외 종료시간</label><br>
            <input type='time' value='20:00' id="subject-end-time" class="form-control" />
          </div>

          <div class="form-group">
            <label for="inputRequirements">과외 희망사항</label>
            <textarea class="form-control" id="inputRequirements" rows="8"></textarea>
          </div>

          <div class="form-group">
            <label for="inputIntro">자기소개</label>
            <textarea class="form-control" id="inputIntro" rows="8"></textarea>
          </div>

          <div class="form-group">
            <label for="inputIntroVideo">자기소개동영상</label>
            <input type="text" class="form-control" id="inputIntroVideo" value="https://www.youtube.com/watch?v=eEXNY-fNZtc">
          </div>

          <div class="form-group row childId">
            <div class="col-sm-2">
              <label for="inputChildId" class="wantedSubjectLabel col-form-label">자녀아이디</label>&nbsp;&nbsp;
              <div class="d-inline-flex">
                <button type="button" class="btn btn-outline-success btn-sm"><strong>&minus;</strong></button>
              </div>
            </div>
            <div class="col-sm-10">

                <div class="form-row">
                  <div class="col-sm-11">
                    <input type="text" class="form-control" readonly value="hong111">
                  </div>
                  <div class="col-sm-1 addr-search-btn-div">
                    <button class="btn btn-sm btn-outline-success" type="button">과외현황</button>
                  </div>
                </div>

              <!-- <div class="input-group">
                <input type="text" class="form-control" value="hong111" aria-label="Recipient's username"
                  aria-describedby="button-addon2">
                <div class="input-group-append">
                  <button class="btn btn-outline-success" type="button" id="button-addon2">과외현황</button>
                </div>
              </div> -->
            </div>
          </div>
          <div class="childAddButtonDiv mb-3">
            <button type="button" class="btn btn-outline-success childAddButton">추가</button>
          </div>


          <div class="form-check kakaotalkDiv">
            <label class="form-check-label">
                <input id="kakaotalkCheckbox" class="form-check-input" type="checkbox" value="">
                과외 내용을 카톡으로 수신
                <span class="form-check-sign">
                    <span class="check"></span>
                </span>
            </label>
          </div>

          <div class="modification-button-div pt-2 pb-2">
            <a class="btn btn-success" href="#">수정</a>
          </div>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- 
<script>
  window.onload = () => {
    console.log('${memberInfoMap.teacher}');
    console.log('${memberInfoMap.teacher.bankName}');
  };
</script>
 -->

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