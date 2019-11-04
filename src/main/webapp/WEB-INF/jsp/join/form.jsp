<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel='stylesheet'
  href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
  integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
  crossorigin='anonymous'>
  <style>
    .btn{
  display: inline-block;
    font-weight: 400;
    color: #212529;
    text-align: center;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: transparent;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color 
    .15s ease-in-out,box-shadow .15s ease-in-out;
    width: 300px;
    margin-top: 10%;
    
}

.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}
  </style>
</head>
<body>
<a href="../join/student"><button class="btn btn-primary">학생 가입</button></a>
<a href="../join/parents"><button class="btn btn-primary">학부모 가입</button></a>
<a href="../join/teacher"><button class="btn btn-primary">선생님 가입</button></a>
</body>
</html>