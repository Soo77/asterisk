<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <select id="optionValue" name="typeNo">
    <option value=0>게시판
    <option value=1>공부상담
    <option value=2>입시상담
    <option value=3>문제풀이
  </select>
  
  <script>
    var s = document.getElementById('optionValue');
    
    s.addEventListener('change', function() {
      if (s.options[s.selectedIndex].value == 1) {
        location.href='list?boardTypeNo=1';
      } else if (s.options[s.selectedIndex].value == 2) {
        location.href='list?boardTypeNo=2';
      } else if (s.options[s.selectedIndex].value == 3) {
        location.href='list?boardTypeNo=3';
      } 
    });
    
  </script> -->

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
  <a class="navbar-brand" href="#">엄과외</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse"
    data-target="#navbarsExample04" aria-controls="navbarsExample04"
    aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample04">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"><a class="nav-link" href="#">선생님찾기</a></li>
      <li class="nav-item"><a class="nav-link" href="#">학생찾기</a></li>
      <li class="nav-item dropdown"><a
        class="nav-link dropdown-toggle" href="#" id="dropdown04"
        data-toggle="dropdown" aria-haspopup="true"
        aria-expanded="false">게시판</a>
        <div class="dropdown-menu" aria-labelledby="dropdown04">
          <a class="dropdown-item" href="list?boardTypeNo=1">공부상담</a> <a
            class="dropdown-item" href="list?boardTypeNo=2">입시상담</a> <a
            class="dropdown-item" href="list?boardTypeNo=3">문제풀이</a>
        </div></li>
    </ul>
  </div>
</nav>

