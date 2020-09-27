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
      	width:100%;
      	align-content: center;
      }
      
      #reportNotice{
      	padding: 10px;
      	height:100px;
      	width:100%;
      	font-size: 15px;
      }
      
      #writer{
      	float:right;
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
      
      h4, h5{
      	clear: both;
      	color:black;
      	margin : 5px 5px;
      }
      
      #roomBoardNo{
      	float:left;
      	width:11%;
      }
      
      #roomNo{
      	float:left;
      }
      
      .mypageList{
      	margin : 20px 20px;
      }
      
      .brown{
      	width:100%;
      	height:5px;
      	background-color: #F29661;
      	padding:0;
      	margin:0px 0px 3px 0px;
      }
      
.text-wait {
    color: #ff5b5b;
}

.text-success{
    color: green;
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
	<div style="border: 5px solid #FAE0D4; clear:both; margin:10px 0; padding:0px;" class="mypageList">
		<c:choose>
          	<c:when test="${empty report||report.reportStatus=='N'}">
          		<div class="brown"></div><h5 style="padding: 5px;"> ! 신고된 사항이 없습니다.</h5>
          	</c:when>
        <c:otherwise>
        <div class="brown"></div><h5>! 새로 신고된 게시글이 있습니다.</h5> 
        <c:choose>
        <c:when test="${report.roomNo>0}"> 
		<div id="reportContent">
         	<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
  			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
   			<fmt:formatDate var="createDate" value="${board.roomBoardCreateDate}" pattern="yyyy-MM-dd"/>
        	&nbsp;&nbsp;<div id="roomBoardNo">게시글 번호 : ${board.roomBoardNo}</div><div id="roomNo">(방 번호 : ${board.roomNo})</div>
        	<div id="writeday">작성일 : ${createDate}</div><br><div id="writer">작성자 : ${board.roomBoardWriter}</div>
        	<br><hr><h4>제목 | ${board.roomBoardTitle}</h4><hr>
			<div id="board-content">${board.roomBoardContent}</div>
		</div>
		</c:when>
		<c:otherwise>
		<div id="reportContent">
        	<div id="roomBoardNo">게시글 번호 : ${reportView.qnaNo}</div>
        	<div id="writeday">작성일 : ${reportView.qnaCreateDate}</div><br><div id="writer">작성자 : ${reportView.writerNick}</div>
        	<br><hr><h4>제목 | ${reportView.qnaTitle}</h4><hr>
			<div id="board-content">${reportView.qnaContent}</div>
		</div>
		</c:otherwise>
		</c:choose>
			<div id="reportNotice">
					위 게시글이 신고되었습니다. 
					<br>현재 신고된 수는 <span style="color:crimson">${report.reportCount}번</span> 입니다. 
					앞으로 ${3-report.reportCount}번 더 신고 받으면 사이트 이용이 불가합니다.
			</div>
        </c:otherwise>
        </c:choose>	
	 </div>
 
		<table class="table table-striped table-hover" id="psTable">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>				
                        <th>작성일</th>						
                        <th>답변여부</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty helpList}">
		         		<tr>		
		         			<td colspan="5" align="center"><div class="brown"></div>내가 보낸 문의사항이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          			        <div class="brown"></div><h5>? 내가 보낸 문의사항입니다. </h5> 
          				<c:forEach var="board" items="${helpList}">
	              		<tr>
	              		<td style="display:none;">${board.helpContent}</td>		
	              			<jsp:useBean id="now1" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today1" value="${now1}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate1" value="${board.helpCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime1" value="${board.helpCreateDate}" pattern="hh:mm:ss"/>
	              			<td>${board.helpNo}</td>
		              		<td>${board.helpCategory}</td>
		              		<td>${board.helpTitle}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today1 == createDate1 }">${createTime1}</c:when>
		              				<c:otherwise>${createDate1}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>
		              		<c:choose>
		              		<c:when test="${board.helpStatus == 'R'}">     
	                           		<button class="btn btn-secondary btn-sm" onclick="location.href ='${contextPath}/help/no='+${board.helpNo}+'/delete'">삭제</button>   	
	                        </c:when>
	                        <c:otherwise>
                           		<c:if test="${board.answerChk == 'Y'}">
                           			<span class="status text-success" style="margin: -8px 2px 0 0;">&bull;</span> 답변   	
		                  		</c:if>
		                  		<c:if test="${board.answerChk == 'N'}">
		                  			<span class="status text-wait" style="margin: -8px 2px 0 0;">&bull;</span> 미답변  
		                  		</c:if> 
		                  	</c:otherwise>
		                  	</c:choose>
		              		</td>
	              		</tr>	
		              	<tr>
		              		<td></td><td>본문</td><td colspan="3" id="extra"><span>${board.helpContent}</span>
		              		<c:if test="${board.helpStatus == 'R'}">
		              			<span class="test"> <br>--- 관리자에 의해 조치된 게시글입니다. --- </span>
		              		</c:if>    
		              		</td>
		              	</tr>
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
			<p align="right" style="font-size: 13px; color:gray;">▶ 관리자에 의해 조치된 문의글을 마이페이지에서 보지 않으려면 '삭제' 버튼을 누르시오</p>
	 </div>
	 	 
	 <div>
	 	
	 </div>  	
	</div> 
	
   <jsp:include page="../common/footer.jsp" />
</body>
</html>