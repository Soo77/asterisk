<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>


  <!-- 프로필 사진 modal -->
  <div class="modal" id="menu-profilePhotoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="container">
      <div class="modal-dialog-fluid modal-dialog-centered" role="document">
        <div class="row" style="float: none; margin: 0 auto;">
          <div class="col">
            <div class="modal-header" style="border: none;">
              <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true" style="color: white;">×</span>
              </button>
            </div>
            <img id="menu-profilePhotoOriginalSize" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Mypage Modal -->
  <div class="modal bd-example-modal-lg" id="mypageModal" tabindex="-1" role="dialog"
    aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="memberInfoModal">회원 정보</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="contatiner">
            <div class="row">
              <div class="col">
                <form>
                  <div class="form-group">
                    <label for="inputId">아이디</label>
                    <input type="text" class="form-control" id="inputId" placeholder="hong111" readonly>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="inputPassword">비밀번호</label>
                      <input type="password" class="form-control" id="inputPassword" value="Password">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="inputPasswordCheck">비밀번호확인</label>
                      <input type="password" class="form-control" id="inputPasswordCheck" value="Password">
                    </div>
                  </div>

                  <div class="form-row align-items-end">
                    <div class="col">
                      <label for="inputEmail">이메일</label>
                      <input type="text" class="form-control mb-2" id="inputEmail" value="hong">
                    </div>
                    <div class="col">
                      <div class="input-group mb-2">
                        <div class="input-group-prepend">
                          <div class="input-group-text">@</div>
                        </div>

                        <input type="text" class="form-control" id="inputEmail2" value="test.com">
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputDateOfBirth">생년월일</label>
                    <input type="date" class="form-control" id="inputDateOfBirth" value='1970-01-01'>
                  </div>

                  <div class="form-group">
                    <label for="inputAddress">주소</label>
                    <div class="input-group mb-3">
                      <input type="text" id="inputAddress" class="form-control" readonly
                        aria-label="Recipient's username" aria-describedby="button-addon2">
                      <div class="input-group-append">
                        <button class="btn btn-outline-success" type="button" id="addressSearchButton">주소검색</button>
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputAddress2">상세주소</label>
                    <input type="text" class="form-control" id="inputAddress2" readonly>
                  </div>

                  <div class="form-group">
                    <label for="inputTel">전화번호</label>
                    <input type="text" class="form-control" id="inputTel" value="010-1234-5678">
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md">
                      <label for="inputBankName">은행명</label>
                      <select id="inputBankName" class="form-control">
                        <option selected>은행선택</option>
                        <option>국민은행</option>
                        <option>우리은행</option>
                        <option>신한은행</option>
                      </select>
                    </div>
                    <div class="form-group col-md">
                      <label for="inputAccountNo">계좌번호</label>
                      <input type="text" class="form-control" id="inputAccountNo" value="123-45-6789">
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md">
                      <label for="inputHighSchool">고등학교</label>
                      <input type="text" class="form-control" id="inputHighSchool" value="비트고등학교" readonly>
                    </div>
                    <div class="form-group col-md">
                      <label for="inputUniversity">대학교</label>
                      <input type="text" class="form-control" id="inputUniversity" value="비트대학교" readonly>
                    </div>
                  </div>

                  <div class="form-row wantedSubjects">
                    <div class="form-group col-md">
                      <label class="wantedSubjectLabel" for="inputSubject">희망과목</label>&nbsp;
                      <button type="button" class="btn btn-outline-success btn-sm"><strong>&minus;</strong></button>
                      <select class="form-control wantedSubject-school">
                        <option value=1>초등학교</option>
                        <option value=2>중학교</option>
                        <option value=3>고등학교</option>
                      </select>
                    </div>
                    <div class="form-group col-md align-self-end">
                      <select class="form-control wantedSubject-subject">
                        <option value=1>국어</option>
                        <option value=2>영어</option>
                        <option value=3>수학</option>
                        <option value=4>과학</option>
                        <option value=5>사회</option>
                      </select>
                    </div>
                    <div class="form-group col-md align-self-end">
                      <select class="form-control wantedSubject-fee">
                        <option value=1>20만원이하</option>
                        <option value=2>30만원~40만원</option>
                        <option value=3>20만원~30만원</option>
                        <option value=4>40만원이상</option>
                      </select>
                    </div>
                  </div>
                  <div class="subjectAddButtonDiv">
                    <button type="button"
                      class="btn btn-outline-success subjectAddButton">&nbsp;&nbsp;추가&nbsp;&nbsp;</button>
                  </div>
                  <br>


                  <div class="form-row">
                    <div class="form-group col-md">
                      <label for="inputSubjectDay">과외가능 요일</label><br>
                      <div class="temp">
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

                    <div class="form-group col-md">
                      <label for="inputSubjectTime">과외가능 시간</label><br>
                      <div class="d-inline-flex p-2 bd-highlight">
                        <input type='time' value='18:00' class="form-control" />
                      </div>
                      <div class="d-inline-flex p-2 bd-highlight">
                        ~
                      </div>
                      <div class="d-inline-flex p-2 bd-highlight">
                        <input type='time' value='20:00' class="form-control" />
                      </div>
                    </div>
                  </div>


                  <div class="form-group">
                    <label for="inputRequirements">선생님께 바라는점</label>
                    <textarea class="form-control" id="inputRequirements" rows="8"></textarea>
                  </div>

                  <div class="form-group">
                    <label for="inputIntro">자기소개</label>
                    <textarea class="form-control" id="inputIntro" rows="8"></textarea>
                  </div>

                  <div class="form-group">
                    <label for="inputIntroVideo">자기소개동영상</label>
                    <p class="h6">
                      <a
                        href="https://www.youtube.com/watch?v=eEXNY-fNZtc">https://www.youtube.com/watch?v=eEXNY-fNZtc</a>
                    </p>
                  </div>

                  <div class="form-row childId">
                    <div class="form-group col-md">
                      <label class="wantedSubjectLabel" for="inputChildId">자녀아이디</label>&nbsp;
                      <button type="button" class="btn btn-outline-success btn-sm"><strong>&minus;</strong></button>
                      <div class="input-group">
                        <input type="text" class="form-control" value="hong111" aria-label="Recipient's username"
                          aria-describedby="button-addon2">
                        <div class="input-group-append">
                          <button class="btn btn-outline-success" type="button" id="button-addon2">과외현황</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="childAddButtonDiv">
                    <button type="button"
                      class="btn btn-outline-success childAddButton">&nbsp;&nbsp;추가&nbsp;&nbsp;</button>
                  </div>
                  <br>
                  <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="kakaotalkCheckbox">
                    <label class="form-check-label" for="kakaotalkCheckbox">자녀의 과외 내용을 카톡으로 수신</label>
                  </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-success" href="#">수정</a>
        </div>
      </div>
    </div>
  </div>