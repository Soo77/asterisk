<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<style>
.btn.btn-primary {
    color: #fff;
    background-color: #9c27b0;
    border-color: #9c27b0;
    box-shadow: 
    0 2px 2px 0 rgba(156, 39, 176, 0.14), 
    0 3px 1px -2px rgba(156, 39, 176, 0.2), 
    0 1px 5px 0 rgba(156, 39, 176, 0.12) inset;
   /*  box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; */
}
.btn.btn-primary.gender {
  width:48%;
}

.btn.btn-primary.age {
  width:48%;
}

.btn.btn-primary.lesson-fee {
  width:48%;
}

.btn.btn-primary.btn-round {
  width:60%;
  left:20%;
  margin-top:20px;
}

.col-lg-9.col-md-8 {
  padding-left:50px;
}

.listpage {
  padding-top:40px;
  padding-bottom:40px;
}


</style>

<body>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/bg3.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <c:if test="${memberTypeNo == 1}">
             <h1 class="title">
              <span class="tim-note">학생 찾기</span></h1>
            </c:if>
            <c:if test="${memberTypeNo == 3}">
              <h1 class="title">
                <span class="tim-note">선생님 찾기</span></h1>
            </c:if>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container">
      <!-- <div class="section text-center">
         <h2 class="title">Your main section here</h2>
       </div> -->
       <div class="listpage">
      
      <!-- DataTables -->
      <div class="row">

        <!-- Sidebar ================================================== -->
        <div class="col-lg-3 col-md-4">
          <div class="sidemenubar" id="sideMenuBar">
            
            <h4><span class="tim-note">지역</span></h4>
              <div class="address">
                <select class="custom-select" name="sido1" id="sido1">
                </select> 
                <select class="custom-select" name="gugun1" id="gugun1">
                </select>
              </div>
              
              <h4><span class="tim-note">성별</span></h4>
              <div class="form-check">
                <label class="btn btn-primary gender">
                  <input class="form-check-input" type="checkbox" name="gender" id="gender_man" value="0"> 남자
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary gender">
                  <input class="form-check-input" type="checkbox" name="gender" id="gender_woman" value="1"> 여자
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            
            
              <h4><span class="tim-note">나이</span></h4>
              <div class="form-check">
                <label class="btn btn-primary age">
                  <input class="form-check-input" type="radio" name="age" id="age_20and21" value="20,21"> 20 ~ 21
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary age">
                  <input class="form-check-input" type="radio" name="age" id="age_22and23" value="22,23"> 22 ~ 23
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary age">
                  <input class="form-check-input" type="radio" name="age" id="age_24and25" value="24,25"> 24 ~ 25
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary age">
                  <input class="form-check-input" type="radio" name="age" id="age_26and27" value="26,27"> 26 ~ 27
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary age">
                  <input class="form-check-input" type="radio" name="age" id="age_28and29" value="28,29"> 28 ~ 29
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary age">
                  <input class="form-check-input" type="radio" name="age" id="age_30" value="30"> 30 이상
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            
              <h4><span class="tim-note">수업료</span></h4>
              <div class="form-check">
                <label class="btn btn-primary lesson-fee">
                  <input class="form-check-input" type="radio" name="lesson_fee" id="lesson_fee_20" value="20"> 20만원 까지
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary lesson-fee">
                  <input class="form-check-input" type="radio" name="lesson_fee" id="lesson_fee_30" value="30"> 30만원 까지
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary lesson-fee">
                  <input class="form-check-input" type="radio" name="lesson_fee" id="lesson_fee_40" value="40"> 40만원 까지
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
                <label class="btn btn-primary lesson-fee">
                  <input class="form-check-input" type="radio" name="lesson_fee" id="lesson_fee_50" value="50"> 50만원 까지
                  <span class="circle">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            
              <h4><span class="tim-note">과목으로 찾기</span></h4>
              <div class="checkbox-container checkbox-container-four active">
                <select class="custom-select" name="school1" id="school1"></select> 
                <select class="custom-select" name="subject1" id="subject1"></select>
              </div>
            
            <div class="button search">
            <button class="btn btn-primary btn-round">조건 검색</button>
            </div>
            
          
          </div>
        </div>
        <!-- Sidebar / End -->
        <!-- contents ================================================== -->
        <div class="col-lg-9 col-md-8">

          <c:if test="${memberTypeNo eq 3}">
            <c:forEach items="${memberList}" var="member">
              <a href="detail?no=${member.memberNo}">
                <div class="card-body">
                  <div class="cardcard mb-3">
                    <div class="row no-gutters">
                      <div class="col-md-3">
                        <img src="${member.profilePhoto}" width="130" alt="Thumbnail Image" 
                        class="img-raised rounded-circle img-fluid" 
                        onError="this.src='/landing_images/images/default.jpg'">
                        <!-- <img src="/landing_images/images/hong.png" width="130" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid"> -->
                      </div>
                      <div class="col-md-9">
                      <h3 class="title">
                        <span class="tim-note">${member.name}</span></h3>
                      <h4><span class="tim-note">
                          ${member.schools[0].schoolName}/
                          ${member.gender}/
                          ${member.addressCity}
                          ${member.addressSuburb}/
                          ${member.schoolType}/
                          ${member.subjects[0].subjectName}
                      </span></h4>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
              <hr>
            </c:forEach>
          </c:if>

          <c:if test="${memberTypeNo eq 1}">
            <c:forEach items="${memberList}" var="member">
              <a href="detail?no=${member.memberNo}">
                <div class="card-body">
                  <div class="cardcard mb-3">
                    <div class="row no-gutters">
                      <div class="col-md-3">
                      <img src="${member.profilePhoto}" width="130" alt="Thumbnail Image" 
                        class="img-raised rounded-circle img-fluid" 
                        onError="this.src='/landing_images/images/default.jpg'">
                      </div>
                      <div class="col-md-9">
                        <h3 class="title">
                        <span class="tim-note">${member.name}</span></h3>
                        <h4><span class="tim-note">
                        ${member.gender}/
                        ${membe.addressCity} ${member.addressSuburb}/
                        ${member.schoolType}/
                        ${member.subjects[0].subjectName}
                        </span></h4>
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
   </div>
  </div>

  <script type="text/javascript">
    $('document')
      .ready(
        function () {
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

        // 시/도 선택 박스 초기화

          $("select[name^=sido]").each(
            function () {
              $selsido = $(this);
              $.each(eval(area0), function () {
                $selsido.append("<option value='" + this + "'>" + this
                  + "</option>");
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

  <script type="text/javascript">
    $('document').ready(
      function () {
        var area0 = [ "학교 선택", "초등학교", "중학교", "고등학교" ];
        var area1 = [ "국어", "영어", "수학", "사회", "과학", "기타" ];
        var area2 = [ "국어", "영어", "수학", "사회", "과학", "기타" ];
        var area3 = [ "국어", "영어", "수학", "사회", "과학", "기타" ];

        // 학교 선택 박스 초기화
        $("select[name^=school]").each(
          function () {
            $selschool = $(this);
            $.each(eval(area0), function () {
              $selschool.append("<option value='" + this + "'>" + this
                + "</option>");
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
    var test = {
      boardNo: 1
    };
    $.ajax({
      url: '/member/ohora',
      method: 'get',
      data: "boardNo=" + 1,
      success(ohora) {
        console.log(ohora.name);
      }
    });
  </script>
  

  

</body>
<!-- <script src="/node_modules/jquery/dist/jquery.min.js"></script> -->


</html>