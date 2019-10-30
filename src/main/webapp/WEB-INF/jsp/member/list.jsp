<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님/학생 찾기</title>
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/60aaa234a3.js" crossorigin="anonymous"></script>
<style>
.sidemenu {
  width: 280px;
  float: left;
  margin: 10px;
}

.contents {
  width: 800px;
  float: left;
  margin: 10px;

}


</style>
</head>
<body>

  <div id="wrapper">

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->

        <ol class="breadcrumb">
          <li class="breadcrumb-item active">${member.memberType.memberTypeName}선생님 찾기</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-body">
            <div class="sidemenu">

              <div class="sidemenubar">

                <div class="address">
                  <P>지역</P>
                  <select>
                    <option value="seoul">서울특별시</option>
                    <option value="gyeonggi">경기도</option>
                    <option value="gangwon">강원도</option>
                  </select> <select>
                    <option value="seocho">서초구</option>
                    <option value="gangnam">강남구</option>
                    <option value="dongjak">동작</option>
                  </select>
                </div>

                <div class="gender">
                  <p>성별</p>
                  <button type="button" class="btn btn-outline-info">남자</button>
                  <button type="button" class="btn btn-outline-info">여자</button>
                </div>

                <div class="age">
                  <p>나이</p>
                  <button type="button" class="btn btn-outline-info">20 ~ 21</button>
                  <button type="button" class="btn btn-outline-info">22 ~ 23</button><br>
                  <button type="button" class="btn btn-outline-info">24 ~ 25</button>
                  <button type="button" class="btn btn-outline-info">26 ~ 27</button><br>
                  <button type="button" class="btn btn-outline-info">28 ~ 29</button>
                  <button type="button" class="btn btn-outline-info">30 이상</button>
                </div>

                <div class="tuition-fee">
                  <p>수업료</p>
                  <button type="button" class="btn btn-outline-info">20만원 ~ 30만원</button>
                  <button type="button" class="btn btn-outline-info">30만원 ~ 40만원</button>
                  <button type="button" class="btn btn-outline-info">40만원 ~ 50만원</button>
                  <button type="button" class="btn btn-outline-info">50만원 이상</button>
                </div>

                <br>
                <h3>과목으로 찾기</h3>

                <div class="high-school">
                  <p>고등학교</p>
                  <button type="button" class="btn btn-outline-info">국어</button>
                  <button type="button" class="btn btn-outline-info">영어</button>
                  <button type="button" class="btn btn-outline-info">수학</button><br>
                  <button type="button" class="btn btn-outline-info">사회</button>
                  <button type="button" class="btn btn-outline-info">과학</button>
                  <button type="button" class="btn btn-outline-info">기타</button>
                </div>

                <div class="mid-school">
                  <p>중학교</p>
                  <button type="button" class="btn btn-outline-info">국어</button>
                  <button type="button" class="btn btn-outline-info">영어</button>
                  <button type="button" class="btn btn-outline-info">수학</button><br>
                  <button type="button" class="btn btn-outline-info">사회</button>
                  <button type="button" class="btn btn-outline-info">과학</button>
                  <button type="button" class="btn btn-outline-info">기타</button>
                </div>

                <div class="ele-school">
                  <p>초등학교</p>
                  <button type="button" class="btn btn-outline-info">국어</button>
                  <button type="button" class="btn btn-outline-info">영어</button>
                  <button type="button" class="btn btn-outline-info">수학</button><br>
                  <button type="button" class="btn btn-outline-info">사회</button>
                  <button type="button" class="btn btn-outline-info">과학</button>
                  <button type="button" class="btn btn-outline-info">기타</button>
                </div>
                <button type="button" class="btn btn-outline-info">조건 검색</button>

              </div>


            </div>
            <div class="contents">
            <c:forEach items="${members}" var="member">
        <a href='detail?no=${member.memberNo}'>${member.name}</a>
        <c:choose>
          <c:when test="${member.memberType.memberTypeNo == 1}">
            <td>${member.gender}</td>/<td>${member.addressCity}</td>
            <td>${member.addressSuburb}</td> / <td>${member.memberType.memberTypeNo}</td>
          </c:when>
          <c:when test="${member.memberType.memberTypeNo == 3}">
            <td>${member.teacher.teacherPhotos[0].teacherPhoto}</td>
            <br>
            <td>${member.teacher.schools[0].schoolName}</td>/<td>${member.gender}</td>/${member.teacher.schools[0].schoolType.schoolType} / <td>${member.addressCity}</td>
            <td>${member.addressSuburb}</td> / <td>${member.memberType.memberTypeNo}</td>
          </c:when>
        </c:choose>
        <hr>
    </c:forEach>
            
            
            </div>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->


</body>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</html>