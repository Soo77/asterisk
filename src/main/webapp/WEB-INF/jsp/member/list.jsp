<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님/학생 찾기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style>
row {
  margin-top: 15px;
  margin-bottom: 15px;
}


.sidemenubar {
  font-size: 16px;
  line-height: 27px;
  font-family: 'Nanum Gothic', sans-serif, "Raleway", "HelveticaNeue",
    "Helvetica Neue", Helvetica, Arial, sans-serif;
  width: auto;
  float: left;
  margin-left: 15px;
}
</style>
</head>
<body>

  <div class="container">

      <c:if test="${memberTypeNo == 1}">
          <h2 style="display: inline">학생 찾기</h2>
        </c:if> 
        <c:if test="${memberTypeNo == 3}">
          <h2 style="display: inline">선생님 찾기</h2>
        </c:if>
    <!-- DataTables -->
    <div class="row">

      <!-- Sidebar ================================================== -->
      <div class="col-lg-3 col-md-4">
        <div class="sidemenubar" id="sideMenuBar">
          <p class="address">지역</p>

          <div class="address">
            <select class="custom-select" name="sido1" id="sido1"
              style="width: 150px">
            </select> <select class="custom-select" name="gugun1" id="gugun1"
              style="width: 150px">
            </select>
          </div>


          <p class="more-search-options-title active">성별</p>
          <div class="btn-group-toggle" data-toggle="buttons">
            <label class="btn btn-secondary active"> 
            <input  type="radio" name="gender"
              id="gender_man" autocomplete="off" value="1"> 남자
            </label> 
            <label class="btn btn-secondary active"> 
            <input type="radio" name="gender" 
              id="gender_woman" autocomplete="off" value="0"> 여자
            </label>
          </div>



          <p class="more-search-options-title active">나이</p>
          <div class="btn-group-toggle" data-toggle="buttons">
            <label class="btn btn-secondary active"> <input
              type="radio" name="age" id="age_20and21"
              autocomplete="off" value="20,21"> 20 ~ 21
            </label> <label class="btn btn-secondary active"> <input
              type="radio" name="age" id="age_22and23"
              autocomplete="off" value="22,23"> 22 ~ 23
            </label> <label class="btn btn-secondary active"> <input
              type="radio" name="age" id="age_24and25"
              autocomplete="off" value="24,25"> 24 ~ 25
            </label> <label class="btn btn-secondary active"> <input
              type="radio" name="age" id="age_26and27"
              autocomplete="off" value="26,27"> 26 ~ 27
            </label> <label class="btn btn-secondary active"> <input
              type="radio" name="age" id="age_28and29"
              autocomplete="off" value="28,29"> 28 ~ 29
            </label> <label class="btn btn-secondary active"> <input
              type="radio" name="age" id="age_30" autocomplete="off"
              value="30"> 30 이상
            </label>
          </div>


          <p class="more-search-options-title margin-top-15 active">수업료</p>
          <div class="btn-group-toggle" data-toggle="buttons">
            <label class="btn btn-secondary active"> <input
              type="radio" name="lesson_fee" id="lesson_fee_20"
              autocomplete="off" value="20"> 20만원 까지
            </label> <label class="btn btn-secondary active"> <input
              type="radio" name="lesson_fee" id="lesson_fee_30"
              autocomplete="off" value="30"> 30만원 까지
            </label> <label class="btn btn-secondary active"> <input
              type="radio" name="lesson_fee" id="lesson_fee_40"
              autocomplete="off" value="40"> 40만원 까지
            </label> <label class="btn btn-secondary active"> <input
              type="radio" name="lesson_fee" id="lesson_fee_50"
              autocomplete="off" value="50"> 50만원 이상
            </label>
          </div>



          <p class="more-search-options-title margin-top-15 active">과목으로
            찾기</p>
          <div class="checkbox-container checkbox-container-four active">

            <select class="custom-select" name="school1" id="school1">
            </select> 
            <select class="custom-select" name="subject1" id="subject1">
            </select>

          </div>
          <button type="button" class="btn btn-outline-info">조건검색</button>
        </div>
      </div>
      <!-- Sidebar / End -->
      <!-- contents ================================================== -->
      <div class="col-lg-9 col-md-8">

        <c:if test="${memberTypeNo eq 3}">
          <c:forEach items="${memberTeacher}" varStatus="status">
            <a
              href="detail?no=${memberTeacher[status.index].memberNo}">
              <div class="card-body">
                <div class="cardcard mb-3">
                  <div class="row no-gutters">
                    <div class="col-md-3">
                      <%-- <img
                      src="${memberTeacherStudents[status.index].teacherPhoto}"
                      class="card-img"> --%>
                      <img src="/landing_images/images/small.jpg"
                        class="card-img">
                    </div>
                    <div class="col-md-9">
                      <h5 class="card-title">${memberTeacher[status.index].name}</h5>
                      <p class="card-text">
                        ${memberTeacher[status.index].schools[0].schoolName}/
                        ${memberTeacher[status.index].gender}/
                        ${memberTeacher[status.index].addressCity}
                        ${memberTeacher[status.index].addressSuburb}/
                        ${memberTeacher2[status.index].schoolType}/
                        ${memberTeacher2[status.index].subjects[0].subjectName}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </a>
            <hr>
          </c:forEach>
        </c:if>

        <c:if test="${memberTypeNo eq 1}">
          <c:forEach items="${memberStudents}" var="member">
            <a href="detail?no=${member.memberNo}">
              <div class="card-body">
                <div class="cardcard mb-3">
                  <div class="row no-gutters">
                    <div class="col-md-3">
                      <img src="/landing_images/images/AP2.jpg"
                        class="card-img">
                    </div>
                    <div class="col-md-9">
                      <h5 class="card-title">${member.name}</h5>
                      <p class="card-text">${member.gender}/
                        ${membe.addressCity} ${member.addressSuburb}/
                        ${member.schoolType}/
                        ${member.subjects[0].subjectName}</p>
                    </div>
                  </div>
                </div>
              </div>
            </a>
            <hr>
          </c:forEach>
        </c:if>


      </div>
      <!-- contents / End -->
      
    </div>
    <!-- row / End -->

  </div>
  <!-- Container / End -->


  <script type="text/javascript">
      $('document')
          .ready(
              function() {
                var area0 = [ "시/도 선택", "서울특별시", "인천광역시", "대전광역시", "광주광역시",
                    "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도",
                    "전라북도", "전라남도", "경상북도", "경상남도", "제주도" ];
                var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구",
                    "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구",
                    "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구",
                    "중구", "중랑구" ];
                var area2 = [ "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구",
                    "중구", "강화군", "옹진군" ];
                var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
                var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
                var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ];
                var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
                var area7 = [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구",
                    "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구",
                    "기장군" ];
                var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시",
                    "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시",
                    "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시",
                    "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
                var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시",
                    "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군",
                    "홍천군", "화천군", "횡성군" ];
                var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군",
                    "옥천군", "음성군", "증평군", "진천군", "청원군" ];
                var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시",
                    "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군",
                    "홍성군" ];
                var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군",
                    "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군" ];
                var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군",
                    "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군",
                    "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ];
                var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시",
                    "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군",
                    "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
                var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시",
                    "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군",
                    "창녕군", "하동군", "함안군", "함양군", "합천군" ];
                var area16 = [ "서귀포시", "제주시", "남제주군", "북제주군" ];

                // 시/도 선택 박스 초기화

                $("select[name^=sido]").each(
                    function() {
                      $selsido = $(this);
                      $.each(eval(area0), function() {
                        $selsido.append("<option value='"+this+"'>" + this
                            + "</option>");
                      });
                      $selsido.next()
                          .append("<option value=''>구/군 선택</option>");
                    });

                // 시/도 선택시 구/군 설정

                $("select[name^=sido]").change(
                    function() {
                      var area = "area"
                          + $("option", $(this)).index(
                              $("option:selected", $(this))); // 선택지역의 구군 Array
                      var $gugun = $(this).next(); // 선택영역 군구 객체
                      $("option", $gugun).remove(); // 구군 초기화

                      if (area == "area0")
                        $gugun.append("<option value=''>구/군 선택</option>");
                      else {
                        $.each(eval(area), function() {
                          $gugun.append("<option value='"+this+"'>" + this
                              + "</option>");
                        });
                      }
                    });

              });
    </script>

  <script type="text/javascript">
      $('document').ready(
          function() {
            var area0 = [ "학교 선택", "초등학교", "중학교", "고등학교" ];
            var area1 = [ "국어", "영어", "수학", "사회", "과학", "기타" ];
            var area2 = [ "국어", "영어", "수학", "사회", "과학", "기타" ];
            var area3 = [ "국어", "영어", "수학", "사회", "과학", "기타" ];

            // 학교 선택 박스 초기화
            $("select[name^=school]").each(
                function() {
                  $selschool = $(this);
                  $.each(eval(area0), function() {
                    $selschool.append("<option value='"+this+"'>" + this
                        + "</option>");
                  });
                  $selschool.next().append("<option value=''>과목 선택</option>");
                });

            // 학교 선택시 과목 설정

            $("select[name^=school]").change(
                function() {
                  var area = "area"
                      + $("option", $(this)).index(
                          $("option:selected", $(this))); // 선택지역의 과목 Array
                  var $subject = $(this).next(); // 선택영역 과목 객체
                  $("option", $subject).remove(); // 과목 초기화

                  if (area == "area0")
                    $subject.append("<option value=''>과목 선택</option>");
                  else {
                    $.each(eval(area), function() {
                      $subject.append("<option value='"+this+"'>" + this
                          + "</option>");
                    });
                  }
                });

          });
    </script>
    
<script>
  var test = {
    boardNo: 1
  };
  $.ajax({
    url: '/member/ohora',
    method: 'get',
    data: "boardNo="+1,
    success(ohora) {
      console.log(ohora.name);
    }
  });
</script>
</body>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
</html>