<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<style>
    .img-fluid {
      width: 220px;
      height: 220px;
      object-fit: cover; 
    }
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
}
</style>
</head>
    
 
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/bg3.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <h1>수업 리스트</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container">
      <div class="section text-center">
${memberInfoMap.teacher.approvementState}
    <c:if test="${loginUser.memberTypeNo eq 3}">
    
      <a href="currAdd" class="btn btn-primary addCurrBtn" style="margin-bottom: 15px; left: 335px;">새 커리큘럼 등록</a>  
    </c:if>

<c:set var="i" value="0" />
<!-- <h1 style="font-family: 'Nanum Gothic';">수업 리스트</h1> --> 
<c:forEach items="${lessons}" var="lesson">
  <div class="text-center">
  <div class="card w-75"> 
  <div class="row no-gutters">
    <c:choose>
     <c:when test="${loginUser.memberTypeNo eq 3 and lesson.member.profilePhoto eq NULL}">
       <div class="col-md-3"> 
          <img src="<%=request.getContextPath()%>/upload/join/default2.png"  class="card-img-top img-fluid"> 
       </div> 
     </c:when> 
      <c:otherwise> 
        <img src="<%=request.getContextPath()%>/upload/join/${lesson.member.profilePhoto}" alt="Raised Image" class="img-raised rounded img-fluid">
      </c:otherwise>
    </c:choose> 
    <div style="font-family: 'Nanum Gothic';" class="card-body">
      <h5 style="font-family: 'Nanum Gothic';" class="card-title text-left">수업번호: ${lesson.lessonNo}</h5>
      <p class="card-text text-left">
      <c:choose>  
      <c:when test="${lesson.member.name eq NULL}"> <td>이름: 미정<br></td> </c:when>
      <c:otherwise> <td>이름: ${lesson.member.name}<br></td> </c:otherwise>
      </c:choose>
              수업과목:
      <c:choose>
      <c:when test="${lesson.subject.schoolTypeNo eq 1}">
                  초등
      </c:when>
      <c:when test="${lesson.subject.schoolTypeNo eq 2}">
                  중등
      </c:when>
      <c:when test="${lesson.subject.schoolTypeNo eq 3}">
                  고등
      </c:when>
      <c:otherwise> 
      </c:otherwise>
      </c:choose>
       ${lesson.subjectName}<br>
            시작일: ${lesson.startDate}&ensp;종료일: ${lesson.endDate}
      </p>
<!--       <a href="detail.jsp"  class="btn btn-primary">상세보기</a> -->

        
<!--        <button class="btn btn-primary">결제 대기중<div class="ripple-container"></div></button>&ensp;&ensp;&ensp; -->
      <c:choose>
       <c:when test="${lesson.lessonState ne 0 and lesson.lessonState ne 2}">
       <a href="../dayLesson/list?lessonNo=${lesson.lessonNo}" class="btn btn-primary float-right ">상세보기</a>&ensp;&ensp;  
       <a href="fixedDetail?lessonNo=${lesson.lessonNo}" class="btn btn-primary float-right">커리큘럼 보기</a> 
       </c:when>
       <c:when test="${loginUser.memberTypeNo eq 3}">
            <a href="detail?lessonNo=${lesson.lessonNo}" class="btn btn-primary float-right">수정</a> 
       </c:when>
       <c:when test="${loginUser.memberTypeNo ne 3}">
            <a href="fixedDetail?lessonNo=${lesson.lessonNo}" class="btn btn-primary float-right">커리큘럼 보기</a> 
       </c:when>
      </c:choose>
      
      <c:choose>
        <c:when test="${lesson.lessonState eq 0}">
          <button type="button" class="btn btn-primary float-right" 
				  data-toggle="modal" data-target="#exampleModal${i}">학생초대</button>&ensp;&ensp;
				  
				  <div id="exampleModal${i}" class="modal fade" data-backdrop="false">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">
				            <span>×</span>
				          </button>
				        </div>
				        <span class="messageLessonNo${i}" id="${lesson.lessonNo}">수업번호 : ${lesson.lessonNo}</span>
				                수업과목:
					      <c:choose>
					      <c:when test="${lesson.subject.schoolTypeNo eq 1}">
					                  초등
					      </c:when>
					      <c:when test="${lesson.subject.schoolTypeNo eq 2}">
					                  중등
					      </c:when>
					      <c:when test="${lesson.subject.schoolTypeNo eq 3}">
					                  고등
					      </c:when>
					      <c:otherwise> 
					      </c:otherwise>
					      </c:choose>
					       ${lesson.subjectName}<br>
					            시작일: ${lesson.startDate}&ensp;종료일: ${lesson.endDate}
					      
				        <div class="messageRow">
				          <input type="text" id="std${i}" placeholder="학생 아이디 입력">
				          <button onclick="list(this)" id="${i}"
				          class="btn btn-primary btn-sm">검색</button>
				        </div>
				
				        <div id="searchResult${i}"></div>
				
				        <input type="text" id="choiceId${i}" readOnly>
				        <button id="lessonMessage${i}" onclick="lessonMessage(${i})" 
				        class="btn btn-primary btn-sm">메세지  전송</button>
							  <c:set var="i" value="${i+1}"/>
				      </div>
				    </div>
				  </div>
        </c:when>
        <c:when test="${lesson.lessonState eq 2}">
          <button type="button" class="btn float-right">결제 대기중</button>&ensp;&ensp;
        </c:when>
        <c:when test="${lesson.lessonState eq 3}">
          <button type="button" class="btn float-right">중단 요청중</button>&ensp;&ensp;
        </c:when>
        <c:when test="${lesson.lessonState eq 4}">
          <button type="button" class="btn float-right">환불 대기중</button>&ensp;&ensp;
        </c:when>
        <c:when test="${lesson.lessonState eq 5}">
          <button type="button" class="btn float-right">종료된 수업</button>&ensp;&ensp;  
        </c:when>
      
      </c:choose>
      </div>
  </div>
      
    </div>
  </div>
