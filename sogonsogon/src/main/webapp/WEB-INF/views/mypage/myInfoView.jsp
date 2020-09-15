<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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
      
      #deleteInfo{
      text-decoration: none;
      }
      
      #id{
      style:none;
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
	   <h4 class="mb-5">회원정보 수정</h4>
	    <table id="myInfoTable">
	        <tr>
	            <td>아이디</td>
	            <td>${loginMember.memberId}</td>
	        </tr>
	        <tr>
	            <td>변경할 비밀번호</td>
	            <td><input type="password" name="pwd1" placeholder="비밀번호를 입력해주세요." size="25px"></td>
	        </tr>
	        <tr>
	            <td>변경할 비밀번호 확인</td>
	            <td><input type="password" name="pwd2" placeholder="비밀번호를 입력해주세요." size="25px"></td>
	        </tr>
	        <tr>
	            <td>닉네임</td>
	            <td><input type="text" name="nick" placeholder="${loginMember.memberNick}" size="25px"></td>
	        </tr>
	        <tr>
	            <td>전화번호</td>                               
	            <td>
	                <select name="tel1" id="tel1">
	                    <option value="010">010</option>
	                    <option value="011">011</option>
	                    <option value="017">017</option>
	                    <option value="019">019</option>
	                </select>
	                -
	                <input type="tel" name="tel2" placeholder="${tel2}">
	                -
	                <input type="tel" name="tel3" placeholder="${tel3}">
	            </td>
	        </tr>
	        <tr>
	            <td>관심분야</td> 
	            <td>
	                <input type="checkbox" name="interest" id="IT"><label for="IT">IT</label>
	                <input type="checkbox" name="interest" id="cook"><label for="cook">요리</label>
	                <input type="checkbox" name="interest" id="book"><label for="book">독서</label>
	                <input type="checkbox" name="interest" id="eng"><label for="eng">외국어</label>
	                <input type="checkbox" name="interest" id="music"><label for="music">음악</label>
	                <input type="checkbox" name="interest" id="movie"><label for="monvie">영화</label>
	                <input type="checkbox" name="interest" id="game"><label for="game">게임</label>
	            </td> 
	        </tr>
	    </table>
	    <div align="right">
			<button type="button" class="btn btn-outline-primary" id="updateInfo" onclick="location.href='${contextPath}/mypage/updateInfo'">회원 정보 수정</button>
			<button type="button" class="btn btn-outline-primary" id="deleteInfo" onclick="location.href='${contextPath}/mypage/deleteInfo'">회원탈퇴</button>
	    </div>
	</div>
	</div>
	   <jsp:include page="../common/footer.jsp" />
	   
	<script>
	
	var interest = "${loginMember.memberInterest}";
	consol.log(interest);
	
	var memberInterest = interest.split(",");
	consol.log(memberInterest);
	
	$.each($("input[name='interest']"), function(index, item){
		for(var i=0 ; i<memberInterest.length; i++){
			if($(item).val() == memberInterest[i]){
				console.log($(item).val());
				$(item).prop("checked",true);
			}
		}
	});
	
    $("#deleteInfo").click(function(){
    	confirm("정말 탈퇴하시겠습니까?");
		});
	</script>
</body>
</html>