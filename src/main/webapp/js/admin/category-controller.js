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
  }

  getMemberData(memberTypeNo) {
    $.ajax({
      url: '/app/admin/getMemberInfo',
      data: {
        'memberTypeNo' : memberTypeNo
      },
      success: (result) => {
        console.log(result);
        let html = '';
        for (let i = 0; i < result.memberList.length; i++) {
          html += '<tr class="my-table-row row-no-'+result.memberList[i].memberNo+'">'
          html += '<td>'+result.memberList[i].memberNo+'</td>';
          html += '<td>'+result.memberList[i].name+'</td>';
          html += '<td>'+result.memberAge[i]+'세</td>';
          html += '<td>한국대 졸업, 과외경력 20년</td>';
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
    })
  }

}