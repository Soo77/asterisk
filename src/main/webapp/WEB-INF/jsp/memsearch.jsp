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

<div>
  <h2>선생님 찾기</h2>
</div>
  <hr><br>
  
<div>
  <div>
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
  
  <div>
    <h3>성별</h3>
    <div>
    <button> 남자 </button>
    </div>
    <div>
    <button> 여자 </button>
    </div>
  </div>
  
  <div>
    <h3>나이</h3>
    <div>
    <button> 20 ~ 21 </button>
    </div>
    <div>
    <button> 22 ~ 23 </button>
    </div>
    <div>
    <button> 24 ~ 25 </button>
    </div>
    <div>
    <button> 26 ~ 27 </button>
    </div>
    <div>
    <button> 28 ~ 29 </button>
    </div>
    <div>
    <button> 30 이상</button>
    </div>
  </div>
  
  <div>
    <h3>수업료</h3>
    <div>
    <button> 20만원 ~ 30만원 </button>
    </div>
    <div>
    <button> 30만원 ~ 40만원 </button>
    </div>
    <div>
    <button> 40만원 ~ 50만원 </button>
    </div>
    <div>
    <button> 50만원 이상 </button>
    </div>
  </div>
  <br>
  <h3>과목으로 찾기</h3>
  <div>
    <h3>고등학교</h3>
    <div>
    <button> 국어 </button>
    </div>
    <div>
    <button> 영어 </button>
    </div>
    <div>
    <button> 수학 </button>
    </div>
    <div>
    <button> 사회 </button>
    </div>
    <div>
    <button> 과학 </button>
    </div>
    <div>
    <button> 기타 </button>
    </div>
  </div>
  
  <div>
    <h3>중학교</h3>
    <div>
    <button> 국어 </button>
    </div>
    <div>
    <button> 영어 </button>
    </div>
    <div>
    <button> 수학 </button>
    </div>
    <div>
    <button> 사회 </button>
    </div>
    <div>
    <button> 과학 </button>
    </div>
    <div>
    <button> 기타 </button>
    </div>
  </div>
  
  <div>
    <h3>초등학교</h3>
    <div>
    <button> 국어 </button>
    </div>
    <div>
    <button> 영어 </button>
    </div>
    <div>
    <button> 수학 </button>
    </div>
    <div>
    <button> 사회 </button>
    </div>
    <div>
    <button> 과학 </button>
    </div>
    <div>
    <button> 기타 </button>
    </div>
  </div>
  <button><h3>조건 검색</h3></button>
  
</div>  
  
  
<div>

  <c:forEach items="${members}" var="member">
  <div>
    <div>
      <img src="images/Rabbit.png" height="100px" />
    </div>
    <div>
  
      <p><a href='detail?no=${member.no}'>${member.name}</a></p>
 
    </div>
    <div>
      <p>${member.gender}/ 초등 영어, 초등 수학/ ${member.address}/ 경력 2년/${member.memberType.memberType}</p>
    </div>
    <hr>
  </div>
  </c:forEach>  
</div>  

<div>
<button> &lt; </button>
<button> 1 </button>
<button> &gt; </button>
</div>


</body>
</html>