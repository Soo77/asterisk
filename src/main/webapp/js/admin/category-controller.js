class CategoryController {
  studentButton = document.getElementById('student-toggle-button');
  parentsButton = document.getElementById('parents-toggle-button');
  teacherButton = document.getElementById('teacher-toggle-button');
  cancelButton = document.getElementById('cancel-toggle-button');

  init() {
    this.getMemberData(1);
    this.studentButton.addEventListener('click', () => {this.getMemberData(1)});
    this.parentsButton.addEventListener('click', () => {this.getMemberData(2)});
    this.teacherButton.addEventListener('click', () => {this.getMemberData(3)});
    this.cancelButton.addEventListener('click', () => {this.getCancelData()});
  }

  getMemberData(memberTypeNo) {
    $.ajax({
      url: '/app/admin/getMemberInfo',
      data: {
        'memberTypeNo' : memberTypeNo
      },
      success: (result) => {
        let html = '';
        for (let i = 0; i < result.memberList.length; i++) {
          html += '<tr class="my-table-row row-no-'+result.memberList[i].memberNo+'">'
          html += '<td>'+result.memberList[i].memberNo+'</td>';
          html += '<td>'+result.memberList[i].name+'</td>';
          html += '<td>'+result.memberAge[i]+'세</td>';

          if (result.memberTypeNo == 1) {
            html += '<td>'
                  + result.memberInfoList[i].gender +' / '
                  + result.memberInfoList[i].addressCity +' / '
                  + result.memberInfoList[i].addressSuburb +' / '
                  + result.memberInfoList[i].schoolType +' / '
                  + result.memberInfoList[i].subjectName
                  + '</td>';

          } else if (result.memberTypeNo == 2) {
            html += '<td>자녀: '
            if (result.parentsInfoList[i].students[0].name === null) {
              html += '없음';
            } else {
              html += result.parentsInfoList[i].students[0].name;
              if (result.parentsInfoList[i].students[1] != null) {
                html += ' / ' +result.parentsInfoList[i].students[1].name;
              }
            }
            html += '</td>';
          
          } else if (result.memberTypeNo == 3) {
            html += '<td>'
                  + result.memberInfoList[i].gender +' / '
                   + result.memberInfoList[i].addressCity +' / '
                   + result.memberInfoList[i].addressSuburb +' / '
                   + result.memberInfoList[i].schoolType +' / '
                   + result.memberInfoList[i].subjectName
                   + '</td>';
          
          } else {
            html += '<td></td>';

          }

          html += '</tr>'
        }
        
        let tbody = document.getElementById('tbody-'+memberTypeNo);
        tbody.innerHTML = html;

        for (let i = 0; i < result.memberList.length; i++) {
          let thisTableRow = document.getElementsByClassName('row-no-'+result.memberList[i].memberNo)[0];
          thisTableRow.addEventListener('click', () =>{
            location.href = '/app/admin/detail?memberNo='+result.memberList[i].memberNo+'&memberTypeNo='+memberTypeNo;
          });
        }
      }
    });
  }

  getCancelData() {
    $.ajax({
      url: '/app/admin/getPendingLessons',
      success: (result) => {
        let html = '';
        for (let i = 0; i < result.pendingLessons.length; i++) {
          html += '<tr class="my-table-row lesson-row-no-'+result.pendingLessons[i].lessonNo+'">'
          html += '<td>'+result.pendingLessons[i].lessonNo+'</td>';
          html += '<td>'+result.studentList[i].name+'</td>';
          html += '<td>'+result.teacherList[i].name+'</td>';
          if (result.pendingLessons[i].studentLessonStop == 1) {
        	  html += '<td>학생쪽 중단 요청 수신 </td>';
          } else if (result.pendingLessons[i].teacherLessonStop == 1) {
        	  html += '<td>선생님쪽 중단 요청 수신 </td>';
          }
          html += '</tr>'
        }
        
        let tbody = document.getElementById('tbody-99');
        tbody.innerHTML = html;
        
        let thisTableRow;
        
        for (let i = 0; i < result.pendingLessons.length; i++) {
          thisTableRow = document.getElementsByClassName('lesson-row-no-'+result.pendingLessons[i].lessonNo)[0];
          thisTableRow.addEventListener('click', () =>{
            location.href = '/app/admin/interruptionDetail?lessonNo='+result.pendingLessons[i].lessonNo;
          });
        }
      }
    });
  }

}