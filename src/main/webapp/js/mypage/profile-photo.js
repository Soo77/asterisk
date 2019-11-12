let profilePhotoImg = document.getElementsByClassName('profile-photo')[0];
let profileFileInput = document.getElementById('profile-photo-upload');

profileFileInput.addEventListener('change', (e) => {
  let get_file = e.target.files;
  let reader = new FileReader();

  reader.onload = (function (aImg) {
    return function (e) {
      // 현재 프로필 이미지 경로를 바꿈
      aImg.src = e.target.result;
    }
  })(profilePhotoImg);

  reader.readAsDataURL(get_file[0]);
  profilePhotoImg.src = get_file[0].name;
});

// '사진변경' 버튼을 누르면 profileFileInput을 누르도록 이벤트를 전달
profilePhotoImg.addEventListener('click', () => {
  let clickPhotoChangeBtn = new MouseEvent('click', {
    bubbles: true, cancelable: true, view: window
  });

  document.getElementById('profile-photo-upload').dispatchEvent(clickPhotoChangeBtn);
});