</c:forEach>  


      </div> 
    </div>
  </div>
  
  <script>
  function list(search) {
	  var no = search.id;
    var id = document.getElementById("std"+no).value;
      $.ajax({
        url : "/app/message/searchStd",
        type : "post",
        data : {id : id},
        success : function(data){
          $("#searchResult"+no).text("");
          for(var i in data){
            console.log(data);
            var result = "아이디:<a href='javascript:void(0)'"
            result += "onclick='selectId(this,"+no+")'"
            result += " id="+data[i].memberNo+">"+data[i].id+"</a>"
            result += " 이름:"+data[i].name
            result += " 성별:"+data[i].gender
            result += " 생년월일:"+data[i].dateOfBirth
            result += " 주소:"+data[i].addressCity+" "+data[i].addressSuburb+"<br>"
            $("#searchResult"+no).append(result);
          }
        },
        error : function(){
          console.log("실패");
        }
      })
  }
</script>

  <!-- 아이디 선택 -->
  <script>
  function selectId(clickId, no){
  var memNo = clickId.id;
  var val = clickId.text;
    $("#choiceId"+no).attr("placeholder",val)
    $("#lessonMessage"+no).attr("value",memNo)
  }
  </script>

  <!-- 메세지 전송 -->
  <script>
  function lessonMessage(no){
  var memberNo = document.getElementById("lessonMessage"+no).value;
  var lessonNo = document.getElementsByClassName("messageLessonNo"+no)[0].id;
  console.log(memberNo);
  console.log(lessonNo);
    var messageConts = "${loginUser.name}님이<br>수업에 초대했습니다.<br>"
    messageConts += "커리큘럼을 확인해보세요!<br><br>"
    messageConts += "<button onclick='lessonMatchingStd(this)' name="+lessonNo
    messageConts += " value="+memberNo
    messageConts += " class='btn btn-primary btn-sm'>커리큘럼 확인</button>"
    
    if(memberNo == ""){
      alert("학생을 선택해주세요");
      return false;
    }
      
      $.ajax({
        url:"/app/message/messagein",
        type:"post",
        data:"senderNo="+${loginUser.memberNo}+"&messageConts=" + 
        messageConts + "&receiverNo=" + memberNo,
        success : function(data) {
         alert("초대 메세지를 보냈습니다");
        },
        error : function() {
         console.log("실패");
        }
      })
  }
  </script>

  <!--   Core JS Files   -->
  <script src="/assets/js/plugins/moment.min.js"></script>
