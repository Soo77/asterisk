<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/assets/demo/demo.css" rel="stylesheet" />
<link href="/css/mypage/detail.css" rel="stylesheet" />

<style>

</style>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>관리자 페이지</h1>
          <h3 class="title text-center">과외 중단</h3>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised profile-page">
  <div class="container pt-3">
    <div class="row-fluid">
      <div class="col">

        <h3>학생 정보</h3>
        <hr>
        <div class="form-group">
          <label for="stdId">이름</label>
          <input type="text" class="form-control" id="stdName" value="${pendingLessonsInfoMapDetail.studentInfo.name}" readonly>
        </div>

        <div class="form-group">
          <label for="stdEmail1">이메일</label>
          <input type="text" class="form-control" id="stdEmail1" value="${pendingLessonsInfoMapDetail.studentInfo.email}" name="stdEmail1"
            readonly>
        </div>
        
        <div class="form-group">
          <label for="stdStopReason">학생 중단 사유</label>
          <textarea class="form-control" id="stdStopReason" rows="8" name="stdStopReason"
              readonly>${pendingLessonsInfoMapDetail.lessonInfo.studentStopReason}</textarea>
        </div>
        
        <h3>선생님 정보</h3>
        <hr>
        <div class="form-group">
          <label for="tchName">이름</label>
          <input type="text" class="form-control" id="tchName" value="${pendingLessonsInfoMapDetail.teacherInfo.name}"readonly>
        </div>

        <div class="form-group">
          <label for="tchEmail1">이메일</label>
          <input type="text" class="form-control" id="tchEmail1" value="${pendingLessonsInfoMapDetail.teacherInfo.email}" name="tchEmail1"
            readonly>
        </div>
        
        <div class="form-group">
          <label for="tchStopReason">선생님 중단 사유</label>
          <textarea class="form-control" id="tchStopReason" rows="8" name="tchStopReason"
              readonly>${pendingLessonsInfoMapDetail.lessonInfo.teacherStopReason}</textarea>
        </div>
        
        <h3>수업 정산</h3>
        <hr>
        
        <div class="pt-2 pb-2 text-right">
          <button type="button" class="btn btn-danger">중단 승인</button>
        </div>
        
        
      </div>
      

