<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>게시물 보기</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<div id='content'>
<h1>질문게시판</h1>
<form action='update' method='post'>
번호 : <input type='text' name='boardNo' value='${board.boardNo}' readonly><br>
제목 : <input type='text' name='title' value='${board.title}'><br>
이름 : <input type='text' name='name' value='${board.member.name}' readonly><br>
수정일 : <input type='text' name='createdDate' value='${board.createdDate}' readonly><br>
조회 : <input type='text' name='viewCount' value='${board.viewCount}' readonly><br>
내용 : <textarea name='contents' rows='5'
            cols='50'>${board.contents}</textarea><br>
<button>변경</button>
<a href='delete?no=${board.boardNo}'>삭제</a>
</form>
</div>

</body>
</html>
