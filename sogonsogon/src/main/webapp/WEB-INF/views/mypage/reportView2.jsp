<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
      
      #board-content{
      	border : 1px solid brown;
      }
      
      .btn{
      	margin:10px 0;
      }
      
      h6, #title, #category, #writer, #date{
      	display: inline-block;
      }
      
      #category, #date{
      	float:right;
      }
      
      #board-content{
      	padding: 10px;
      	font-size: 15px;
      	overflow: scroll;
      }
</style>
<title>신고게시글 상세조회</title>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
	<div class="content2">       
      <h4 class="mb-5">신고게시글 상세조회</h4>
      
      <hr>
      <h6>no. ${board.roomBoardNo} [방번호 : ${board.roomNo}]</h6><h6 id="category"> [카테고리 : ${board.roomBoardType}]</h6>
      <hr>
      <h3 id="title">${board.roomBoardTitle}</h3>
      <hr>
      <div>
      <fmt:formatDate var="createDate" value="${board.roomBoardCreateDate}" pattern="yyyy-MM-dd"/>
		<p id="writer"> 작성자 : ${board.roomBoardWriter} </p><p id="date">${createDate}</p>
	  </div>
		<div id="board-content">${board.roomBoardContent}
		<div style="color:crimson; font-size: 20px; letter-spacing: 15px; text-align:center;">
		<b>
			<br>■-----------------------------------------■<br>해당 게시글은 신고되었습니다.
			<br>■-----------------------------------------■
		</b>
		</div>
		</div>
		<hr>
		<div class="float-right">
		
			<button type="button" class="btn btn-danger" onclick="location.href ='${contextPath}/mypage/updateReport/${board.roomBoardWriterNo}/${board.roomBoardNo}/${board.roomNo}'">삭제</button>
			<button type="button" class="btn btn-dark" onclick="location.href ='${contextPath}/mypage/restoreReportRoom/${board.roomBoardWriterNo}/${board.roomBoardNo}/${board.roomNo}'">복원</button>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href ='${contextPath}/mypage/reportRoom'">목록으로</button>
		</div>
		</div>
	</div>    
   
   <jsp:include page="../common/footer.jsp" />

</body>
</html>