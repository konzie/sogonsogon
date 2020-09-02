<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style>
   
        .table-title {
            color: #fff;
            background: #ff9d38;      
            border-radius: 3px 3px 0 0;
            height:10%;
            width:100%;
            }
            
        .mypageNav {
            width: 20%;
            color: #fff;
            background: #ff9d38;  
            float:left; 
        }
        
        .content{
            width: 100%;
            height: 100%;
            padding : 10 10 10 10 ;
        }
        .mypageNav>ul{
            margin:0;
            padding:0;
            height:100%;
        }
        
        .mypageNav>ul li{
            list-style-type: none;
            width:100%;
            height:20%;
            font-size:18px;
            line-height: 40px;
            text-align: center;
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
  <jsp:include page="../common/header.jsp" />
   
   <div class="empty"></div>
   
   <div class="table-title">
      <div class="row">
         <div class="col-sm-4">
            <h2><b>My Page</b></h2>
         </div>
      </div>
   </div>
   
      <section class="content">
      	<div class="mypageNav">
            <ul class="navbar-nav">
                <li><a href="${contextPath}/mypage/myroom"> <img src="${contextPath}/resources/images/meeting.png" width="50px" height="50px">참여 스터디 방</a></li>
                <li><a href="${contextPath}/mypage/myboard"> <img src="${contextPath}/resources/images/classroom.png" width="50px" height="50px">내가 작성한 글</a></li>
                <li><a href="${contextPath}/mypage/myreply"> <img src="${contextPath}/resources/images/answer.png" width="50px" height="50px">채택된 댓글</a></li>
                <li><a href="${contextPath}/mypage/myInfo"> <img src="${contextPath}/resources/images/personal-information.png" width="50px" height="50px">내정보</a></li>
            </ul>
       </div>
       
	<div class="resume-section-content">
	    <h4 class="mb-5">회원정보 수정</h4>
	    <table>
	        <tr>
	            <td>아이디</td>
	            <td>user01@naver.com</td>
	        </tr>
	        <tr>
	            <td>비밀번호</td>
	            <td><input type="text" name="pwd1" placeholder="비밀번호를 입력해주세요." size="25px"></td>
	        </tr>
	        <tr>
	            <td>비밀번호 확인</td>
	            <td><input type="text" name="pwd2" placeholder="비밀번호를 입력해주세요." size="25px"></td>
	        </tr>
	        <tr>
	            <td>닉네임</td>
	            <td><input type="text" name="nick" placeholder="유저이" size="25px"></td>
	        </tr>
	        <tr>
	            <td>전화번호</td>                               
	            <td>
	                <select name="tel1">
	                    <option selected>010</option>
	                    <option>011</option>
	                    <option>017</option>
	                    <option>019</option>
	                </select>
	                -
	                <input type="tel" name="tel2" value="1234">
	                -
	                <input type="tel" name="tel3" value="5678">
	            </td>
	        </tr>
	        <tr>
	            <td>관심분야</td> 
	            <td>
	                <input type="radio" name="interest" id="IT"><label for="IT">IT</label>
	                <input type="radio" name="interest" id="cook"><label for="cook">요리</label>
	                <input type="radio" name="interest" id="book"><label for="book">독서</label>
	                <input type="radio" name="interest" id="eng"><label for="eng">외국어</label>
	                <input type="radio" name="interest" id="music"><label for="music">음악</label>
	                <input type="radio" name="interest" id="movie"><label for="monvie">영화</label>
	                <input type="radio" name="interest" id="game"><label for="game">게임</label>
	            </td> 
	        </tr>
	    </table>
	    <div align="right">
	        <input type="button" value="회원 정보 수정" id="updateInfo">
	        <input type="button" value="회원 탈퇴" id="deleteInfo">
	    </div>
	</div>
	</section>
	   <jsp:include page="../common/footer.jsp" />
</body>
</html>