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
          background: #ff9d38;  
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
                <li><a href="${contextPath}/mypage/myroom"> <img src="${contextPath}/resources/images/meeting.png" width="50px" height="50px">&nbsp;&nbsp;참여 스터디 방</a></li>
                <li><a href="${contextPath}/mypage/myboard"> <img src="${contextPath}/resources/images/classroom.png" width="50px" height="50px">&nbsp;&nbsp;내가 작성한 글</a></li>
                <li><a href="${contextPath}/mypage/myreply"> <img src="${contextPath}/resources/images/answer.png" width="50px" height="50px">&nbsp;&nbsp;채택된 댓글</a></li>
                <li><a href="${contextPath}/mypage/myInfo"> <img src="${contextPath}/resources/images/personal-information.png" width="50px" height="50px">&nbsp;&nbsp;내정보</a></li>
            </ul>
     </div>
</body>
</html>