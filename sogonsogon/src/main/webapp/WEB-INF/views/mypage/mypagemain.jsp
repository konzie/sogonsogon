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
      
      .tableTitle{
      	display: inline-block;
      }
      
      .tableTitle>a{
        color:black;
      	text-decoration: none;  
      }
      .tableButton{
      	display:inline-block;
      	float : right;
      	margin:10px 5px;
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
	   	
	</div>
 </div>    
   <jsp:include page="../common/footer.jsp" />

<script>

</script>
</body>
</html>