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
      
      div{
      	margin : 10px;
      }
      
      .mb-1{
      	padding : 10px;
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
	   		<p align="center" id="count">신고글</p><p id="reportCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">고객센터</p><p id="qnaCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">스터디 방</p><p id="roomCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">가입 회원</p><p id="memberCount"></p>
	   	</div>
	  </div>
	   	
	   	<div id="report" class="board">
	   		<h4 class="mb-1">신고 게시판</h4>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th id="boardNo">글번호</th>
                        <th id="category">분류</th>
                        <th id="title">제목</th>
                        <th id="title">내용</th>
                        <th id="writer">작성자</th>						
                        <th id="create_dt">작성일</th>						
                        <th id="status">게시글 상태</th>

                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty reportList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 공지사항이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${reportList}">
	              		<tr>		
		              		<td>${board.qnaNo}</td>
		              		<td>${board.qnaCategory}</td>
		              		<td>${board.qnaTitle}</td>
		              		<td>${board.qnaContent}</td>
		              		<td>${board.writerNick}</td>
		              		<td>
		              			<jsp:useBean id="now1" class="java.util.Date"></jsp:useBean>
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
	   	
	   	<div id="qna" class="board">
	   		<h4 class="mb-1">고객센터</h4>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>						
                        <th>작성일</th>						
                        <th>비밀글</th>

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
          				<c:forEach var="board" items="${helpList}">
	              		<tr>		
		              		<td>${board.helpNo}</td>
		              		<td>${board.helpCategory}</td>
		              		<td>${board.helpTitle}</td>
		              		<td>${board.helpContent}</td>
		              		<td>${board.writerNick}</td>
		              		<td>
		              			<jsp:useBean id="now2" class="java.util.Date"></jsp:useBean>
		              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
		              			<fmt:formatDate var="createDate" value="${board.helpCreateDate}" pattern="yyyy-MM-dd"/>
		              			<fmt:formatDate var="createTime" value="${board.helpCreateDate}" pattern="hh:mm:ss"/>
		              			
		              			<c:choose>
		              				<c:when test="${today == createDate }">
		              					${createTime}
		              				</c:when>
		              				<c:otherwise>
		              				${createDate}
		              				</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>${board.lockStatus}</td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
	   	</div>
	   	
	   	<div id="notice" class="board">
	   		<h4 class="mb-1">공지 사항</h4>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th id="boardNo">글번호</th>
                        <th id="category">분류</th>
                        <th id="title">제목</th>
                        <th id="title">내용</th>
                        <th id="writer">작성자</th>						
                        <th id="create_dt">작성일</th>						
                        <th id="status">게시글 상태</th>

                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty noticeList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 공지사항이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${noticeList}">
	              		<tr>		
		              		<td>${board.qnaNo}</td>
		              		<td>${board.qnaCategory}</td>
		              		<td>${board.qnaTitle}</td>
		              		<td>${board.qnaContent}</td>
		              		<td>${board.writerNick}</td>
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