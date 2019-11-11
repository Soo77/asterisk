<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
  <link href="/assets/demo/demo.css" rel="stylesheet" />
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

    #addressSearchButton {
      margin-top: 2px;
      padding-left: 15px;
      padding-right: 15px;
    }

    .childLessonButton {
      margin-top: 2px;
      padding-left: 15px;
      padding-right: 15px;
    }

    .addr-search-btn-div,
    .subjectAddButtonDiv,
    .childAddButtonDiv {
      text-align: center;
    }

    .subjectCheckboxDiv {
      padding: 5px 0 0 15px;
    }

    @media (max-width: 495px) {
      .subjectCheckboxDiv {
        margin: 0;
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

    .fa-square,
    .fa-check-square,
    .student-ID-span,
    .tutor-certi-span {
      display: none;
    }

    .my-lesson-btn,
    .studentDisplay,
    .teacherDisplay,
    .parentsDisplay {
      display: none;
    }

    #inputIntro {
      background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0) 2px),
        linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
      border: 0.5px solid #d2d2d2;
      border-radius: .25rem;
    }

    .wantedSubject-school {
      flex-basis: 40%;
    }

    .wantedSubject-subject {
      flex-basis: 30%;
    }

    .wantedSubject-fee {
      flex-basis: 40%;
    }

    .subjectTemplate {
      display: none;
    }

    .childIdTemplate {
      display: none;
    }
  </style>

