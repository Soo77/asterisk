<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>


  <!-- 프로필 사진 modal -->
  <div class="modal" id="menu-profilePhotoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="container">
      <div class="modal-dialog-fluid modal-dialog-centered" role="document">
        <div class="row" style="float: none; margin: 0 auto;">
          <div class="col">
            <div class="modal-header" style="border: none;">
              <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true" style="color: white;">×</span>
              </button>
            </div>
            <img id="menu-profilePhotoOriginalSize" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  </div>