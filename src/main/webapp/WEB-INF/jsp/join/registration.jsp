<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <!-- Bootstrap core CSS -->
  <style>
    .next-button {
      background-color: #1abc9c;
    }

    .container {
      background-color: #fbfbfb;
    }
  </style>
</head>

<div class="row justify-content-center">
  <div class="col-10">
    <h5><b>회원 가입 약관</b></h5>
    <hr>
    <div class="embed-responsive embed-responsive-21by9 mb-3">
      <iframe class="embed-responsive-item" src="/memberrule.html" scrolling="yes">
      </iframe>
    </div>
    <div class="form-group">
      <div class="checkbox form-check-inline">
        <label>
          <input type="checkbox" value="member-agreement" class="checkbox1 mb-3">
          회원 가입 약관을 확인하였으며 이에 동의합니다.
        </label>
      </div>
    </div>

    <h5><b>개인 정보 취급 방침</b></h5>
    <hr>
    <div class="embed-responsive embed-responsive-21by9 mb-3">
      <iframe class="embed-responsive-item" src="/privaterule.html" height="200px" scrolling="auto">
      </iframe>
    </div>
    <div class="form-group">
      <div class="checkbox form-check-inline">
        <label>
          <input type="checkbox" value="private-agreement" class="checkbox2">
          개인 정보 취급 방침을 확인하여 이에 동의합니다.
        </label>
      </div>
    </div>

  </div>
</div>
<div class="row justify-content-center mb-3">
  <div class="col-10" style="text-align: right;">
    <input type="button" class="btn btn-sm text-white next-button" value="다음 단계">
  </div>
</div>
</div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="/node_modules/jquery/dist/jquery.min.js"></script>

<script>
  let nextButton = document.getElementsByClassName('next-button')[0];
  nextButton.addEventListener('click', () => {
    location.href = 'memberselect';
  });
</script>
<script src="https://kit.fontawesome.com/c5804f7418.js" crossorigin="anonymous"></script>