</head>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised profile-page">
  <div class="container">
    <div class="row-fluid">
      <div class="col">
        <form id="mypage-form" action="asdf">

          <div class="row">
            <div class="col-md-6 ml-auto mr-auto">
              <div class="profile">
                <div class="avatar">
                  <img src="/assets/img/faces/christian.jpg" alt="Circle Image"
                    class="img-raised rounded-circle img-fluid">
                </div>
                <div class="name">
                  <h3 class="title mb-2">${loginUser.name}</h3>
                  <h6>
                    <i class="far fa-square student-ID-unchecked"></i><i
                      class="far fa-check-square student-ID-checked"></i>
                    <span class="student-ID-span">
                      학생증 인증&nbsp;&nbsp;&nbsp;
                    </span>
                    <i class="far fa-square tutor-certi-unchecked"></i><i
                      class="far fa-check-square tutor-certi-checked"></i>
                    <span class="tutor-certi-span">
                      신고서 인증&nbsp;&nbsp;&nbsp;
                    </span>
                  </h6>
                  <h6></h6>
                  <button class="btn btn-primary btn-sm my-message-btn">쪽지함</button>
                  <button class="btn btn-primary btn-sm my-lesson-btn">나의 과외</button>
                </div>
              </div>
            </div>
          </div>

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
                <input type="text" class="form-control" id="inputEmail" value="${mypageEmail[0]}">
              </div>
              <div class="col">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <div class="input-group-text">@</div>
                  </div>
                  <input type="text" class="form-control" id="inputEmail2" value="${mypageEmail[1]}">
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="inputDateOfBirth">생년월일</label>
            <input type="date" class="form-control" id="inputDateOfBirth" value='${loginUser.dateOfBirth}'>
          </div>

          <label for="addressSearchButton">주소</label>
          <div class="form-group row pt-1 mb-0">
            <div class="col">
              <div class="d-flex">
                <div class="flex-item pr-1" style="flex-basis: 93%;">
                  <input type="text" id="inputAddress" class="form-control" readonly value="${loginUser.addressCity}">
                </div>
                <div class="flex-item" style="flex-basis: 7%;">
                  <button class="btn btn-sm btn-outline-primary" type="button" id="addressSearchButton">주소검색</button>
                </div>
              </div>
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

          <!-- 선생님 페이지 수정 중인 항목 -->
          <div class="form-group teacherDisplay">
            <label for="inputBankName">은행명</label>
            <select class="form-control selectpicker" data-style="btn btn-link" id="inputBankName">
              <option selected>은행선택</option>
              <option>국민은행</option>
              <option>우리은행</option>
              <option>신한은행</option>
              <option>카카오뱅크</option>
            </select>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputAccountNo">계좌번호</label>
            <input type="text" class="form-control" id="inputAccountNo" value="${memberInfoMap.teacher.accountNo}">
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputHighSchool">고등학교</label>
            <c:forEach items="${memberInfoMap.teacher.schools}" var="school">
              <c:if test="${school.schoolTypeNo eq 3}">
                <input type="text" class="form-control" id="inputHighSchool" value="${school.schoolName}" readonly>
              </c:if>
            </c:forEach>
          </div>
          <div class="form-group teacherDisplay">
            <label for="inputUniversity">대학교</label>
            <c:forEach items="${memberInfoMap.teacher.schools}" var="school">
              <c:if test="${school.schoolTypeNo eq 4}">
                <c:set var="teacherUniversityConfirmation" value="${school.confirmed}" />
                <input type="text" class="form-control" id="inputUniversity" value="${school.schoolName}" readonly>
              </c:if>

            </c:forEach>
          </div>

          <!-- 선생님, 학생 페이지 수정 중인 항목 템플릿! -->
          <div class="form-group row wantedSubjects subjectTemplate">
            <div class="col-sm-2 mt-1 mb-0 form-group">
              <label for="inputSubject" class="wantedSubjectLabel col-form-label">희망과목</label>&nbsp;&nbsp;
              <button type="button"
                class="btn btn-outline-primary btn-sm px-3 mb-1 remove-subject-button"><strong>&minus;</strong></button>
            </div>
            <div class="col-sm-10 d-flex">
              <select class="form-control pt-0 mx-1 wantedSubject-school" name="subjectSchool">
                <option value=1>초등학교</option>
                <option value=2>중학교</option>
                <option value=3>고등학교</option>
              </select>
              <select class="form-control pt-0 mx-1 wantedSubject-subject" name="subjectName">
                <option value=1>국어</option>
                <option value=2>영어</option>
                <option value=3>수학</option>
                <option value=4>과학</option>
                <option value=5>사회</option>
              </select>
              <select class="form-control pt-0 mx-1 wantedSubject-fee" name="subjectFee">
                <option value=1>20만원이하</option>
                <option value=2>20만원~30만원</option>
                <option value=3>30만원~40만원</option>
                <option value=4>40만원이상</option>
              </select>
            </div>
          </div>
          <div class="subjectAddButtonDiv mb-3 teacherDisplay studentDisplay">
            <button type="button" class="btn btn-outline-primary subjectAddButton">추가</button>
          </div>

          <div class="form-group teacherDisplay studentDisplay">
            <label for="inputSubjectDay">과외가능 요일</label>
            <div class="subjectCheckboxDiv">
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_1" value="option1"> 일
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_2" value="option1"> 월
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_3" value="option1"> 화
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_4" value="option1"> 수
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_5" value="option1"> 목
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_6" value="option1"> 금
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_7" value="option1"> 토
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            </div>
          </div>

          <div class="form-group teacherDisplay studentDisplay">
            <label for="subject-start-time">과외 시작시간</label><br>
            <input type='time' value='${loginUser.lessonStartTime}' id="subject-start-time" class="form-control" />
          </div>

          <div class="form-group teacherDisplay studentDisplay">
            <label for="subject-end-time">과외 종료시간</label><br>
            <input type='time' value='${loginUser.lessonEndTime}' id="subject-end-time" class="form-control" />
          </div>

          <!-- 학생 정보 수정 중-->
          <div class="form-group studentDisplay">
            <label for="inputRequirements">과외 희망사항</label>
            <textarea class="form-control" id="inputRequirements"
              rows="8">${memberInfoMap.student.requirementsToTeacher}</textarea>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputIntro">자기소개</label>
            <textarea class="form-control" id="inputIntro" rows="8">${memberInfoMap.teacher.teacherIntro}</textarea>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputIntroVideo">자기소개 동영상 주소</label>
            <input type="text" class="form-control" id="inputIntroVideo" value="${memberInfoMap.teacher.videoAddress}">
          </div>



          <div class="form-group row childId pt-1 childIdTemplate">
            <div class="col-sm-2 mb-0 form-group">
              <label for="inputChildId" class="childIdLabel">자녀ID</label>&nbsp;&nbsp;
              <button type="button"
                class="btn btn-outline-primary btn-sm px-3 mb-1 remove-childId-button"><strong>&minus;</strong></button>
            </div>
            <div class="col-sm-10 mt-1 d-flex">
              <div class="flex-item pr-1" style="flex-basis: 93%;">
                <input type="text" class="form-control" readonly value="hong111">
              </div>
              <div class="flex-item" style="flex-basis: 7%;">
                <input type="hidden" value="4">
                <button class="btn btn-sm btn-outline-primary childLessonButton" type="button">과외현황</button>
              </div>
            </div>
          </div>

          <div class="childAddButtonDiv mb-3 parentsDisplay">
            <button type="button" class="btn btn-outline-primary childAddButton">추가</button>
          </div>


          <div class="form-check kakaotalkDiv parentsDisplay">
            <label class="form-check-label">
              <input id="kakaotalkCheckbox" class="form-check-input" type="checkbox" value="">
              과외 내용을 카톡으로 수신
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>

          <div class="modification-button-div pt-2 pb-2">
            <button class="btn btn-primary">수정</button>
          </div>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- 값 테스트용 출력 (디버깅 이후 지울 것)-->
