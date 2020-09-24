<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face { font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff'); font-weight: normal; font-style: normal; }

      .content{
	     float:left;
	     width:100%;
	     height:100%;
      }
      
      .content2{
         font-family: 'GmarketSansMedium';
      	 float:left; 
      	 width:75%;
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
      
      #greeting{
      	display: inline-block;
      	float:left;
      	position: absolute;
      	text-align: justify;
      	line-height: 100px;
		margin: 0 250px;
		padding: 10px;
		text-shadow: 1px 1px 1px 1px blue; 
      }
      
      #party1{
      	display:inline-block;
      	float:left;
      	position: relative;
      }    
        
      #party2{
      	display:inline-block;
      	float:right;
      }
      
      h5{
      	clear: both;
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
	<div>
	<img src="${contextPath}/resources/images/party1.png" id="party1" height="20%" width="20%">
	<h2 align="center" id="greeting">${loginMember.memberNick} 님 환영합니다! </h2>
	<img src="${contextPath}/resources/images/party2.png" id="party2"  height="20%" width="20%">
	</div>
	<div style="border: 1px solid #FAE0D4; clear:both; margin:3px; padding:3px;">
	<h5>※ 신고된 게시글 ※ </h5> 
	<hr> 
		<c:choose>
          	<c:when test="${empty report}">
          		<p>신고된 사항이 없습니다.</p>
          	</c:when>
        <c:otherwise>
         
        <c:choose>
        <c:when test="${report.roomNo>0}"> 
		<div id="reportContent">
        	<h3>제목 : ${board.roomBoardTitle}</h3><hr>
        	<div>방 번호 : ${board.roomNo}</div><div> [ 게시글 번호 : ${board.roomBoardNo} ] </div>
        	<div id="writer">작성자 : ${board.roomBoardWriter}</div><div id="writeday">작성일 : ${board.roomBoardCreateDate}</div>
        	<br>
        	<hr>
			<div id="board-content">${board.roomBoardContent}</div>
		</div>
		</c:when>
		<c:otherwise>
		<div id="reportContent">
        	<h3>제목 : ${reportView.qnaTitle}</h3><hr>
        	<div id="writer">작성자 : ${reportView.writerNick}</div><div id="writeday">작성일 : ${reportView.qnaCreateDate}</div>
        	<br>
        	<hr>
			<div id="board-content">${reportView.qnaContent}</div>
		</div>
		</c:otherwise>
		</c:choose>
			<div id="reportNotice">
					해당 게시글이 신고되었습니다. 
					<br>현재 신고된 수는 ${report.reportCount} 입니다. 
					앞으로 ${3-report.reportCount}번 더 신고 받으면 사이트 이용이 불가합니다.
			</div>
        </c:otherwise>
        </c:choose>	
	 </div>
	 
	 <div>
	 	
	 </div>  	
	</div>
 </div>    
   <jsp:include page="../common/footer.jsp" />

<script>

</script>
</body>
</html>