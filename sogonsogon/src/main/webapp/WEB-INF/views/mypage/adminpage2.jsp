<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>
<style>
                
      .mypageNav {
          float:left; 
          width: 15%;
          height:100%;
          color: #fff;
          background: rgba(241, 158, 48,0.7);  
          font-size: 100%;
          text-align: center;
  		  margin: 10px 0 10px 100px;
          padding:0;
      }
      
      .mypageNav>ul{
          margin:0;
          padding:50px 0;
          height:100%;
      }
      
      .mypageNav>ul li{
          list-style-type: none;
          width:100%;
          height:25%;
          font-size:20px;
          line-height: 40px;
          text-align: center;
          margin:10px 1px 10px 1px;
          padding:10px 5px 10px 5px;
      }
      
      .mypageNav>ul li a{
          text-decoration: none;
          color:white;
          font-weight:bold;
          width:100%;
          height:100%;
          display:block;
      }
      
      .mypageNav>ul li:hover{
          background-color: crimson;
      }
</style>
</head>
<body>
	<div class="mypageNav">
            <ul>
                <li><a href="${contextPath}/mypage/adminreport"> <img src="${contextPath}/resources/images/caution.jpg" width="50px" height="50px">&nbsp;&nbsp;신고 사항</a></li>
                <li><a href="${contextPath}/mypage/adminhelp"> <img src="${contextPath}/resources/images/question.png" width="50px" height="50px">&nbsp;&nbsp;고객 센터</a></li>
                <li><a href="${contextPath}/mypage/adminnotice"> <img src="${contextPath}/resources/images/noticeboard.png" width="50px" height="50px">&nbsp;&nbsp;공지 사항</a></li>
                <li><a href="${contextPath}/mypage/adminmember"> <img src="${contextPath}/resources/images/group.png" width="50px" height="50px">&nbsp;&nbsp;회원 관리</a></li>
            </ul>
     </div>
</body>
</html>