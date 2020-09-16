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
      
      .checkSpan{
    margin-bottom:15px; 
    margin-top: 5px;
    /* 비밀번호 유효성검사 */
	}
	
	#pwdCheckArea, #nickCheckArea,#phoneCheckArea{
    font-size: 12px;
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
	    <form method="POST" action="updateInfo" name="updateInfo" onsubmit="return validate();">
	   
	    <table id="myInfoTable">
	        <tr>
	            <td>아이디</td>
	            <td>${loginMember.memberId}</td>
	        </tr>
	        <tr>
	            <td>변경할 비밀번호</td>
	            <td><input type="password" id="pwd1" name="memberPwd" placeholder="비밀번호를 입력해주세요." size="25px" required></td>
	        </tr>
	        <tr>
	            <td>변경할 비밀번호 확인</td>
	            <td><input type="password" id="pwd2" placeholder="비밀번호를 입력해주세요." size="25px" required>
	            <div  class="checkSpan" > <span id="pwdCheckArea"> </span> </div></td>
	            
	     
	        </tr>
	        <tr>
	            <td>닉네임</td>
	            <td><input type="text" id="nick" name="memberNick" value="${loginMember.memberNick}" size="25px">
	            <div  class="checkSpan" > <span id="nickCheckArea"> </span> </div></td>
	            
	            </td>
	        </tr>
	        <tr>
	            <td>전화번호</td>                               
	            <td>
	                
	                <input type="number" id="phone" name="memberPhone" value="${loginMember.memberPhone}" required>
	                <div  class="checkSpan" > <span id="phoneCheckArea"> </span> </div></td>
	                
	            </td>
	        </tr>
	        <tr>
	            <td>관심분야</td> 
	            <td>
	                <input type="checkbox" name="memberInterest" id="infoTech"  value="IT" ><label for="infoTech">IT</label>
	                <input type="checkbox" name="memberInterest" id="contest"  value="공모전"><label for="contest">공모전</label>
	                <input type="checkbox" name="memberInterest" id="interview" value="면접" ><label for="interview">면접</label>
	                <input type="checkbox" name="memberInterest" id="major" value="전공"><label for="major">전공</label>
	                <input type="checkbox" name="memberInterest" id="language" value="외국어"><label for="language">외국어</label>
	                <input type="checkbox" name="memberInterest" id="etc" value="etc"><label for="etc">기타</label>
	            </td> 
	        </tr>
	    </table>
	    <div align="right">
			<button type="submit" class="btn btn-outline-primary">회원 정보 수정</button>
			<button class="btn btn-outline-primary" id="deleteInfo" onclick="location.href='${contextPath}/mypage/deleteInfo'">회원탈퇴</button>
	    </div>
	    </form>
	</div>
	</div>
	   <jsp:include page="../common/footer.jsp" />
	   
	<script>
	
    var infoCheck = { 
    		"pwd1":false,
    		"pwd2":false,
    		"nick":false,
    		"phone":false
    	};
    
	//********** 실시간 유효성 검사  ************/
	var $pwd1 = $("#pwd1");
	var $pwd2 = $("#pwd2");
	var $pwd = $("#pwd1, #pwd2");
	var $nick = $("#nick");
	var $phone = $("#phone");
	
	// 비밀번호 유효성 및 일치 검사
	$pwd.on("input", function(){
		//영어 대,소문자 + 숫자, 총 6~12글자
		var regExp = /^[A-Za-z0-9]{6,12}$/;
		// 비밀번호1 유효성 검사
		if(!regExp.test($("#pwd1").val())){ 
        	$("#pwdCheckArea").text("비밀번호 형식이 유효하지 않습니다.").css("color","red");
        	infoCheck.pwd1 = false;
        }else{
        	$("#pwdCheckArea").text("유효한 비밀번호 형식입니다.").css("color","green");
        	infoCheck.pwd1 = true;
        }
				
		// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
		if(!infoCheck.pwd1 && $pwd2.val().length > 0){
			swal("유효한 비밀번호를 작성해 주세요.");
			$pwd2.val("");
			$pwd1.focus();
		}else if(infoCheck.pwd1 && $pwd2.val().length > 0){
			if($("#pwd1").val().trim() != $("#pwd2").val().trim()){
				$("#pwdCheckArea").text("비밀번호 불일치").css("color","red");
				infoCheck.pwd2 = false;
			}else{
				$("#pwdCheckArea").text("비밀번호 일치").css("color","green");
				infoCheck.pwd2 = true;
			}
		}
	});
	
	//----------------------------------------------------------------------
	
	// 닉네임 유효성 검사
	$nick.on("input", function(){
		
		infoCheck.nick=false;
		
		var regExp =  /^[가-힣a-zA-Z\d]{2,}$/; // 한글 두 글자 이상
		console.log('되는감?');
		console.log($nick.val());
		// 유효성 검사
		if(!regExp.test($nick.val())){
			$("#nickCheckArea").text("닉네임은 2글자 이상 한글, 영문, 숫자만 사용 가능합니다.").css("color","red");
			infoCheck.nick = false;
			console.log('되는감?ㅇㅇ');
		}else{
			$("#nickCheckArea").text("사용가능한 닉네임입니다.").css("color","green");
			infoCheck.nick = true;
		}
	
	});

//----------------------------------------------------------------------

	// 연락처 유효성 검사
	$phone.on("input", function(){
		
		infoCheck.phone=false;
		
		var regExp =  /^[\d]{9,11}$/; // 11자리 이하
		
		// 유효성 검사
		if(!regExp.test($phone.val())){
			$("#phoneCheckArea").text("숫자만 입력해주세요.").css("color","red");
			infoCheck.phone = false;
		}else{
			$("#phoneCheckArea").text("사용가능한 연락처입니다.").css("color","green");
			infoCheck.phone = true;
		}
	
	});

//----------------------------------------------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	// 기존 DB관심사 불러와서 반영
	
	var memberInterest = "${loginMember.memberInterest}".split(",");

	console.log(memberInterest);
	
	$.each($("input[name='memberInterest']"), function(index, item){
		
		for(var i=0 ; i< memberInterest.length ; i++){
			if($(item).val() == memberInterest[i]){
				$(item).prop("checked",true);
				break;
			}
		}
	});
	
    $("#deleteInfo").click(function(){
    	confirm("정말 탈퇴하시겠습니까?");
		});
	</script>
</body>
</html>