<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>선생님/학생 찾기</title>

<!-- Custom fonts for this template-->
<link href="../node_modules/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="../node_modules/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../resources/assets/css/sb-admin.css" rel="stylesheet">
<link rel='stylesheet'  href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1" href="index.html">헤더입니다</a>
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0"
      id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>
  </nav>

  <div id="wrapper">

    <!-- contents body -->
    <div id="content-wrapper">
      <div class="container-fluid">

        <!-- 상단 bar -->
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">${member.memberType.memberTypeName}찾기</a>
          </li>
          <li class="breadcrumb-item active">Table</li>
        </ol>

        <div class="container">
          <div class="row">

            <!-- Categories Widget -->
            <div class="card my-4">
              <h5 class="card-header">조건으로 검색</h5>
              <div class="card-body">
                <div class="row">
                  <div class="col-lg-6">
                    <ul class="list-unstyled mb-0">
                      <li>지역</li>
                      <div class="btn">
                        <div class="btn-group">
                          <button type="button"
                            class="btn btn-secondary dropdown-toggle"
                            data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">주소</button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button">서울특별시</button>
                            <button class="dropdown-item" type="button">경기도</button>
                            <button class="dropdown-item" type="button">강원도</button>
                          </div>
                        </div>
                        <div class="btn-group">
                          <button type="button"
                            class="btn btn-secondary dropdown-toggle"
                            data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">주소</button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button">서울특별시</button>
                            <button class="dropdown-item" type="button">경기도</button>
                            <button class="dropdown-item" type="button">강원도</button>
                          </div>
                        </div>
                      </div>
                      <li>성별</li>
                      <li>수업료</li>
                    </ul>
                    <ul class="list-unstyled mb-0">
                      <li>지역</li>
                      <li>성별</li>
                      <li>수업료</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

          </div>
          <!-- /row-->
        </div>
        <!-- /container-->


        <!-- 회원 리스트 -->

        <!-- /회원 리스트 -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content-wrapper -->
  </div>
  <!-- /.wrapper -->



  <!-- Sticky Footer -->
  <footer class="sticky-footer">
    <div class="container my-auto">
      <div class="copyright text-center my-auto">
        <span>Copyright © Your Website 2019</span>
      </div>
    </div>
  </footer>

  <!-- /.content-wrapper -->

  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top"> <i
    class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to
            Leave?</h5>
          <button class="close" type="button" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are
          ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button"
            data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <script
    src="../node_modules/jquery.easing/bower_components/jquery/dist/jquery.min.js"></script>
  <script
    src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="../node_modules/jquery-easing/jquery.easing.min.js"></script>
  <!-- Page level plugin JavaScript-->
  <script src="../node_modules/datatables/jquery.dataTables.js"></script>
  <script src="../node_modules/datatables/dataTables.bootstrap4.js"></script>
  <!-- Custom scripts for all pages-->
  <script src="../resources/assets/js/sb-admin.min.js"></script>
  <!-- Demo scripts for this page-->
  <script src="../resources/assets/js/demo/datatables-demo.js"></script>
</body>

</html>
