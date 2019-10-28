<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님/학생 찾기</title>
</head>
<body>

  <h2>${member.memberType.memberTypeName}찾기</h2>
  <hr>
  <br>

  <div class="search">
    <div class="address">
      <h3>지역</h3>
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
      <h3>성별</h3>
      <button>남자</button>
      <button>여자</button>
    </div>

    <div class="age">
      <h3>나이</h3>
      <button>20 ~ 21</button>
      <button>22 ~ 23</button>
      <button>24 ~ 25</button>
      <button>26 ~ 27</button>
      <button>28 ~ 29</button>
      <button>30 이상</button>
    </div>

    <div class="tuition-fee">
      <h3>수업료</h3>
      <button>20만원 ~ 30만원</button>
      <button>30만원 ~ 40만원</button>
      <button>40만원 ~ 50만원</button>
      <button>50만원 이상</button>
    </div>

    <br>
    <h3>과목으로 찾기</h3>

    <div class="high-school">
      <h3>고등학교</h3>
      <button>국어</button>
      <button>영어</button>
      <button>수학</button>
      <button>사회</button>
      <button>과학</button>
      <button>기타</button>
    </div>

    <div class="mid-school">
      <h3>중학교</h3>
      <button>국어</button>
      <button>영어</button>
      <button>수학</button>
      <button>사회</button>
      <button>과학</button>
      <button>기타</button>
    </div>

    <div class="ele-school">
      <h3>초등학교</h3>
      <button>국어</button>
      <button>영어</button>
      <button>수학</button>
      <button>사회</button>
      <button>과학</button>
      <button>기타</button>
    </div>

    <button>
      <h3>조건 검색</h3>
    </button>
  </div>

  <c:forEach items="${members}" var="member">
    <div class="detail">
      <tr>
        <td><a href='detail?no=${member.memberNo}'>${member.name}</a></td>
        <br>
        <c:choose>
          <c:when test="${member.memberType.memberTypeNo == 1}">
            <td>${member.gender}</td>/초등 영어, 초등 수학/ <td>${member.addressCity}</td>
            <td>${member.addressSuburb}</td> / <td>${member.memberType.memberTypeNo}</td>
          </c:when>
          <c:when test="${member.memberType.memberTypeNo == 3}">
            <td>${member.teacher.teacherPhotos[0].teacherPhoto}</td><br>
            <td>${member.teacher.schools[0].schoolName}</td>/<td>${member.gender}</td>/초등 영어, 초등 수학/ <td>${member.addressCity}</td>
            <td>${member.addressSuburb}</td> / <td>${member.memberType.memberTypeNo}</td>
          </c:when>
        </c:choose>
      </tr>
      <hr>
    </div>
  </c:forEach>


  <div class="page-button">
    <button>&lt;</button>
    <button>1</button>
    <button>&gt;</button>
  </div>


</body>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
</html>