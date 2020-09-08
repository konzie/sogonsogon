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
	            <td>user01@naver.com</td>
	        </tr>
	        <tr>
	            <td>변경할 비밀번호</td>
	            <td><input type="text" name="pwd1" placeholder="비밀번호를 입력해주세요." size="25px"></td>
	        </tr>
	        <tr>
	            <td>변경할 비밀번호 확인</td>
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
	                    <option>010</option>
	                    <option>011</option>
	                    <option>017</option>
	                    <option>019</option>
	                </select>
	                -
	                <input type="tel" name="tel2" placeholder="1234">
	                -
	                <input type="tel" name="tel3" placeholder="5678">
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
	        <a href="<%=request.getContextPath()%>/mypage/deleteInfo" id="deleteInfo">회원 탈퇴</a>
	    </div>
	</div>
	</div>
	   <jsp:include page="../common/footer.jsp" />
	   
	<script>
    $("#deleteInfo").click(function(){
    	confirm("정말 탈퇴하시겠습니까?");
		});
	</script>
</body>
</html>