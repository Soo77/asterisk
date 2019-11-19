<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Eom-Tutor</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <tiles:insertAttribute name="stylesheet3"/>
</head>

<body class="login-page sidebar-collapse">
  <tiles:insertAttribute name="header2"/>
  <tiles:insertAttribute name="javascript3"/>
  <div class="page-header header-filter" style="background-image: url('/assets/img/bg7.jpg'); background-size: cover; background-position: top center;">
	  <tiles:insertAttribute name="body2"/>
	  <tiles:insertAttribute name="footer2"/>
  </div>
</body>

</html>