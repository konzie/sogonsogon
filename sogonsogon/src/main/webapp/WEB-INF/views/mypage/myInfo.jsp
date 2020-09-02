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
      width:100%;
      height:15%;
    }
      .content{
          width: 90%;
          height: 80%;
          margin-top:10px;
          position:relative;
      }
                
      .mypageNav {
          float:left; 
          width: 25%;
          height:80%;
          color: #fff;
          background: #ff9d38;  
    	  font-size: 100%;
          padding:0;
          margin:0;
      }
      
      .content2{
      	width:75%;
        height:80%;
        float:left; 
        padding:3%;
      }
      
      .mypageNav>ul{
          margin:0;
          padding:0;
          height:100%;
      }
      
      .mypageNav>ul li{
          list-style-type: none;
          width:100%;
          height:25%;
          font-size:20px;
          line-height: 40px;
          text-align: center;
          margin:0%;
          padding:0;
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
      
      #myInfoTable{
      	border-spacing: 5px 10px;
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
            <ul>
                <li><a href="${contextPath}/mypage/myroom"> <img src="${contextPath}/resources/images/meeting.png" width="50px" height="50px">참여 스터디 방</a></li>
                <li><a href="${contextPath}/mypage/myboard"> <img src="${contextPath}/resources/images/classroom.png" width="50px" height="50px">내가 작성한 글</a></li>
                <li><a href="${contextPath}/mypage/myreply"> <img src="${contextPath}/resources/images/answer.png" width="50px" height="50px">채택된 댓글</a></li>
                <li><a href="${contextPath}/mypage/myInfo"> <img src="${contextPath}/resources/images/personal-information.png" width="50px" height="50px">내정보</a></li>
            </ul>
       </div>
       <div class="content2">       
	   <h4 class="mb-5">회원정보 수정</h4>
		<form method="POST" action="updateInfo" onsubmit="return validate();" class="form-horizontal" role="form">
	    <table id="myInfoTable">
	        <tr>
	            <td>아이디</td>
	            <td>${loginMember.memberId}</td>
	        </tr>
	        <tr>
	            <td>비밀번호</td>
	            <td><input type="password" name="checkPwd" placeholder="비밀번호를 입력해주세요." size="25px"></td>
	        </tr>
	    </table>
	    <div align="right">
	    	<button type="submit">회원 정보 수정</button>
	    	</div>
	    	</form>
	   </div>
	</section>
	   <jsp:include page="../common/footer.jsp" />
	   
<script>

		function validate() {
			// 비밀번호  유효성 검사
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			if(!regExp.test($("#checkPwd").val())){ 
				alert("유효하지 않은 비밀번호 입니다.");
				$("#checkPwd").focus();
				
				return false;
            }
</script>
	
</body>
</html>