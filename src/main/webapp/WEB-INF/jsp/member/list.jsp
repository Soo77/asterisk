<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
</head>
<style>
  .btn.btn-primary {
    color: #fff;
    background-color: #9c27b0;
    border-color: #9c27b0;
    box-shadow: 0 2px 2px 0 rgba(156, 39, 176, 0.14), 0 3px 1px -2px rgba(156, 39, 176, 0.2), 0 1px 5px 0 rgba(156, 39, 176, 0.12) inset;
    /*  box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; */
  }

  .btn.btn-primary.gender {
    width: 48%;
  }

  .btn.btn-primary.wantedFee {
    width: 48%;
  }

  .btn.btn-primary.btn-round {
    width: 60%;
    left: 20%;
    margin-top: 20px;
  }

  .col-lg-9.col-md-8 {
    padding-left: 50px;
  }

  .listpage {
    padding-top: 40px;
    padding-bottom: 40px;
  }

  .img-raised.rounded-circle.img-fluid {
    width: 120px !important;
    height: 120px !important;
    object-fit: cover;
  }

  .tim-note {
    text-transform: none;
  }

  .btn-primary:not (:disabled):not (.disabled):active,
  .btn-primary:not (:disabled):not (.disabled).active,
  .show>.btn-primary.dropdown-toggle {
    color: #ffffff;
    background-color: #52155d;
    border-color: #52155d;
  }
</style>

