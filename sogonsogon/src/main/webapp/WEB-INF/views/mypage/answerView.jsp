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
      	width : 100%;
      	height : 100px;
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
      	width : 100%; 
      	height : 120px; 
      	overflow: auto;
      }
      
      #answer-content{
      	width:100%;
      	height:300px;
      }
</style>
<title>고객센터 답변달기</title>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
	<div class="content2">       
      <h4 class="mb-5">답변달기</h4>
      
      <form action="${contextPath}/mypage/insertAnswer/${help.helpNo}" onsubmit="return validate();">
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
		</div>
		<div><br><p>답글 작성</p>
		<textarea id="answer-content" name="answer" resize: none;></textarea>
		</div>
		<div class="float-right">
		<button type="submit" class="btn btn-warning">등록</button>
		</div>
		</form>
		</div>
	</div>    
   
   <jsp:include page="../common/footer.jsp" />
<script>
function validate() {
	if ($("#answer-content").val().trim().length == 0) {
		alert("답변을 입력해 주세요.");
		$("#answer-content").focus();
		return false;
	}
}
</script>
</body>
</html>