<!--           <div class="form-group">
            <label for="inputDateOfBirth">생년월일</label>
            <input type="date" class="form-control" id="inputDateOfBirth" value="${thisMember.dateOfBirth}" readonly>
          </div>

          <label for="addressSearchButton">주소</label>
          <div class="form-group row pt-1 mb-0">
            <div class="col">
              <div class="d-flex">
                <div class="flex-item" style="flex-basis: 100%">
                  <input type="text" id="inputAddress" class="form-control" readonly value="${thisMember.addressCity}"
                    name="addressCity">
                </div>
                <div class="flex-item" style="flex-basis: 7%; display: none;">
                  <button class="btn btn-sm btn-outline-primary" type="button" id="addressSearchButton">주소검색</button>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group pt-1">
            <label for="inputAddress2" id="address2-label" class="col-sm-2 col-form-label"></label>
            <input type="text" class="form-control" id="inputAddress2" value="${thisMember.addressSuburb}" readonly
              name="addressSuburb">
          </div>

          <div class="form-group">
            <label for="inputTel">전화번호</label>
            <input type="text" class="form-control" id="inputTel" value="${thisMember.tel}" name="tel" readonly>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputBankName">은행명</label>
            <select class="form-control selectpicker" data-style="btn btn-link" id="inputBankName" name="bankName"
              readonly>
              <option selected>은행선택</option>
              <option value="KB">국민은행</option>
              <option value="Woori">우리은행</option>
              <option value="Shinhan">신한은행</option>
              <option value="kakao">카카오뱅크</option>
            </select>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputAccountNo">계좌번호</label>
            <input type="text" class="form-control" id="inputAccountNo"
              value="${memberInfoMapForDetail.teacher.accountNo}" name="accountNo" readonly>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputHighSchool">고등학교</label>
            <c:forEach items="${memberInfoMapForDetail.teacher.schools}" var="school">
              <c:if test="${school.schoolTypeNo eq 3}">
                <input type="text" class="form-control" id="inputHighSchool" value="${school.schoolName}" readonly>
              </c:if>
            </c:forEach>
          </div>
          <div class="form-group teacherDisplay">
            <label for="inputUniversity">대학교</label>
            <c:forEach items="${memberInfoMapForDetail.teacher.schools}" var="school">
              <c:if test="${school.schoolTypeNo eq 4}">
                <c:set var="teacherUniversityConfirmation" value="${school.confirmed}" />
                <input type="text" class="form-control" id="inputUniversity" value="${school.schoolName}" readonly>
              </c:if>
            </c:forEach>
          </div>

          <div class="form-group row teacherDisplay">
            <div class="col">
              <label for="inputPhotos" class="mb-3">사진 업로드</label>
              <div class="d-flex photo-add-div">
                <div id="my-image-wrapper" class="col image-wrapper text-center">

                </div>
              </div>
              <div class="d-flex photo-add-button btn btn-outline-primary mx-0 my-0 px-0 py-0"
                style="border-top-left-radius: 0; border-top-right-radius: 0; border-top-width: 0px;">
                <button type="button" class="btn btn-outline-primary mx-0 my-0"
                  style="flex-basis: 100%; box-shadow: none; border: 0;">
                  사진 등록
                </button>
              </div>
            </div>
          </div>


          <div class="form-group row wantedSubjects subjectTemplate">
            <div class="col-sm-2 mt-1 mb-0 form-group">
              <label for="inputSubject" class="wantedSubjectLabel col-form-label">희망과목</label>&nbsp;&nbsp;
              <button type="button"
                class="btn btn-outline-primary btn-sm px-3 mb-1 remove-subject-button"><strong>&minus;</strong></button>
            </div>
            <div class="col-sm-10 d-flex">
              <select class="form-control pt-0 mx-1 wantedSubject-school" name="schoolTypeNo" readonly>
                <option value=1>초등학교</option>
                <option value=2>중학교</option>
                <option value=3>고등학교</option>
              </select>
              <select class="form-control pt-0 mx-1 wantedSubject-subject" name="subjectNo" readonly>
                <option value=1>국어</option>
                <option value=2>영어</option>
                <option value=3>수학</option>
                <option value=4>과학</option>
                <option value=5>사회</option>
              </select>
              <select class="form-control pt-0 ml-1 wantedSubject-fee" name="wantedFee" readonly>
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
                  <input class="form-check-input" type="checkbox" id="OPTI_1" name="lessonDay" value="0" readonly> 일
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_2" name="lessonDay" value="1" readonly> 월
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_3" name="lessonDay" value="2" readonly> 화
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_4" name="lessonDay" value="3" readonly> 수
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_5" name="lessonDay" value="4" readonly> 목
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_6" name="lessonDay" value="5" readonly> 금
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_7" name="lessonDay" value="6" readonly> 토
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            </div>
          </div>

          <div class="form-group teacherDisplay studentDisplay">
            <label for="subject-start-time">과외 시작시간</label><br>
            <input type='time' value='${thisMember.lessonStartTime}' id="subject-start-time" class="form-control"
              name="lessonStartTime" readonly />
          </div>

          <div class="form-group teacherDisplay studentDisplay">
            <label for="subject-end-time">과외 종료시간</label><br>
            <input type='time' value='${thisMember.lessonEndTime}' id="subject-end-time" class="form-control"
              name="lessonEndTime" readonly />
          </div>

          <div class="form-group studentDisplay">
            <label for="inputRequirements">과외 희망사항</label>
            <textarea class="form-control" id="inputRequirements" rows="8" name="requirementsToTeacher"
              readonly>${memberInfoMapForDetail.student.requirementsToTeacher}</textarea>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputIntro">자기소개</label>
            <textarea class="form-control" id="inputIntro" rows="8" name="teacherIntro"
              readonly>${memberInfoMapForDetail.teacher.teacherIntro}</textarea>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputIntroVideo">자기소개 동영상 주소</label>
            <input type="text" class="form-control" id="inputIntroVideo"
              value="${memberInfoMapForDetail.teacher.videoAddress}" name="videoAddress" readonly>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputIntroVideo" class="teacherDisplay">과외 신고서</label>
            <img src='/upload/join/${memberInfoMapForDetail.teacher.lessonCertificate}' id="teacher-certi"
              onerror="this.style.display='none'">
          </div>

          <label class="parentsDisplay">자녀 목록</label>
          <div class="form-group row childId mb-2 pt-1 childIdTemplate">
            <div class="col-sm-2 mb-0 form-group">
              <label for="inputChildId" class="childIdLabel">자녀ID</label>&nbsp;&nbsp;
              <button type="button"
                class="btn btn-outline-primary btn-sm px-3 mb-1 remove-childId-button"><strong>&minus;</strong></button>
            </div>
            <div class="col-sm-10 mt-1 d-flex">
              <div class="flex-item pr-1" style="flex-basis: 100%;">
                <input type="text" class="form-control" readonly value="hong111" name="childrenId" readonly>
              </div>
              <div class="flex-item" style="flex-basis: 7%; display: none;">
                <input type="hidden" value="4">
                <button class="btn btn-sm btn-outline-primary childLessonButton" type="button">과외현황</button>
              </div>
            </div>
          </div>

          <div class="childAddButtonDiv mb-3 parentsDisplay">
            <button type="button" class="btn btn-outline-primary childAddButton">추가</button>
          </div>

          <div class="pt-2 pb-2 text-right">
            <button type="button" class="btn btn-primary certi-appr-btn">신고서인증</button>
            <button type="button" class="btn btn-primary reject-this-member">회원정지</button>
            <button type="button" class="btn btn-primary accept-this-member">정지해제</button>
          </div>
        </form> -->
    </div>
  </div>
</div>

