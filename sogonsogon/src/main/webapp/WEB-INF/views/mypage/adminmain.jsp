<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
      .content{
      float:left;
      width:100%;
      height:100%;
      }
      
      .content2{
	      float:left; 
	      width:72%;
	      height:100%;
	      padding:20px 0px 0px 30px;
      }
      
      .count{
      	display: inline-block;
      	border : 1px solid orange;
      	height:10$;
      	width:23%;
      	text-align: center;
      	font-size: 30px;
      	font-weight: bold;
      }
      
      .countDiv{
      	height:5%;
      	width:100%;
      }
      
      #count{
      	background-color: rgba(241, 158, 48,0.7);
      }
      
      .board{
      	border:solid 1px rgba(241, 158, 48,0.7);
      }
      
      .content2 div{
      	margin : 10px;
      }
      
      .mb-1{
      	padding : 10px;
      }
      
      .tableTitle{
      	display: inline-block;
      }
      
      .tableTitle>a{
        color:black;
      	text-decoration: none;  
      }
      .tableButton{
      	display:inline-block;
      	float : right;
      	margin:10px 5px;
      }
</style>
</head>
<body>   

  <jsp:include page="../common/header.jsp" />
  
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
	<div class="content2">       
   <div class="countDiv">
	  	<div class="count">
	   		<p align="center" id="count">새 신고글</p><p id="reportCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">새 문의</p><p id="qnaCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">새 스터디 방</p><p id="roomCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">새 가입 회원</p><p id="memberCount"></p>
	   	</div>
	  </div>
	   	
	   	<div class="board">
	   	<div id="report">
	   		<h4 class="mb-1 tableTitle"><a href="reportBoard">자유질문방 신고글</a></h4><button class="btn btn-outline-secondary btn-sm tableButton" onclick="location.href ='reportBoard'">메뉴로 이동</button>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>						
                        <th>작성일</th>						
                        <th>처리</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty reportList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 신고 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${reportList}">
	              		<tr>		
	              			<jsp:useBean id="now3" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today3" value="${now3}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate3" value="${board.qnaCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime3" value="${board.qnaCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today3 == createDate3}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span>${board.qnaNo}</span>
		              		</td>
		              		<td>${board.qnaCategory}</td>
		              		<td>${board.qnaTitle}</td>
		              		<td>${board.qnaContent}</td>
		              		<td>${board.writerNick}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today3 == createDate3}">${createTime3}</c:when>
		              				<c:otherwise>${createDate3}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td><button type="button" class="btn btn-danger btn-sm" onclick="location.href ='${contextPath}/mypage/updateReport/${board.writer}/${board.qnaNo}/0'">경고</button>          <button type="button" class="btn btn-dark btn-sm" onclick="location.href ='${contextPath}/mypage/restoreReport/${board.writer}/${board.qnaNo}'">X</button></td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
            </div>
            <div id="reportRoom">
       <h4 class="mb-1 tableTitle"><a href="reportRoom">스터디방 신고글</a></h4><button class="btn btn-outline-secondary btn-sm tableButton" onclick="location.href ='reportRoom'">목록으로</button>
              <table class="table table-striped table-hover reportRoomBoard">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>						
                        <th>작성일</th>		
                        <th>처리 </th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty roomReportList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="roomBoard" items="${roomReportList}">
	              		<tr>		
	              			<jsp:useBean id="now1" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today1" value="${now1}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate1" value="${roomBoard.roomBoardCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime1" value="${roomBoard.roomBoardCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today1 == createDate1}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span>${roomBoard.roomBoardNo}</span><span style="display:none;">${roomBoard.roomNo}</span><span>(ROOM : ${roomBoard.roomNo})</span>
		              		</td>
		              		<td>${roomBoard.roomBoardType}</td>
		              		<td>${roomBoard.roomBoardTitle}</td>
		              		<td>${roomBoard.roomBoardContent}</td>
		              		<td>${roomBoard.roomBoardWriter}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today1 == createDate1 }">${createTime1}</c:when>
		              				<c:otherwise>${createDate1}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td><button type="button" class="btn btn-danger btn-sm" onclick="location.href ='updateReport/${roomBoard.roomBoardWriterNo}/${roomBoard.roomBoardNo}/${roomBoard.roomNo}'">경고</button>          <button type="button" class="btn btn-dark btn-sm" onclick="location.href ='restoreReportRoom/${roomBoard.roomBoardWriterNo}/${roomBoard.roomBoardNo}/${roomBoard.roomNo}'">X</button></td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
	   	</div>
	   	</div>
	   	
	   	<div id="help" class="board">
	   		<h4 class="mb-1 tableTitle"><a href="adminhelp">고객센터</a></h4><button class="btn btn-outline-secondary btn-sm tableButton" onclick="location.href ='adminhelp'">목록으로</button>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>						
                        <th>작성일</th>						
                        <th>답변여부</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty helpList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="help" items="${helpList}">
	              		<tr>		
	              			<jsp:useBean id="now2" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today2" value="${now2}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate2" value="${help.helpCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime2" value="${help.helpCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today2 == createDate2}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span>${help.helpNo}
	              			<c:if test="${help.lockStatus=='Y'}">
	              				<img src="${contextPath}/resources/images/lock2.png" width="30px" height="30px">
	              			</c:if>
		              		</span>
		              		</td>
		              		<td>${help.helpCategory}</td>
		              		<td>${help.helpTitle}</td>
		              		<td>${help.helpContent}</td>
		              		<td>${help.writerNick}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today2 == createDate2 }">${createTime2}</c:when>
		              				<c:otherwise>${createDate2}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${help.answerChk=='N'}"><button type="button" class="btn btn-warning btn-sm" onclick="location.href='answerView/${help.helpNo}'">답변하기</button></c:when>
		              				<c:otherwise><button type="button" class="btn btn-secondary btn-sm">답변완료</button></c:otherwise>
		              			</c:choose>
		              		</td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
	   	</div>
	   	
	   	<div id="member" class="board">
	   	<h4 class="mb-1 tableTitle"><a href="adminmember">회원 관리</a></h4><button class="btn btn-outline-secondary btn-sm tableButton" onclick="location.href ='adminmember'">목록으로</button>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>no.</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>닉네임</th>						
                        <th>연락처</th>						
                        <th>이메일</th>						
                        <th>관심사</th>
                        <th>가입일</th>
                        <th>회원 상태</th>
                        <th>회원 등급</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty memberList}">
		         		<tr>		
		         			<td colspan="10" align="center">오늘 가입한 회원이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
                         <c:forEach var="member" items="${memberList}">
                               <tr>		
	              			<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${member.memberEnrollDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${member.memberEnrollDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today == createDate}">
	              					<span class="badge badge-primary new">new</span>
		              			</c:if>
                                  <span>${member.memberNo}</span></td>
                                  <td>${member.memberId}</td>
                                  <td>${member.memberName}</td>
                                  <td>${member.memberNick}</td>
                                  <td>${member.memberPhone}</td>
                                  <td>${member.memberEmail}</td>
                                  <td>${member.memberInterest}</td>
                                  <td>${member.memberEnrollDate}</td>
                                  
                                  <c:choose>
	                                 <c:when test="${member.memberStatus.equals('Y')}">
	                                 	<td>정상</td>
	                                 </c:when>
	                                 <c:when test="${member.memberStatus.equals('R')}">
	                                 	<td>신고</td>
	                                 </c:when>
	                                 <c:otherwise>
	                                 	<td>탈퇴</td>
	                                 </c:otherwise>
                                  </c:choose>
                                  <c:choose>
                                  <c:when test="${member.memberGrade.equals('G')}">
                                  	<td>일반 회원</td>
                                  </c:when>
                                  <c:otherwise>
                                  	<td>관리자</td>
                                  </c:otherwise>
                                  </c:choose>
                               </tr>
                         </c:forEach>
                      </c:otherwise>
          		</c:choose>
                </tbody>
            </table>
	   	</div>
	   	
	</div>
 </div>    
   <jsp:include page="../common/footer.jsp" />

<script>
$(function(){
	$.ajax({
		url : "${contextPath}/mypage/reportCount",
		success : function(count){
			if(count>10){
				$("#reportCount").text(" ▲▲  "+count);
				$("#reportCount").css("color","darkgreen");
			}else if(count>0){
				$("#reportCount").text(" ▲ "+count);
				$("#reportCount").css("color","yellowgreen");
			}else{
				$("#reportCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});		
	
	$.ajax({
		url : "${contextPath}/mypage/qnaCount",
		success : function(count){
			if(count>10){
				$("#qnaCount").text(" ▲▲  "+count);
				$("#qnaCount").css("color","darkgreen");
			}else if(count>0){
				$("#qnaCount").text(" ▲ "+count);
				$("#qnaCount").css("color","yellowgreen");
			}else{
				$("#qnaCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});			
	
	$.ajax({
		url : "${contextPath}/mypage/roomCount",
		success : function(count){
			if(count>10){
				$("#roomCount").text(" ▲▲  "+count);
				$("#roomCount").css("color","darkgreen");
			}else if(count>0){
				$("#roomCount").text(" ▲ "+count);
				$("#roomCount").css("color","yellowgreen");
			}else{
				$("#roomCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});	
	
	$.ajax({
		url : "${contextPath}/mypage/memberCount",
		success : function(count){
			if(count>10){
				$("#memberCount").text(" ▲▲  "+count);
				$("#memberCount").css("color","darkgreen");
			}else if(count>0){
				$("#memberCount").text(" ▲ "+count);
				$("#memberCount").css("color","yellowgreen");
			}else{
				$("#memberCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});	
});

$(".new").parent().parent().css("background-color","bisque");

$("#report td:not(:last-child)").on("click",function(){
	if($(this).parent().children().children().eq(0).text()=="new"){
		var boardNo = $(this).parent().children().children().eq(1).text(); 				
	}else{
		var boardNo = $(this).parent().children().children().eq(0).text(); 	
	}
	location.href = "${contextPath}/mypage/reportView/"+boardNo;
}).on("mouseenter", function(){
	$(this).parent().css("cursor", "pointer");
});  

$("#reportRoom td:not(:last-child)").on("click",function(){
	if($(this).parent().children().children().eq(0).text()=="new"){
		var boardNo = $(this).parent().children().children().eq(1).text(); 
		var roomNo = $(this).parent().children().children().eq(2).text(); 				
	}else{
		var boardNo = $(this).parent().children().children().eq(0).text();
		var roomNo = $(this).parent().children().children().eq(1).text();  	
	}
	location.href = "${contextPath}/mypage/reportView2/"+boardNo+"/"+roomNo;
}).on("mouseenter", function(){
	$(this).parent().css("cursor", "pointer");
});  

$("#help td:not(:last-child)").on("click",function(){

	if($(this).parent().children().children().eq(0).text()=="new"){
		var boardNo = $(this).parent().children().children().eq(1).text(); 				
	}else{
		var boardNo = $(this).parent().children().children().eq(0).text(); 	
	}
	location.href = "${contextPath}/mypage/helpView/"+boardNo;
}).on("mouseenter", function(){
	$(this).parent().css("cursor", "pointer");
});  
</script>
</body>
</html>