<body>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/bg/bg20.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <c:if test="${memberTypeNo == 1}">
              <h1 class="title">
                <span class="tim-note">학생 찾기</span>
              </h1>
            </c:if>
            <c:if test="${memberTypeNo == 3}">
              <h1 class="title">
                <span class="tim-note">선생님 찾기</span>
              </h1>
            </c:if>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container">
      <div class="listpage">

        <!-- DataTables -->
        <div class="row">

          <!-- Sidebar ================================================== -->
          <div class="col-lg-3 col-md-4">
            <div class="sidemenubar" id="sideMenuBar">
              <form name="form1" id="form1">
                <input type="hidden" name="memberTypeNo" id="memberTypeNo" value="${memberTypeNo}"> <input type="hidden"
                  name="mySido" id="mySido" value="">
                <input type="hidden" name="myGugun" id="myGugun" value=""> <input type="hidden" name="myGender"
                  id="myGender" value=""> <input type="hidden" name="myAge" id="myAge" value=""> <input type="hidden"
                  name="myWantedFee" id="myWantedFee" value=""> <input type="hidden" name="mySchool" id="mySchool"
                  value=""> <input type="hidden" name="mySubject" id="mySubject" value="">
              </form>


              <label class="address title">지역</label>
              <div class="address">
                <select class="custom-select" name="sido1" id="sido1"></select>
                <select class="custom-select" name="gugun1" id="gugun1"></select>
              </div>


              <label class="gender title">성별</label>
              <div class="btn-group-toggle">
                <label class="btn btn-primary gender my-gender-btn disabled">
                  <input class="form-check-input" type="radio" name="gender" id="gender_1" value="M"> 남자
                </label>
                <label class="btn btn-primary gender my-gender-btn disabled">
                  <input class="form-check-input" type="radio" name="gender" id="gender_2" value="F"> 여자
                </label>
              </div>

              <label class="lessons_fee title">수업료</label>
              <div class="btn-group-toggle">
                <label class="btn btn-primary wantedFee my-fee-btn disabled">
                  <input class="form-check-input" type="radio" name="wantedFee" id="wantedFee1" value="1"> 20만원 이하
                </label>
                <label class="btn btn-primary wantedFee my-fee-btn disabled">
                  <input class="form-check-input" type="radio" name="wantedFee" id="wantedFee2" value="2"> 20~30 만원
                </label>
                <label class="btn btn-primary wantedFee my-fee-btn disabled">
                  <input class="form-check-input" type="radio" name="wantedFee" id="wantedFee3" value="3"> 30~40 만원
                </label>
                <label class="btn btn-primary wantedFee my-fee-btn disabled">
                  <input class="form-check-input" type="radio" name="wantedFee" id="wantedFee4" value="4"> 40만원 이상
                </label>
              </div>


              <label class="subject title">과목으로 찾기</label>
              <div class="checkbox-container checkbox-container-four active">
                <select class="custom-select" name="school1" id="school1"></select> <select class="custom-select"
                  name="subject1" id="subject1"></select>
              </div>

              <div class="button search">
                <button class="btn btn-primary btn-round my-button-yeah">조건
                  검색</button>
              </div>

            </div>
          </div>
          <!-- Sidebar / End -->

          <!-- contents ================================================== -->
          <div class="col-lg-9 col-md-8">
            <div class="row">
              <div class="col-lg-10 col-md-10 col-sm-10"></div>
              <div class="col-lg-2 col-md-2 col-sm-2">
                <div class="input-group">
                  <select class="custom-select custom-select-sm" id="pageSize">
                    <option value="2">2</option>
                    <option value="8">8</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                  </select>
                </div>
              </div>
            </div>


            <c:if test="${memberTypeNo eq 3}">
              <div class="my-lesson-wrapper">
                <c:forEach items="${memberList}" var="member" begin="${pagination.pageSize * (pagination.curPage - 1)}"
                  end="${pagination.pageSize * pagination.curPage - 1}">
                  <a href="detail?no=${member.memberNo}">
                    <div class="card-body">
                      <div class="cardcard mb-3">
                        <div class="row no-gutters">
                          <div class="col-md-3">

                            <img src="/upload/join/${member.profilePhoto}" alt="Thumbnail Image"
                              class="img-raised rounded-circle img-fluid" onError="this.src='/upload/join/default.png'">
                          </div>
                          <div class="col-md-9">
                            <h5 class="title">
                              <span class="tim-note">${member.name}</span>
                            </h5>
                            <h5>
                              <span class="tim-note">
                                ${member.gender}/ ${member.addressCity}
                                ${member.addressSuburb}/
                                ${member.schoolType}/
                                ${member.subjectName} </span>
                            </h5>
                          </div>
                        </div>
                      </div>
                    </div>
                  </a>
                  <hr>
                </c:forEach>
              </div>
            </c:if>

            <c:if test="${memberTypeNo eq 1}">
              <div class="my-lesson-wrapper">
                <c:forEach items="${memberList}" var="member" begin="${pagination.pageSize * (pagination.curPage - 1)}"
                  end="${pagination.pageSize * pagination.curPage - 1}">
                  <a href="detail?no=${member.memberNo}">
                    <div class="card-body">
                      <div class="cardcard mb-3">
                        <div class="row no-gutters">
                          <div class="col-md-3">
                            <img src="/upload/join/${member.profilePhoto}" alt="Thumbnail Image"
                              class="img-raised rounded-circle img-fluid" onError="this.src='/upload/join/default.png'">
                          </div>
                          <div class="col-md-9">
                            <h5 class="title">
                              <span class="tim-note">${member.name}</span>
                            </h5>
                            <h5>
                              <span class="tim-note">
                                ${member.gender}/ ${member.addressCity}
                                ${member.addressSuburb}/
                                ${member.schoolType}/
                                ${member.subjectName} </span>
                            </h5>
                          </div>
                        </div>
                      </div>
                    </div>
                  </a>
                  <hr>
                </c:forEach>
              </div>
            </c:if>

            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <c:if test="${pagination.curPage ne 1}">
                  <li class="page-item"><a class="page-link"
                      href="list?memberTypeNo=${memberTypeNo}&pageSize=${pageSize}&amp;curPage=${pagination.prevPage}">&laquo;</a>
                  </li>
                </c:if>

                <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                  <c:choose>
                    <c:when test="${pageNum eq  pagination.curPage}">
                      <li class="page-item active" aria-current="page"><a class="page-link"
                          href="list?memberTypeNo=${memberTypeNo}&pageSize=${pageSize}&amp;curPage=${pageNum}">${pageNum}</a>
                      </li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item"><a class="page-link" style="color: #000000;"
                          href="list?memberTypeNo=${memberTypeNo}&pageSize=${pageSize}&amp;curPage=${pageNum}">${pageNum}</a>
                      </li>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>

                <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                  <li class="page-item"><a class="page-link"
                      href="list?memberTypeNo=${memberTypeNo}&pageSize=${pageSize}&amp;curPage=${pagination.nextPage}">&raquo;</a>
                  </li>
                </c:if>
              </ul>
            </nav>

          </div>
          <!-- contents / End -->

        </div>
        <!-- row / End -->
      </div>
    </div>
  </div>

  <!-- paging -->
  <script>
    (function () {
      $('#pageSize').val('${pageSize}')
    })();


    $('#pageSize').change((e) => {
      location.href = "list?memberTypeNo=" + ${ memberTypeNo } + "&pageSize=" + $(e.target).val();
    });
  </script>

  <!-- 주소/상세주소 구하기 -->
  <script type="text/javascript">
    $('document')
      .ready(
        function () {
          var area0 = ["시/도 선택", "서울", "인천", "대전", "광주",
            "대구", "울산", "부산", "세종특별자치시", "경기", "강원", "충북", "충남",
            "전북", "전남", "경북", "경남", "제주특별자치도"];
          var area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구",
            "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구",
            "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구",
            "중구", "중랑구"];
          var area2 = ["계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구",
            "중구", "강화군", "옹진군"];
          var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
          var area4 = ["광산구", "남구", "동구", "북구", "서구"];
          var area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
          var area6 = ["남구", "동구", "북구", "중구", "울주군"];
          var area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구",
            "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구",
            "기장군"];
          var area8 = []
          var area9 = ["가평군", "고양시", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구", "과천시", "광명시",
            "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "성남시 분당구",
            "성남시 수정구", "성남시 중원구", "수원시", "수원시 권선구", "수원시 영통구", "수원시 장안구", "수원시 팔달구",
            "시흥시", "안산시", "안산시 단원구", "안산시 상록구", "안성시", "안양시", "안양시 동안구", "안양시 만안구",
            "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "용인시 기흥구", "용인시 수지구", "용인시 처인구",
            "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
          var area10 = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시",
            "인제시", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];
          var area11 = ["제천시", "청주시", "청주시 상당구", "청주시 서원구", "청주시 청원구", "청주시 흥덕구",
            "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군"];
          var area12 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "천안시 동남구",
            "천안시 서북구", "금산군", "당진시", "부여군", "서천군", "예산군", "청양군", "태안군", "홍성군"];
          var area13 = ["군산시", "김제시", "남원시", "익산시", "전주시", "전주시 덕진구", "전주시 완산구",
            "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
          var area14 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군",
            "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군",
            "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
          var area15 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시",
            "영주시", "영천시", "포항시", "포항시 남구", "포항시 북구", "고령군", "군위군", "봉화군", "성주군", "영덕군",
            "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
          var area16 = ["거제시", "김해시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시",
            "창원시 마산합포구", "창원시 마산회원구", "창원시 성산구", "창원시 의창구", "창원시 진해구", "통영시", "거창군",
            "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
          var area17 = ["서귀포시", "제주시"];

          // 시/도 선택 박스 초기화
          $("select[name^=sido]").each(
            function () {
              $selsido = $(this);
              $.each(eval(area0), function (index, item) {
                if (index == 0) {
                  $selsido.append("<option value=''>" + this
                    + "</option>");

                } else {
                  $selsido.append("<option value='" + this + "'>" + this
                    + "</option>");
                }

              });
              $selsido.next()
                .append("<option value=''>구/군 선택</option>");
            });

          // 시/도 선택시 구/군 설정 
          $("select[name^=sido]").change(
            function () {
              var area = "area"
                + $("option", $(this)).index(
                  $("option:selected", $(this))); // 선택지역의 구군 Array
              var $gugun = $(this).next(); // 선택영역 군구 객체
              $("option", $gugun).remove(); // 구군 초기화

              if (area == "area0")
                $gugun.append("<option value=''>구/군 선택</option>");
              else {
                $.each(eval(area), function () {
                  $gugun.append("<option value='" + this + "'>" + this
                    + "</option>");
                });
              }
            });

        });
  </script>

  <!-- 학교/과목 선택 -->
  <script type="text/javascript">
    $('document').ready(
      function () {
        var area0 = ["학교 선택", "초등학교", "중학교", "고등학교"];
        var area1 = ["국어", "영어", "수학"];
        var area2 = ["국어", "영어", "수학"];
        var area3 = ["국어", "영어", "수학"];

        // 학교 선택 박스 초기화
        $("select[name^=school]").each(
          function () {
            $selschool = $(this);
            $.each(eval(area0), function (index, item) {
              if (index == 0) {
                $selschool.append("<option value=''>" + this
                  + "</option>");

              } else {
                $selschool.append("<option value='" + index + "'>" + this
                  + "</option>");

              }
            });
            $selschool.next().append("<option value=''>과목 선택</option>");

          });

        // 학교 선택시 과목 설정 

        $("select[name^=school]").change(
          function () {
            var area = "area"
              + $("option", $(this)).index(
                $("option:selected", $(this))); // // 선택지역의 과목 Array
            var $subject = $(this).next(); // 선택영역 과목 객체
            $("option", $subject).remove(); // 과목 초기화

            if (area == "area0")
              $subject.append("<option value=''>과목 선택</option>");
            else {
              $.each(eval(area), function () {
                $subject.append("<option value='" + this + "'>" + this
                  + "</option>");
              });
            }
          });

      });
  </script>


  <script>
    var goView = function (data) {
    }

  </script>

  <!-- 조건 선택 값 구하기 -->
  <script>
    $(document).ready(function () {
      $(".my-button-yeah").click(function () {


        $("#myGugun").val($('select[name="gugun1"]').val());
        $("#myGender").val($('input[name="gender"]:checked').val());
        $("#myWantedFee").val($('input[name="wantedFee"]:checked').val());
        $("#mySchool").val($('select[name="school1"]').val());
        $("#mySubject").val($('select[name="subject1"]').val());
        $("#mySido").val($('select[name="sido1"]').val());

        let memberTypeNo = $("#memberTypeNo").val();
        let myGugun = $("#myGugun").val();
        let myGender = $("#myGender").val();
        let myWantedFee = $("#myWantedFee").val();
        let mySchool = $("#mySchool").val();
        let mySubject = $("#mySubject").val();
        let mySido = $("#mySido").val();

        var params = {
          'memberTypeNo': memberTypeNo,
          'myGugun': myGugun,
          'myGender': myGender,
          'myWantedFee': myWantedFee,
          'mySchool': mySchool,
          'mySubject': mySubject,
          'mySido': mySido,
        };

        $.ajax({
          type: "GET",
          url: "/app/member/search",
          data: params,
          success: function (resultList) {

            console.log(resultList);
            let html = '';

            for (let i = 0; i < resultList.length; i++) {


              if (memberTypeNo) {
                html += '<a href="detail?no=' + resultList[i].memberNo + '">';
                html += '<div class="card-body">';
                html += '<div class="cardcard mb-3">';
                html += '<div class="row no-gutters">';
                html += '<div class="col-md-3">';
                html += '<img src="/upload/join/' + resultList[i].profilePhoto + '" alt="Thumbnail Image"';
                html += 'class="img-raised rounded-circle img-fluid" onError="this.src=\'/upload/join/default.png\'">';
                html += '</div>';
                html += '<div class="col-md-9">';
                html += '<h5 class="title">';
                html += '<span class="tim-note">' + resultList[i].name + '</span>';
                html += '</h5>';
                html += '<h5>';
                html += '<span class="tim-note">';
                html += '' + resultList[i].gender + '/ ' + resultList[i].addressCity + ' ';
                html += '' + resultList[i].addressSuburb + '/ ';
                html += '' + resultList[i].schoolType + '/ ';
                html += '' + resultList[i].subjectName + '';
                html += '</span>';
                html += '</h5>';
                html += '</div>';
                html += '</div>';
                html += '</div>';
                html += '</div>';
                html += '</a>';
                html += '<hr>';
                console.log("memberTypeNo===>" + memberTypeNo);
                console.log("resultList[i].memberNo==>" + resultList[i].memberNo);
                console.log("resultList[i].profilePhoto==>" + resultList[i].profilePhoto);
                console.log("resultList[i].id==>" + resultList[i].id);
                console.log("resultList[i].gender==>" + resultList[i].gender);
                console.log("resultList[i].addressCity==>" + resultList[i].addressCity);
                console.log("resultList[i].addressSuburb==>" + resultList[i].addressSuburb);
                console.log("resultList[i].schoolType==>" + resultList[i].schoolType);
                console.log("resultList[i].subjectName==>" + resultList[i].subjectName);

              }
            }

            $('.my-lesson-wrapper').html('');
            $('.my-lesson-wrapper').append(html);

          },
          error: function (error) {
            alert(error);
          }
        });

      });
    });

  </script>

  <script>
    let genderButtons = document.getElementsByClassName('my-gender-btn');
    let feeButtons = document.getElementsByClassName('my-fee-btn');



    genderButtons[0].addEventListener('click', () => {
      genderButtons[1].setAttribute('class', 'btn btn-primary gender my-gender-btn disabled');
      genderButtons[0].setAttribute('class', 'btn btn-primary gender my-gender-btn');
    });

    genderButtons[1].addEventListener('click', () => {
      genderButtons[0].setAttribute('class', 'btn btn-primary gender my-gender-btn disabled');
      genderButtons[1].setAttribute('class', 'btn btn-primary gender my-gender-btn');
    });

    feeButtons[0].addEventListener('click', () => {
      feeButtons[1].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[2].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[3].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[0].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn');
    });
    feeButtons[1].addEventListener('click', () => {
      feeButtons[0].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[2].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[3].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[1].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn');
    });
    feeButtons[2].addEventListener('click', () => {
      feeButtons[0].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[1].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[3].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[2].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn');
    });
    feeButtons[3].addEventListener('click', () => {
      feeButtons[0].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[1].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[2].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn disabled');
      feeButtons[3].setAttribute('class', 'btn btn-primary wantedFee my-fee-btn');
    });



  </script>


</body>

</html>