<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 목록</title>

<style>

.photo1 {
  height: 120px;
}

.photo2 {
  height: 100px;
  margin: 2px;
}

</style>
</head>
<body>

  <div class="title">
    <c:if test="${boardTypeNo == 1}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">공부상담</h2>
    </c:if>
    <c:if test="${boardTypeNo == 2}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">입시상담</h2>
    </c:if>
    <c:if test="${boardTypeNo == 3}">
      <h1 style="display: inline">질문게시판 ㅣ</h1>
      <h2 style="display: inline">문제풀이</h2>
    </c:if>
    <c:if test="${boardTypeNo == 4}">
      <h1 style="display: inline">공지사항</h1>
    </c:if>
  </div>

  <br>
    
    <table class='table table-hover'>
      <thead>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성일</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${boards}" var="board"
          begin="${pagination.pageSize * (pagination.curPage - 1)}"
          end="${pagination.pageSize * pagination.curPage - 1}">
          <tr>
            <td>${board.boardNo}</td>
            <td><a href='detail?no=${board.boardNo}'>${board.title}</a></td>
            <td>${board.memberId}</td>
            <td>${board.createdDate}</td>
            <td>${board.viewCount}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div align="right">
      <c:if test="${loginUser.memberTypeNo != 4 and boardTypeNo != 4}">
        <button class="btn btn-info" type="button" onclick="location='form?boardTypeNo=${boardTypeNo}'">글쓰기</button>
      </c:if>
      <c:if test="${loginUser.memberTypeNo == 4}">
        <button class="btn btn-info" type="button" onclick="location='form?boardTypeNo=${boardTypeNo}'">관리자글쓰기</button>
      </c:if>
    </div>

    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
        <c:if test="${pagination.curPage ne 1}">
          <li class="page-item"><a class="page-link" style="color: #00AFA0;"
            href="list?boardTypeNo=${boardTypeNo}&amp;curPage=${pagination.prevPage}&searchType=${searchType}&keyword=${keyword}">&laquo;</a>
          </li>
        </c:if>

        <c:forEach var="pageNum" begin="${pagination.startPage }"
          end="${pagination.endPage }">
          <c:choose>
            <c:when test="${pageNum eq  pagination.curPage}">
              <li class="page-item active" aria-current="page"><a class="page-link" style="background-color: #00AFA0; color: #ffffff"
                href="list?boardTypeNo=${boardTypeNo}&amp;curPage=${pageNum}&searchType=${searchType}&keyword=${keyword}">${pageNum}</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item"><a class="page-link" style="color: #000000;"
                href="list?boardTypeNo=${boardTypeNo}&amp;curPage=${pageNum}&searchType=${searchType}&keyword=${keyword}">${pageNum}</a></li>
            </c:otherwise>
          </c:choose>
        </c:forEach>

        <c:if
          test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
          <li class="page-item"><a class="page-link" style="color: #00AFA0;"
            href="list?boardTypeNo=${boardTypeNo}&amp;curPage=${pagination.nextPage}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
        </c:if>
      </ul>
    </nav>
    <br>
    
    <input type='hidden' name='boardTypeNo' value='${boardTypeNo}'>
    <div class="form-group row justify-content-center">
      <div class="w100" style="padding-right:10px">
        <select class="form-control form-control-sm" name="searchType" id="searchType">
          <option value="title">제목</option>
          <option value="writer">작성자</option>
        </select>
      </div>
      <div class="w300" style="padding-right:10px">
        <input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
      </div>
      <div>
        <button class="btn btn-sm btn-info" name="btnSearch" id="btnSearch">검색</button>
      </div>
    </div>
    
  <script src="/node_modules/jquery/dist/jquery.min.js"></script>

  <script>
    $(document).on('click', '#btnSearch', function(e){
      e.preventDefault();
      var url = "list?boardTypeNo=" + ${boardTypeNo}
      url = url + "&curPage=1";
      url = url + "&searchType=" + $('#searchType').val();
      url = url + "&keyword=" + $('#keyword').val();
      location.href = url;
    })
  </script>
  
</body>
</html>

