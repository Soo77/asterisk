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
      let tutorCertiSpan = document.getElementsByClassName('tutor-certi-span')[0];
      let teacherDisplay = document.getElementsByClassName('teacherDisplay');

      tutorCertiSpan.style.display = 'inline-block';

      for (let td of teacherDisplay)
        td.style.display = 'block';
    }
  }

  displayStudentInfo() {
    if (memberTypeNo == 1) {
      let studentDisplay = document.getElementsByClassName('studentDisplay');

      for (let sd of studentDisplay)
        sd.style.display = 'block';
    }
  }

  displayParentsInfo() {
    if (memberTypeNo == 2) {
      let parentsDisplay = document.getElementsByClassName('parentsDisplay');

      for (let pd of parentsDisplay)
        pd.style.display = 'block';
    }
  }

  checkTeacherApprovement(teacherUniversityConfirmation, teacherApprovementState) {
    if (this.memberTypeNo == 3) {
      if (teacherApprovementState == 'true') {
        let tutorCertichecked = document.getElementsByClassName('tutor-certi-checked')[0];
        tutorCertichecked.style.display = 'inline-block';
      } else if (teacherApprovementState == 'false' || teacherApprovementState == '') {
        let tutorCertiUnchecked = document.getElementsByClassName('tutor-certi-unchecked')[0];
        tutorCertiUnchecked.style.display = 'inline-block';
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
      this.addChildIdNode();
    });
  }

  addParentsChildrenNodes() {
    for (let i = 0; i < myParentsChildrenId.length; i++) {
      let addedChildIdObject = this.addChildIdNode();
      let childIdInput = addedChildIdObject.childNodes[3].childNodes[1].childNodes[1];
      let lessonListButton = addedChildIdObject.childNodes[3].childNodes[3].childNodes[3];
      
      childIdInput.value = myParentsChildrenId[i];
      this.addGoingToLessonListEventTo(lessonListButton, i);

    }
  }

}