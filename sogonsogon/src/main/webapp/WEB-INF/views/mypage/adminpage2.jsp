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
          padding:10px 0px 10px 0px;
      }
      
      .mypageNav>ul li a{
          text-decoration: none;
          color:white;
          font-weight:bold;
          text-align: center;
          margin:0 0 0 0;
          padding:0;
      }
      
      #reportNav{
          display:inline-block;
          width:100%;
          height:50%;
          background-color:rgba(241, 158, 48,0.7);
          margin:0;
      }
      
      .mypageNav li:not(#firstNav):hover, #reportBoardNav:hover, #reportRoomNav:hover{
          background-color: crimson;
      }
      
      #reportBoardNav, #reportRoomNav, #split{
      	display: inline-block;
      	padding:5px;
      }
     
</style>
</head>
<body>
	<div class="mypageNav">
            <ul>
                <li style="padding:0" id="firstNav">
                	<div id="reportNav"><img src="${contextPath}/resources/images/caution.jpg" width="30px" height="30px">신고 목록</div>
               		<div id="reportBoardNav"><a href="${contextPath}/mypage/reportBoard"> &nbsp;&nbsp;자유질문방</a></div>
               		<div id="split">/</div>
               		<div id="reportRoomNav"><a href="${contextPath}/mypage/reportRoom"> &nbsp;&nbsp;스터디방</a></div>
                </li>
                              

                <li><a href="${contextPath}/mypage/adminhelp"> <img src="${contextPath}/resources/images/question.png" width="35px" height="35px">&nbsp;&nbsp;고객 센터</a></li>
                <li><a href="${contextPath}/mypage/adminnotice"> <img src="${contextPath}/resources/images/noticeboard.png" width="35px" height="35px">&nbsp;&nbsp;공지 사항</a></li>
                <li><a href="${contextPath}/mypage/adminmember"> <img src="${contextPath}/resources/images/group.png" width="35px" height="35px">&nbsp;&nbsp;회원 관리</a></li>
            </ul>
     </div>
</body>
</html>