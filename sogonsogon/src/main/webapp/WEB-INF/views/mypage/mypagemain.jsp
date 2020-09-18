<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
      padding : 10px 10px;
      }
      
      *{
      	text-decoration: none;
      }
      
      #reportContent{
      	background-color: #FAE0D4;
      	padding:10px;
      	display: inline-block;
      	height:300px;
      	width:50%;
      }
      
      #reportNotice{
      	display: inline-block;
      	padding: 10px;
      	height:300px;
      	font-size: 18px;
      }
      
      #writer{
      	float:left;
      	font-size: 15px;
      }
            
      #writeday{
      	float:right;
      	font-size: 15px;
      }
      
      #board-content{
      	font-size: 20px;
      	position: absolute;
      }
      
      h4{
      	margin:5px;
      	color:#E04848;
      }
</style>
</head>
<body>   

  <jsp:include page="../common/header.jsp" />
  
  <div>
  <jsp:include page="mypage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="mypage2.jsp"/>
	<div class="content2">   
	<h4>신고된 게시글</h4>  
		<c:choose>
          	<c:when test="${empty report}">
          		<p>신고된 사항이 없습니다.</p>
          	</c:when>
        <c:otherwise>
           
		<div id="reportContent">
        	<h3>제목 : ${reportView.qnaTitle.trim()}</h3><hr>
        	<div id="writer">작성자 : ${reportView.writerNick}</div><div id="writeday">작성일 : ${reportView.qnaCreateDate}</div>
        	<br>
        	<hr>
			<div id="board-content">${reportView.qnaContent}</div>
		</div>
			<div id="reportNotice">
					해당 게시글이 신고되었습니다. 
					<br>현재 신고된 수는 ${report.reportCount} 입니다. 
					앞으로 ${3-report.reportCount}번 더 신고 받으면 사이트 이용이 불가합니다.
			</div>
        </c:otherwise>
        </c:choose>	
	   	
	</div>
 </div>    
   <jsp:include page="../common/footer.jsp" />

<script>

</script>
</body>
</html>