<script>
  console.log('${memberInfoMap.teacher}');
  console.log('${memberInfoMap.lessonSubjects}');
  console.log('${memberInfoMap.parents}');
  console.log('${memberInfoMap.student}');
  console.log('${memberInfoMap.wantedLessons}');
</script>

<!-- 학생증, 신고서 인증 체크박스 -->
<script>
  if ('${loginUser.memberTypeNo}' == 3) {
    if ('${teacherUniversityConfirmation}' == 'true') {
      let studentIdchecked = document.getElementsByClassName('student-ID-checked')[0];
      studentIdchecked.style.display = 'inline-block';
    } else if ('${teacherUniversityConfirmation}' == 'false' || '${teacherUniversityConfirmation}' == '') {
      let studentIdUnchecked = document.getElementsByClassName('student-ID-unchecked')[0];
      studentIdUnchecked.style.display = 'inline-block';
    }

    if ('${memberInfoMap.teacher.approvementState}' == 'true') {
      let tutorCertichecked = document.getElementsByClassName('tutor-certi-checked')[0];
      tutorCertichecked.style.display = 'inline-block';
    } else if ('${memberInfoMap.teacher.approvementState}' == 'false' || '${teacherUniversityConfirmation}' == '') {
      let tutorCertiUnchecked = document.getElementsByClassName('tutor-certi-unchecked')[0];
      tutorCertiUnchecked.style.display = 'inline-block';
    }
  }
</script>

<!-- 선생님으로 로그인 시에 보여야 하는 항목만 출력-->
<script>
  if ('${loginUser.memberTypeNo}' == 3) {
    let studentIdSpan = document.getElementsByClassName('student-ID-span')[0];
    let tutorCertiSpan = document.getElementsByClassName('tutor-certi-span')[0];
    let myLessonBtnDisplay = document.getElementsByClassName('my-lesson-btn')[0];
    let teacherDisplay = document.getElementsByClassName('teacherDisplay');

    studentIdSpan.style.display = 'inline-block';
    tutorCertiSpan.style.display = 'inline-block';
    myLessonBtnDisplay.style.display = 'inline-block';

    for (let td of teacherDisplay)
      td.style.display = 'block';
  }
</script>

<!-- 학생으로 로그인 시에 보여야 하는 항목만 출력-->
<script>
  if ('${loginUser.memberTypeNo}' == 1) {
    let myLessonBtnDisplay = document.getElementsByClassName('my-lesson-btn')[0];
    let studentDisplay = document.getElementsByClassName('studentDisplay');

    myLessonBtnDisplay.style.display = 'inline-block';

    for (let sd of studentDisplay)
      sd.style.display = 'block';
  }
</script>

<!-- 학부모로 로그인 시에 보여야 하는 항목만 출력-->
<script>
  if ('${loginUser.memberTypeNo}' == 2) {
    let parentsDisplay = document.getElementsByClassName('parentsDisplay');

    for (let pd of parentsDisplay)
      pd.style.display = 'block';
  }
</script>

<!-- 쪽지함 버튼 -->
<script>
  let myMessageBtn = document.getElementsByClassName('my-message-btn')[0];
  myMessageBtn.addEventListener('click', (event) => {
    event.preventDefault();
  });

</script>

<!-- 나의 과외 버튼 -->
<script>
  let myLessonBtn = document.getElementsByClassName('my-lesson-btn')[0];
  myLessonBtn.addEventListener('click', (event) => {
    event.preventDefault();
    location.href = '/app/lesson/list?memberTypeNo=${loginUser.memberTypeNo}';
  });

</script>

<!-- 카톡 수신여부 체크박스 로딩 -->
<script>
  let kakaotalk = '${memberInfoMap.parents.kakaotalk}';
  if (kakaotalk == 'true') {
    $("input:checkbox[id='kakaotalkCheckbox']").prop("checked", true);
  }
</script>

<!-- 수업 요일 체크박스 로딩 -->
<script>
  let day = '${loginUser.lessonDays}';
  let array = day.split("");
  for (var i = 0; i < array.length; i++) {
    if (array[i] == 1) {
      $("input:checkbox[id='OPTI_" + (i + 1) + "']").prop("checked", true);
    }
  }   
