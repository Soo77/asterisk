class TeacherPhotoController {
    teacherPhotos;
    teacherPhotoCount = 0;
    indexOfPhotos = 1;
    initialPhotoLoadingCompleted = false;

    constructor(teacherPhotos) {
      this.teacherPhotos = teacherPhotos;
    }

    addEventOfDeletionPhoto(thisDeleteButton) {
      thisDeleteButton.addEventListener('click', () => {
        // if (this.teacherPhotoCount == 1)
        //   return;
        let thisPhotoCard = thisDeleteButton.parentNode;

        thisPhotoCard.parentNode.removeChild(thisPhotoCard);
        this.teacherPhotoCount--;
        if (this.teacherPhotoCount == 0)
          document.getElementById('my-image-wrapper').style.height = '343px';
      });
    }

    addTeacherPhotoNode(photoFileName) {
      let html = '';
      html += '<div class="card my-images mr-1 photo-no-' + this.indexOfPhotos + '" style="display: none;">';
      html += '<img class="card-img-top my-teacher-images" src="/upload/teacher_photo/' + photoFileName + '" alt="Card image cap">';
      html += '<div class="card-body d-flex btn btn-outline-primary mx-0 my-0 px-0 py-0 photo-delete-button-div" style="box-shadow: none; border-top-left-radius: 0; border-top-right-radius: 0;">';
      html += '<button type="button" class="btn btn-outline-primary mx-0 my-0" style="flex-basis: 100%; box-shadow: none; border: 0;">';
      html += '삭제';
      html += '</button>';
      html += '</div>';
      html += '<input type="text" class="photo-name-no-' + this.indexOfPhotos + '" name="teacherPhotoNames" value="' + photoFileName + '" hidden>';
      html += '<input type="file" class="photo-file-no' + this.indexOfPhotos + '" name="teacherPhotoFiles">';
      html += '</div>';

      $('#my-image-wrapper').append(html);

      let thisPhotoCard = document.getElementsByClassName('photo-no-' + this.indexOfPhotos)[0];
      let thisPhoto = document.getElementsByClassName('photo-no-' + this.indexOfPhotos)[0].childNodes[0];
      let thisPhotoName = document.getElementsByClassName('photo-name-no-' + this.indexOfPhotos)[0];

      let thisDeleteButton = thisPhotoCard.childNodes[1];
      let thisFileInput = document.getElementsByClassName('photo-file-no' + this.indexOfPhotos)[0];

      this.addEventOfDeletionPhoto(thisDeleteButton);

      if (this.initialPhotoLoadingCompleted) {
        thisFileInput.addEventListener('change', e => {
          let get_file = e.target.files;
          let reader = new FileReader();

          reader.onload = ((thisPhoto, thisPhotoCard) => {
            return (e) => {
              thisPhotoCard.style.display = 'inline-block';
              thisPhoto.src = e.target.result;
            }
          })(thisPhoto, thisPhotoCard);

          reader.readAsDataURL(get_file[0]);
          thisPhotoName.value = get_file[0].name;
          document.getElementById('my-image-wrapper').style.height = 'auto';
        });

        // 사진 등록 버튼을 누르면 파일 업로드를 클릭하도록 이벤트 전달
        let clickPhotoChangeEvent = new MouseEvent('click', {
          bubbles: true, cancelable: true, view: window
        });
        thisFileInput.dispatchEvent(clickPhotoChangeEvent);
      }

      if (!this.initialPhotoLoadingCompleted)
        thisPhotoCard.style.display = 'inline-block';

      this.teacherPhotoCount++;
      this.indexOfPhotos++;

    }

    addEventToPhotoAddButton() {
      let photoAddButton = document.getElementsByClassName('photo-add-button')[0];
      photoAddButton.addEventListener('click', () => {
        this.addTeacherPhotoNode('c.jpg');
      });
    }

    loadInitialTeacherPhotos() {
      for (let photoName of this.teacherPhotos) {
        this.addTeacherPhotoNode(photoName);
      }

      this.initialPhotoLoadingCompleted = true;

      this.addEventToPhotoAddButton();
    }


  }