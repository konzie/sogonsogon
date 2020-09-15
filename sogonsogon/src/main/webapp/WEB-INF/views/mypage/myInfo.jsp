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
      height:430px;
      padding:20px 0px 0px 30px;
      }
      #myInfoTable{
      	border-spacing: 5px 10px;
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
		<form action="myInfoView" onsubmit="return checkPwd();" class="form-horizontal" role="form">
    
		<div class="row mb-3 form-row">
			<div class="col-md-3">
				<h6>아이디</h6>
			</div>
			<div class="col-md-6">
				<h5 id="id">${loginMember.memberId}</h5>
			</div>
		</div>

		<hr>
		
		<div class="row mb-3 form-row">
			<div class="col-md-3">
				<h6>비밀번호</h6>
			</div>
			<div class="col-md-6">
				<input type="password" class="form-control" id="memberPass" name="memberPass">
			</div>
			 <div class="col-md-6 offset-md-3">
                 <span id="checkPass">&nbsp;</span>
             </div>
			<hr>
	    	<div align="right">
	    	<button type="submit">확인</button>
	    	</div>
	    </div>
	   </form>
	   </div>
	</div>
	   <jsp:include page="../common/footer.jsp" />
	   
	 <script>		
	 
	 	console.log($("#memberPass").val());
		$("#memberPass").on("input",function(){
			
			var checkPwd;
			
			$.ajax({
				url : "${contextPath}/mypage/checkPwd",
				data : {"memberPass" : $("#memberPass").val()},
				type : "POST",
				success : function(result){
					if(result==0){
						$("#checkPass").text("비밀번호가 일치합니다.").css("color","green");
						checkPwd = true;
					}else{
						$("#checkPass").text("비밀번호가 일치하지 않습니다.").css("color","red");
						checkPwd = false;
					}
				},
				error : function(){
					console.log("비밀번호 확인 실패");
				}
			})
		});
		

		function checkPwd(){
				if($("#memberPass").val() == ""){
					alert("비밀번호를 입력해주세요");
					$("#memberPass").focus();
		
					return false;
				}else{
					return checkPwd;
				}
		};
	</script>
</body>
</html>