</script>

<!-- 희망과목 제거 버튼 초기 세팅-->
<script>
  let removeSubjectButton = document.getElementsByClassName('remove-subject-button')[0];

  // 희망과목을 0개 이하로 지울 수 없게 방지하는 카운트 설정
  let subjectCount = 0;

  let addRemoveEventTo = function (thisBtn) {
    thisBtn.addEventListener('click', (event) => {
      if (subjectCount == 1)
        return;

      let thisSubjectNode = thisBtn.parentNode.parentNode;
      thisSubjectNode.parentNode.removeChild(thisSubjectNode);

      subjectCount--;
    });
  }

  // 희망과목 삭제 버튼에 이벤트 등록
  addRemoveEventTo(removeSubjectButton);

</script>

<!-- 희망과목 추가 버튼 -->
<script>
  let subjectAddButton = document.getElementsByClassName('subjectAddButton')[0];

  let addSubjectNode = function () {
    // 페이지 로딩 시에 기존에 만들어둔 원본 wantedSubjects를 복사하여 템플릿으로 보관
    let wantedSubjects = document.getElementsByClassName('wantedSubjects');
    let wantedSubjectTemplate = wantedSubjects[0].cloneNode(true);

    // 원본 wantedSubjects div에서 subjectTemplate를 제거하여 템플릿은 정상적으로 화면에 보이게 설정
    wantedSubjectTemplate.setAttribute('class', 'form-group row wantedSubjects');

    // 희망과목의 부모 노드 중에서 가장 마지막 자식의 앞에 준비해둔 wantedSubjectTemplate를 insert
    wantedSubjects[0].parentNode.insertBefore(wantedSubjectTemplate, wantedSubjects[wantedSubjects.length - 1].nextSibling);
    subjectCount++;

    // 새로 생긴 과목의 제거 버튼에 추가로 이벤트 리스너를 등록
    addRemoveEventTo(wantedSubjectTemplate.childNodes[1].childNodes[3]);

    // 새로 과목을 추가한 후 나중에 값을 세팅할 것을 대비해 이 템플릿을 리턴
    return wantedSubjectTemplate;
  }

  subjectAddButton.addEventListener('click', () => {
    addSubjectNode();
  });

</script>

<!-- 선생님 희망과목의 값을 가져와 스크립트용 리스트에 넣는 부분 -->
<script>
  if ('${loginUser.memberTypeNo}' == 3) {
    var myTeacherLessonSchools = new Array();
    var myTeacherLessonSubjects = new Array();
    var myTeacherLessonFees = new Array();
  }
</script>
<c:forEach items="${memberInfoMap.lessonSubjects}" var="lessonSubject">
  <script>
    if ('${loginUser.memberTypeNo}' == 3) {
      myTeacherLessonSchools.push('${lessonSubject.subjects[0].schoolTypeNo}');
      myTeacherLessonSubjects.push('${lessonSubject.subjectNo}');
      myTeacherLessonFees.push('${lessonSubject.wantedFee}');
    }
  </script>
</c:forEach>

<!-- 선생님 희망과목에 초기값 세팅 -->
<script>
  if ('${loginUser.memberTypeNo}' == 3) {
    //fn:은 jstl의 라이브러리 이므로 import 하는 것 잊지 말것
    for (let i = 0; i < '${fn:length(memberInfoMap.lessonSubjects)}'; i++) {
      let addedSubjectObject = addSubjectNode();
      let options = addedSubjectObject.childNodes[3].childNodes;

      let selSchool = options[1];
      let selSubject = options[3];
      let selFee = options[5];

      selSchool.selectedIndex = myTeacherLessonSchools[i] - 1;
      selSubject.selectedIndex = (myTeacherLessonSubjects[i] % 3 == 0 ? 3 : myTeacherLessonSubjects[i] % 3) - 1;
      selFee.selectedIndex = myTeacherLessonFees[i] - 1;
    }
  }
</script>

<!-- 학생 희망과목의 값을 가져와 스크립트용 리스트에 넣는 부분 -->
<script>
  if ('${loginUser.memberTypeNo}' == 1) {
    var myStudentLessonSchools = new Array();
    var myStudentLessonSubjects = new Array();
    var myStudentLessonFees = new Array();
  }
