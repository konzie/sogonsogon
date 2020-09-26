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
      	width : 100%;
      	height : 300px;
      	overflow: auto;
      }
      
      .btn{
      	margin:10px 0;
      }
      
      #title, #category, #writer, #date{
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
      <h3 id="title">${report.qnaTitle}</h3><h6 id="category"> [카테고리 : ${report.qnaCategory}]</h6>
      <hr>
      <div>
      <fmt:formatDate var="createDate" value="${report.qnaCreateDate}" pattern="yyyy-MM-dd"/>
		<p id="writer"> 작성자 : ${report.writerNick} </p><p id="date">${createDate}</p>
	  </div>
		<div id="board-content">${report.qnaContent}
		<p style="color:crimson; font-size: 20px; letter-spacing: 15px; text-align:center;">
		<b>
			<br>■-----------------------------------------■<br>해당 게시글은 신고되었습니다.
			<br>■-----------------------------------------■
		</b>
		</p>
		</div>
		<div class="float-right">
		
		<c:choose>
		<c:when test="${loginMember.memberNo==1}">
			<button type="button" class="btn btn-danger" onclick="location.href ='../updateReport/${report.writer}/${report.qnaNo}/0'">삭제</button>
			<button type="button" class="btn btn-dark" onclick="location.href ='../restoreReport/${report.writer}/${report.qnaNo}'">복원</button>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href ='../reportBoard'">목록으로</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href ='../reportBoard'">목록으로</button>
		</c:otherwise>
		</c:choose>
		</div>
		</div>
	</div>    
   
   <jsp:include page="../common/footer.jsp" />

</body>
</html>