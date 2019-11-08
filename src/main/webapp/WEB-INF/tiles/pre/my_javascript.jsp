<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- Bootstrap core JavaScript-->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <!-- <script src="vendor/chart.js/Chart.min.js"></script> -->
  <script src="/vendor/datatables/jquery.dataTables.js"></script>
  <script src="/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="/js/demo/datatables-demo.js"></script>
  <!-- <script src="js/demo/chart-area-demo.js"></script> -->
  
    <!-- 초기 프로필 이미지 로딩 제어 -->
  <script>
    let menuProfilePhoto = document.getElementById('menu-profilePhoto');
    menuProfilePhoto.style.display = 'block';
  </script>

  <!-- nav-bar toggle시 프로필 사진 버튼 글씨 크기 조절 -->
  <script>
    let modifyProfileBtn = document.getElementById('menu-modify-profile-btn');
    let sidebarToggle = document.getElementById('sidebarToggle');
    sidebarToggle.addEventListener('click', () => {
      let mySidebar = document.getElementsByClassName('sidebar navbar-nav');
      if (mySidebar[0].getAttribute('class').endsWith('toggled'))
        modifyProfileBtn.style = 'padding: 6px; font-size: 0.65em;';
      else
        modifyProfileBtn.style = '';

    });
  </script>

  <script>
    modifyProfileBtn = document.getElementById('menu-modify-profile-btn');
    let profileFileInput = document.getElementById('menu-profileFileInput');
    let profilePhotoOriginalSize = document.getElementById('menu-profilePhotoOriginalSize');

    profileFileInput.addEventListener('change', (e) => {
      let get_file = e.target.files;
      let menuProfilePhoto = document.getElementById('menu-profilePhoto');

      let reader = new FileReader();
      reader.onload = (function (aImg) {
        return function (e) {
          // 현재 사이드 바의 프로필 이미지 경로를 바꿈
          aImg.src = e.target.result;
          // 프로필 이미지를 눌렀을 때 나오는 더 큰 사이즈의 이미지 경로를 바꿈
          profilePhotoOriginalSize.src = e.target.result;
        }
      })(menuProfilePhoto);

      reader.readAsDataURL(get_file[0]);
      menuProfilePhoto.src = get_file[0].name;
    });

    // '사진변경' 버튼을 누르면 profileFileInput을 누르도록 이벤트를 전달
    modifyProfileBtn.addEventListener('click', () => {
      var clickPhotoChangeBtn = new MouseEvent('click', {
        bubbles: true, cancelable: true, view: window
      });

      document.getElementById('menu-profileFileInput').dispatchEvent(clickPhotoChangeBtn);

    });
  </script>

  <!-- 쪽지 보내기 버튼 클릭 시의 액션-->
  <script>
    let messageButton = document.getElementsByClassName('message-button');
    messageButton[0].addEventListener('click', () => {
      console.log('test');
    });


  </script>

  
  