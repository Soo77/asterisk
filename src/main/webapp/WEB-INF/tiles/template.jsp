<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Eom-Tutor</title>
  <tiles:insertAttribute name="stylesheet"/>

</head>

<body id="page-top">
  <tiles:insertAttribute name="header"/>

  <div id="wrapper">
    <tiles:insertAttribute name="menu"/>

    <div id="content-wrapper">
      <div class="container-fluid">
        <tiles:insertAttribute name="body"/>
      </div>
      <tiles:insertAttribute name="footer"/>
    </div>
  </div>

  <tiles:insertAttribute name="modal"/>
  <tiles:insertAttribute name="javascript"/>

</body>
</html>