<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Eom-Tutor</title>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
  name='viewport' />
  <tiles:insertAttribute name="stylesheet3"/>
  <style>
    .page-header {
      height: 400px;
    }
  </style>
</head>

<body>
  <tiles:insertAttribute name="javascript3"/>
  <tiles:insertAttribute name="header3"/>
  <tiles:insertAttribute name="body3"/>
  <tiles:insertAttribute name="footer3"/>
</body>

</html>