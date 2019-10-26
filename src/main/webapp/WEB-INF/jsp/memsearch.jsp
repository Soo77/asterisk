<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <title>선생님 찾기</title>
  </head>
  <body>

  <h2>선생님 찾기</h2>
  <hr><br>
  
<div class="teacherSearch">
  <div class="address">
    <h3>지역</h3>
    <select>
      <option value="seoul">서울특별시</option>
      <option value="gyeonggi">경기도</option>
      <option value="gangwon">강원도</option>
    </select>
    <select>
      <option value="seocho">서초구</option>
      <option value="gangnam">강남구</option>
      <option value="dongjak">동작</option>
    </select>
  </div>
  
  <div class="gender">
    <h3>성별</h3>
    <button> 남자 </button>
    <button> 여자 </button>
  </div>
  
  <div class="age">
    <h3>나이</h3>
    <button> 20 ~ 21 </button>
    <button> 22 ~ 23 </button>
    <button> 24 ~ 25 </button>
    <button> 26 ~ 27 </button>
    <button> 28 ~ 29 </button>
    <button> 30 이상</button>
  </div>
  
  <div class="tuitionfee">
    <h3>수업료</h3>
    <button> 20만원 ~ 30만원 </button>
    <button> 30만원 ~ 40만원 </button>
    <button> 40만원 ~ 50만원 </button>
    <button> 50만원 이상 </button>
  </div>
  
  <br>
  <h3>과목으로 찾기</h3>
  
  <div class="highSchool">
    <h3>고등학교</h3>
    <button> 국어 </button>
    <button> 영어 </button>
    <button> 수학 </button>
    <button> 사회 </button>
    <button> 과학 </button>
    <button> 기타 </button>
  </div>
  
  <div class="midSchool">
    <h3>중학교</h3>
    <button> 국어 </button>
    <button> 영어 </button>
    <button> 수학 </button>
    <button> 사회 </button>
    <button> 과학 </button>
    <button> 기타 </button>
  </div>
  
  <div class="eleSchool">
    <h3>초등학교</h3>
    <button> 국어 </button>
    <button> 영어 </button>
    <button> 수학 </button>
    <button> 사회 </button>
    <button> 과학 </button>
    <button> 기타 </button>
  </div>
  
  <button><h3>조건 검색</h3></button>
</div>  
  
  <c:forEach items="${members}" var="member">
  <div class="tchdetail">
    <div class="tchPhoto">
      <img src="images/Rabbit.png" height="100px" />
    </div>
    
    <div class="tchInfo">
      <p><a href='detail?no=${member.no}'>${member.name}</a></p>
      <p>${member.gender}/ 초등 영어, 초등 수학/ ${member.address}/ 경력 2년/${member.memberType.memberType}</p>
    </div>
    <hr>
  </div>
  </c:forEach>  

<div class="pageButton">
<button> &lt; </button>
<button> 1 </button>
<button> &gt; </button>
</div>


</body>
</html>