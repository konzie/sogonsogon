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
      
      #answer{
      	font-size: 17px;
      	font-weight: bold;
      }
</style>
<title>고객센터 상세조회</title>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
	<div class="content2">       
      <h4 class="mb-5">고객센터 상세조회</h4>
      
      <hr>
      <h3 id="title">
      <c:if test="${help.lockStatus=='Y'}">
	     <img src="${contextPath}/resources/images/lock2.png" width="40px" height="40px">
	  </c:if>
	     ${help.helpTitle}</h3><h6 id="category"> [카테고리 : ${help.helpCategory}]</h6>
      <hr>
      <div>
		<p id="writer"> 작성자 : ${help.writerNick} </p><p id="date">${help.helpModifyDate}</p>
	  </div>
		<div id="board-content">${help.helpContent}
		<hr>
		<c:if test="${!empty answer}">
			<p id="answer">${answer.answerContent}</p>
		</c:if>
		</div>
		<hr>
		<div class="float-right">
		<c:if test="${empty answer}">
			<button type="button" class="btn btn-warning" onclick="location.href ='${contextPath}/mypage/answerView/${help.helpNo}'">답글달기</button>
		</c:if>
		<button type="button" class="btn btn-warning" onclick="location.href ='../adminhelp'">목록으로</button>
		</div>
		</div>
	</div>    
   
   <jsp:include page="../common/footer.jsp" />

</body>
</html>