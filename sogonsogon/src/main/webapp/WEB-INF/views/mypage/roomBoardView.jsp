<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      	width : 100%;
      	height : 300px;
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
      }
</style>
<title>스터디방 게시글 상세조회</title>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  
  <div>
  <jsp:include page="mypage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="mypage2.jsp"/>
	<div class="content2">       
      <h4 class="mb-5">스터디방 게시글 상세조회</h4>
      
      <hr>
      <h6>no. ${roomBoard.roomBoardNo} [방번호 : ${roomBoard.roomNo}]</h6><h6 id="category"> [카테고리 : ${roomBoard.roomBoardType}]</h6>
      <hr>
      <h3 id="title">${roomBoard.roomBoardTitle}</h3>
      <hr>
      <div>
		<p id="writer"> 작성자 : ${roomBoard.roomBoardWriter} </p><p id="date">${roomBoard.roomBoardCreateDate}</p>
	  </div>
		<div id="board-content">${roomBoard.roomBoardContent}
		<c:if test="${roomBoard.roomBoardStatus=='R'}">
			<span style="color:red"> <br>---------------------------------------------- <br> 신고된 게시글 입니다. </span>
		</c:if>
		</div>
		<hr>
		<div class="float-right">
		<c:if test="${roomBoard.roomBoardStatus!='D'}">
			<button type="button" class="btn btn-warning" onclick="location.href ='${contextPath}/roomBoard/${roomBoard.roomNo}/${roomBoard.roomBoardNo}/update'">수정</button>
			<button type="button" class="btn btn-warning" onclick="location.href ='${contextPath}/roomBoard/${roomBoard.roomNo}/${roomBoard.roomBoardNo}/delete'">삭제</button>
		</c:if>
		<button type="button" class="btn btn-warning" onclick="location.href ='${contextPath}/mypage/myRoomboard'">목록으로</button>
		</div>
		</div>
	</div>    
   
   <jsp:include page="../common/footer.jsp" />

</body>
</html>