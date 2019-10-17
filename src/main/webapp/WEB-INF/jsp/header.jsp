<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <select id="optionValue" name="typeNo">
    <option selected value=0>게시판
    <option value=1>공지사항
    <option value=2>공부상담
    <option value=3>입시상담
    <option value=4>문제풀이
  </select>
  
  <script>
    var s = document.getElementById('optionValue');
    
    s.addEventListener('change', function() {
      if (s.options[s.selectedIndex].value == 1) {
        location.href='http://localhost:8888/app/board/listbytype1';
      } else if (s.options[s.selectedIndex].value == 2) {
        location.href='http://localhost:8888/app/board/listbytype1';
      } else if (s.options[s.selectedIndex].value == 3) {
        location.href='http://localhost:8888/app/board/listbytype1';
      } else if (s.options[s.selectedIndex].value == 4) {
        location.href='http://localhost:8888/app/board/listbytype1';
      }
    });
    
    s.addEventListener('mouseover', function() {
      console.log('아이고 마우스가 올라갔네!?')
    });
  </script>




