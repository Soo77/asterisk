<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <select id="optionValue" name="typeNo">
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
    
  </script>