</script>
<c:forEach items="${memberInfoMap.wantedLessons}" var="wantedLesson">
  <script>
    if ('${loginUser.memberTypeNo}' == 1) {
      myStudentLessonSchools.push('${wantedLesson.subjects[0].schoolTypeNo}');
      myStudentLessonSubjects.push('${wantedLesson.subjectNo}');
      myStudentLessonFees.push('${wantedLesson.wantedFee}');
    }
  </script>
</c:forEach>

<!-- 학생 희망과목에 초기값 세팅 -->
<script>
  if ('${loginUser.memberTypeNo}' == 1) {
    //fn:은 jstl의 라이브러리 이므로 import 하는 것 잊지 말것
    for (let i = 0; i < '${fn:length(memberInfoMap.wantedLessons)}'; i++) {
      let addedSubjectObject = addSubjectNode();
      let options = addedSubjectObject.childNodes[3].childNodes;

      let selSchool = options[1];
      let selSubject = options[3];
      let selFee = options[5];

      selSchool.selectedIndex = myStudentLessonSchools[i] - 1;
      selSubject.selectedIndex = (myStudentLessonSubjects[i] % 3 == 0 ? 3 : myStudentLessonSubjects[i] % 3) - 1;
      selFee.selectedIndex = myStudentLessonFees[i] - 1;
    }
  }
</script>




<!-- 자녀ID 제거 버튼 초기 세팅-->
<script>
  let removeChildIdButton = document.getElementsByClassName('remove-childId-button')[0];

  // 희망과목을 0개 이하로 지울 수 없게 방지하는 카운트 설정
  let childIdCount = 0;

  let addRemoveChildIdEventTo = function (thisBtn) {
    thisBtn.addEventListener('click', (event) => {
      if (childIdCount == 1)
        return;

      let thisChildIdNode = thisBtn.parentNode.parentNode;
      thisChildIdNode.parentNode.removeChild(thisChildIdNode);

      childIdCount--;
    });
  }

  // 희망과목 삭제 버튼에 이벤트 등록
  addRemoveChildIdEventTo(removeChildIdButton);

</script>

<!-- 자녀ID 추가 버튼 -->
<script>
  let childAddButton = document.getElementsByClassName('childAddButton')[0];

  let addChildIdNode = function () {
    // 페이지 로딩 시에 기존에 만들어둔 원본 wantedSubjects를 복사하여 템플릿으로 보관
    let childrendId = document.getElementsByClassName('childId');
    let childIdTemplate = childrendId[0].cloneNode(true);

    // 원본 wantedSubjects div에서 subjectTemplate를 제거하여 템플릿은 정상적으로 화면에 보이게 설정
    childIdTemplate.setAttribute('class', 'form-group row childId pt-1');

    // 희망과목의 부모 노드 중에서 가장 마지막 자식의 앞에 준비해둔 wantedSubjectTemplate를 insert
    childrendId[0].parentNode.insertBefore(childIdTemplate, childrendId[childrendId.length - 1].nextSibling);
    childIdCount++;

    // 새로 생긴 과목의 제거 버튼에 추가로 이벤트 리스너를 등록
    addRemoveChildIdEventTo(childIdTemplate.childNodes[1].childNodes[3]);

    // 새로 과목을 추가한 후 나중에 값을 세팅할 것을 대비해 이 템플릿을 리턴
    return childIdTemplate;
  }

  childAddButton.addEventListener('click', () => {
    addChildIdNode();
  });

</script>

<!-- 학부모 자녀아이디의 값을 가져와 스크립트용 리스트에 넣는 부분 -->
<script>
    if ('${loginUser.memberTypeNo}' == 2) {
      var myParentsChildrenId = new Array();
    }
  </script>
  <c:forEach items="${memberInfoMap.parents.students}" var="student">
    <script>
      if ('${loginUser.memberTypeNo}' == 2) {
        myParentsChildrenId.push('${student.id}');
      }
    </script>
  </c:forEach>
  
  <script>
    for (let i = 0; i < myParentsChildrenId.length; i++) {
      let addedChildIdObject = addChildIdNode();
      let childIdInput = addedChildIdObject.childNodes[3].childNodes[1].childNodes[1];

      childIdInput.value = myParentsChildrenId[i];
    }
  </script>


<!-- 다음 주소 찾기 라이브러리-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 찾기 버튼 이벤트 등록 -->
<script>
  let addressSearchButton = document.getElementById('addressSearchButton');

  addressSearchButton.addEventListener('click', function () {
    new daum.Postcode({
      oncomplete: function (data) {
        document.getElementById('inputAddress').value = data.sido;
        document.getElementById('inputAddress2').value = data.sigungu;
      }
    }).open();
  });
</script>