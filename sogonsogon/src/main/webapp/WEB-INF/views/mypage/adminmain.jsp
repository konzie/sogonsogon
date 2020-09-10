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
      	background-color: orange;
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
      <h4 class="mb-5">관리자 페이지</h4>
  
   <div class="countDiv">
	  	<div class="count">
	   		<hr color="orange"><p id="reportCount"></p><p align="center">신고글</p>
	   	</div>
	   	<div class="count">
	   		<hr color="orange"><p id="qnaCount"></p><p align="center">고객센터</p>
	   	</div>
	   	<div class="count">
	   		<hr color="orange"><p id="roomCount"></p><p align="center">스터디 방</p>
	   	</div>
	   	<div class="count">
	   		<hr color="orange"><p id="memberCount"></p><p align="center">가입 회원</p>
	   	</div>
	  </div>
	   	
	   	<div id="report">
	   		<h4 class="mb-5">신고 게시판</h4>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th id="boardNo">글번호</th>
                        <th id="category">분류</th>
                        <th id="title">제목</th>
                        <th id="writer">작성자</th>						
                        <th id="create_dt">작성일</th>						
                        <th id="status">답변/미답변</th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty boardList}">
		         		<tr>		
		         			<td colspan="6" align="center">오늘 신고된 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${qnaList}">
	              		<tr>		
		              		<td>${board.qnaNo}</td>
		              		<td>${board.qnaCategory}</td>
		              		<td>${board.qnaTitle}</td>
		              		<td>${board.writerName}</td>
		              		<td>
		              			<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
		              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
		              			<fmt:formatDate var="createDate" value="${board.qnaCreateDate}" pattern="yyyy-MM-dd"/>
		              			<fmt:formatDate var="createTime" value="${board.qnaCreateDate}" pattern="hh:mm:ss"/>
		              			
		              			<c:choose>
		              				<c:when test="${today == createDate }">
		              					${createTime}
		              				</c:when>
		              				<c:otherwise>
		              				${createDate}
		              				</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>${board.qnaStatus}</td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
	   	</div>
	   	
	   	<div id="qna">
	   		<div>고객센터</div>
	   	</div>
	   	
	   	<div id="notice">
	   		<div>공지사항</div>
	   	</div>
	   	
	</div>
 </div>    
   <jsp:include page="../common/footer.jsp" />

<script>
$(function(){
	$.ajax({
		url : "${contextPath}/mypage/reportCount",
		success : function(count){
			
			if(count>0){
				$("#reportCount").text(" ▲ "+count);
				$("#reportCount").css("color","green");
			}else if(count>10){
				$("#reportCount").text(" ▲▲  "+count);
				$("#reportCount").css("color","darkgreen");
			}else if(count==0){
				$("#reportCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});		
	
	$.ajax({
		url : "${contextPath}/mypage/qnaCount",
		success : function(count){
			if(count>0){
				$("#qnaCount").text(" ▲ "+count);
				$("#qnaCount").css("color","green");
			}else if(count>10){
				$("#qnaCount").text(" ▲▲  "+count);
				$("#qnaCount").css("color","darkgreen");
			}else if(count==0){
				$("#qnaCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});			
	
	$.ajax({
		url : "${contextPath}/mypage/roomCount",
		success : function(count){
			if(count>0){
				$("#roomCount").text(" ▲ "+count);
				$("#roomCount").css("color","green");
			}else if(count>10){
				$("#roomCount").text(" ▲▲  "+count);
				$("#roomCount").css("color","darkgreen");
			}else if(count==0){
				$("#roomCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});	
	
	$.ajax({
		url : "${contextPath}/mypage/memberCount",
		success : function(count){
			if(count>0){
				$("#memberCount").text(" ▲ "+count);
				$("#memberCount").css("color","green");
			}else if(count>10){
				$("#memberCount").text(" ▲▲  "+count);
				$("#memberCount").css("color","darkgreen");
			}else if(count==0){
				$("#memberCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});	
});
</script>
</body>
</html>