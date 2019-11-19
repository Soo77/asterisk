// 나의 과외 버튼
class MyLesson {
  memberTypeNo;

  constructor(memberTypeNo) {
    this.memberTypeNo = memberTypeNo;
  }

  addLinkToMyLessonButton() {
    let myLessonBtn = document.getElementsByClassName('my-lesson-btn')[0];
    myLessonBtn.addEventListener('click', (event) => {
      event.preventDefault();
      location.href = '/app/lesson/list'; 
    });
  }
}


class MypageInit {
  memberTypeNo;
  childIdCount = 0;

  constructor(memberTypeNo) {
    this.memberTypeNo = memberTypeNo;
  }

  displayMemberInfo() {
    this.displayTeacherInfo();
    this.displayStudentInfo();
    this.displayParentsInfo();
  }

  displayTeacherInfo() {
    if (memberTypeNo == 3) {
      let myLessonBtnDisplay = document.getElementsByClassName('my-lesson-btn')[0];
      let teacherDisplay = document.getElementsByClassName('teacherDisplay');

      myLessonBtnDisplay.style.display = 'inline-block';

      for (let td of teacherDisplay) {
        if (td.getAttribute('class').endsWith('hiddenNode'))
          continue;
        td.style.display = 'block';
      }
    }
  }

  displayStudentInfo() {
    if (memberTypeNo == 1) {
      let myLessonBtnDisplay = document.getElementsByClassName('my-lesson-btn')[0];
      let studentDisplay = document.getElementsByClassName('studentDisplay');

      myLessonBtnDisplay.style.display = 'inline-block';

      for (let sd of studentDisplay) {
        if (sd.getAttribute('class').endsWith('hiddenNode'))
          continue;
        sd.style.display = 'block';
      }
    }
  }

  displayParentsInfo() {
    if (memberTypeNo == 2) {
      let parentsDisplay = document.getElementsByClassName('parentsDisplay');

      for (let pd of parentsDisplay) {
        if (pd.getAttribute('class').endsWith('hiddenNode'))
          continue;
        pd.style.display = 'block';
      }
    }
  }

  setEventToRemoveChildIdButton() {
    let removeChildIdButton = document.getElementsByClassName('remove-childId-button')[0];
    this.addRemoveChildIdEventTo(removeChildIdButton);
  }

  addRemoveChildIdEventTo(thisBtn) {
    thisBtn.addEventListener('click', (event) => {
      if (this.childIdCount == 1)
        return;

      let thisChildIdNode = thisBtn.parentNode.parentNode;
      thisChildIdNode.parentNode.removeChild(thisChildIdNode);

      this.childIdCount--;
    });
  }

  addGoingToLessonListEventTo(thisBtn, i) {
    thisBtn.addEventListener('click', () => {
      let thisChildNo = myPatentsChildrenNo[i];
      location.href='/app/mypage/redirectLessonPage?thisChildNo='+thisChildNo;
    });
  }

  addChildIdNode() {
    let childrendId = document.getElementsByClassName('childId');
    let childIdTemplate = childrendId[0].cloneNode(true);

    childIdTemplate.setAttribute('class', 'form-group row childId mb-2 pt-1');

    childrendId[0].parentNode.insertBefore(childIdTemplate, childrendId[childrendId.length - 1].nextSibling);
    this.childIdCount++;

    this.addRemoveChildIdEventTo(childIdTemplate.childNodes[1].childNodes[3]);
    
    return childIdTemplate;
  }

  addEventToChildIdButton() {
    let childAddButton = document.getElementsByClassName('childAddButton')[0];

    childAddButton.addEventListener('click', () => {
      let addedChildIdObject = this.addChildIdNode();
      let childIdInput = addedChildIdObject.childNodes[3].childNodes[1].childNodes[1]
      let childNoInput = addedChildIdObject.childNodes[3].childNodes[1].childNodes[3];
      let childVerificationButton = addedChildIdObject.childNodes[3].childNodes[5].childNodes[1];
      let lessonListButtonDiv = addedChildIdObject.childNodes[3].childNodes[3];
      let childVerificationButtonDiv = addedChildIdObject.childNodes[3].childNodes[5];

      childVerificationButton.addEventListener('click', () => {
        console.log(childIdInput.value);
        $.ajax({
          url: '/app/mypage/verifyTheChild',
          data : {
            'childId' : childIdInput.value.trim()
          },
          success : (result) => {
            console.log(result);
            if (result.memberNo == null) {
              swal('해당하는 아이디의 유저가 없습니다!');
            } else {
              childNoInput.value = result.memberNo;
              childVerificationButtonDiv.style.display = 'none';
              lessonListButtonDiv.style.display = 'block';
              swal('인증 완료');
            }
          }

        })
      });

    });
  }

  addParentsChildrenNodes() {
    for (let i = 0; i < myParentsChildrenId.length; i++) {
      if (myParentsChildrenId == '')
        continue;
      let addedChildIdObject = this.addChildIdNode();
      let childIdInput = addedChildIdObject.childNodes[3].childNodes[1].childNodes[1];
      let childNoInput = addedChildIdObject.childNodes[3].childNodes[1].childNodes[3];
      let lessonListButton = addedChildIdObject.childNodes[3].childNodes[3].childNodes[3];
      let lessonListButtonDiv = addedChildIdObject.childNodes[3].childNodes[3];
      let childVerificationButtonDiv = addedChildIdObject.childNodes[3].childNodes[5];

      childIdInput.value = myParentsChildrenId[i];
      childNoInput.value = myPatentsChildrenNo[i];
      lessonListButtonDiv.style.display = 'block';
      childVerificationButtonDiv.style.display = 'none';
      this.addGoingToLessonListEventTo(lessonListButton, i);

    }
  }

}