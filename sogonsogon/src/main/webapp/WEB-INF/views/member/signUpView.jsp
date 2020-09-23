<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

	<style>
	body{
    background-color: wheat;
}

.registration-form{
	padding: 50px 0;
}

.registration-form form{
    background-color: #fff;
    max-width: 600px;
    margin: auto;
    padding: 50px 70px;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
    box-shadow: 0px 2px 10px rgba(37, 37, 37, 0.075);
}


.registration-form .form-icon{
	text-align: center;
    background-color: #383838;
    border-radius: 50%;
    font-size: 40px;
    color: white;
    width: 100px;
    height: 100px;
    margin: auto;
    margin-bottom: 50px;
    line-height: 100px;
}

.registration-form .item {
	border-radius: 20px;
    padding: 10px 20px;
}

.itemspan{
    margin-bottom: 25px;

}
.checkSpan{
    margin-bottom:15px; 
    margin-top: 5px;
    /* 비밀번호 유효성검사 */
}

#idCheckArea1,#idCheckArea2, #pwdCheckArea, #nameCheckArea, #nickCheckArea,#phoneCheckArea{
    font-size: 14px;
}

.spanMargin{
    margin:0;
    /* 유효성검사 필요한 input태그 밑 마진 제거 */
}

.emailCheckInput{
    width: 360px;
    margin-right: 0px;
    display: inline;
    float: left;
    /* 이메일 인증번호 버튼 위해서 크기 줄이기 */
}


.registration-form .create-account{
    border-radius: 30px;
    padding: 10px 20px;
    font-size: 18px;
    font-weight: bold;
    background-color: darkorange;
    border: none;
    color: white;
    margin-top: 20px;
}


.registration-form .social-icons{
    margin-top: 30px;
    margin-bottom: 16px;
}

.registration-form .social-icons a{
    font-size: 23px;
    margin: 0 3px;
    color: #5691ff;
    border: 1px solid;
    border-radius: 50%;
    width: 45px;
    display: inline-block;
    height: 45px;
    text-align: center;
    background-color: #fff;
    line-height: 45px;
}

.registration-form .social-icons a:hover{
    text-decoration: none;
    opacity: 0.6;
}

@media (max-width: 576px) {
    .registration-form form{
        padding: 50px 20px;
    }

    .registration-form .form-icon{
        width: 70px;
        height: 70px;
        font-size: 30px;
        line-height: 70px;
    }
}


.custom-control {
    padding: 10px 20px;
    margin: 0px;
    text-align: center;
}

.custom-checkbox{
    margin:0px;
}


	
	</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="registration-form">
    
         <form method="POST" action="signUpAction" name="signUpForm" onsubmit="return validate();">
       <!--  <form method="POST" action="signUpAction" name="signUpForm" onclick="validate();">--> 
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item itemspan" id="id1" name="memberId" placeholder="아이디(Email)" required>
            </div>
            <div  class="checkSpan" > <span id="idCheckArea1">  </span> </div>
            <div class="form-group spanMargin ">
                    <input type="text" class="form-control item" id="id2"  placeholder="아이디(Email) 중복확인" required >
            </div>
           
            <div  class="checkSpan" > <span id="idCheckArea2">  </span> </div>

            <div class="form-group">
                <input type="password" class="form-control item itemspan" id="pwd1" name="memberPwd" placeholder="비밀번호" required >
            </div>
            <div class="form-group spanMargin" >
                <input type="password" class="form-control item" id="pwd2"  placeholder="비밀번호 중복확인" required >
            </div>
            <div  class="checkSpan" > <span id="pwdCheckArea">  </span> </div>

            <div class="form-group">
                <input type="text" class="form-control item itemspan" id="name" name="memberName" placeholder="이름" required >
                <div  class="checkSpan" > <span id="nameCheckArea">  </span> </div>
                
            </div>
            <div class="form-group"> 
                <input type="text" class="form-control item itemspan" id="nick" name="memberNick" placeholder="닉네임" required>
            </div>
            <div  class="checkSpan" > <span id="nickCheckArea">  </span> </div>
            
            <div class="form-group">
                <input type="number" class="form-control item itemspan" id="phone" name="memberPhone" placeholder="연락처" required>
            </div>
            <div  class="checkSpan" > <span id="phoneCheckArea">  </span> </div>
          
            <hr>
            <div class="custom-control custom-checkbox">
                <div> <h5>연령</h5> </div>

                <div class="form-radio-inline">
                    <input type="radio" name="memberAge" value="10" id="age10">
                    <label for="10"> 10대 </label> &nbsp;
                    <input type="radio" name="memberAge" value="20" id="age20">
                    <label for="20"> 20대 </label> &nbsp;                   
                    <input type="radio" name="memberAge" value="30" id="age30">
                    <label for="30"> 30대 </label> &nbsp;                   
                    <input type="radio" name="memberAge" value="40" id="age40">
                    <label for="40"> 40대 </label> &nbsp;                   
                    <input type="radio" name="memberAge" value="50" id="age50">
                    <label for="50"> 50대 </label>                  
                </div>
                
            <hr>
            </div>
            <div class="custom-control custom-checkbox">
                <div> <h5>관심분야</h5> </div>

                <div class="form-check form-check-inline">
                    <input type="checkbox" name="memberInterest" id="infoTech" value="IT"
                    class="form-check-input custom-control-input">
                    <label class="form-check-label custom-control-label" for="infoTech">&nbsp; IT &nbsp; </label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" name="memberInterest" id="contest" value="공모전"
                    class="form-check-input custom-control-input">
                    <label class="form-check-label custom-control-label" for="contest"> 공모전 </label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" name="memberInterest" id="interview" value="면접"
                    class="form-check-input custom-control-input">
                    <label class="form-check-label custom-control-label" for="interview">면접</label>
                </div>
                <br>
                <div class="form-check form-check-inline">
                    <input type="checkbox" name="memberInterest" id="major" value="전공"
                    class="form-check-input custom-control-input">
                    <label class="form-check-label custom-control-label" for="major"> 전공</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" name="memberInterest" id="language" value="외국어"
                    class="form-check-input custom-control-input">
                    <label class="form-check-label custom-control-label" for="language"> 외국어</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" name="memberInterest" id="etc" value="기타"
                    class="form-check-input custom-control-input">
                    <label class="form-check-label custom-control-label" for="etc"> 기타</label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-block create-account" id="signUpBtn">회원가입</button> 
               <!--  <input type="submit" class="btn btn-block create-account" id="signUpBtn">회원가입</button> -->
            </div>
        </form>
        
        
    <script>
    // 각 유효성 검사 결과를 저장할 객체
    var signUpCheck = { 
   		"id1":false,
   		"id2":false,
		"pwd1":false,
		"pwd2":false,
		"name":false,
		"nick":false,
		"phone":false,
		"age":false
	};
    
	//********** 실시간 유효성 검사  ************/
	var $id1 = $("#id1");
	var $id2 = $("#id2");
	var $id = $("#id1, #id2");

	var $pwd1 = $("#pwd1");
	var $pwd2 = $("#pwd2");
	var $pwd = $("#pwd1, #pwd2");
	
	var $name = $("#name");
	var $nick = $("#nick");
	var $phone = $("#phone");
	
	
	// 아이디 유효성 검사
	$id.on("input", function(){
		signUpCheck.id1 = false;

		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// 아이디1 유효성 검사
		if(!regExp.test($("#id1").val())){
			$("#idCheckArea1").text("아이디(email) 형식이 유효하지 않습니다.").css("color", "red");
			signUpCheck.id1 = false;
		} else{
			// ajax 이용해 비동기로 아이디 중복검사
			signUpCheck.id1 = true;

				$.ajax({
					url : "idDupCheck",
					data : {"memberId" : $id1.val()},
					type : "post",
					success : function(result){
						if(result== 0){
							// 중복되는 아이디가 없을 경우 
							$("#idCheckArea1").text("사용 가능한 아이디 입니다.").css("color","green");
							signUpCheck.id1 = true;
						}else{
							$("#idCheckArea1").text("이미 사용중인 아이디 입니다.").css("color","red");
							signUpCheck.id1 = false;
							$id2.val("");
						}
					},
					error : function(){
						console.log("아이디 중복 검사 실패");
					}
				})

		}
		
		// 아이디1이 유효하지 x 상태로 아이디2 작성할 때
		if(!signUpCheck.id1 && $id2.val().length > 0){
			swal("유효한 아이디(email)를 작성해주세요.");
			$id2.val("");
			$id1.focus();
			
		} else if(signUpCheck.id1 && $id2.val().length>0){
			
			if($("#id1").val().trim() != $("#id2").val().trim()){
				$("#idCheckArea2").text("아이디(email) 불일치").css("color","red");
				signUpCheck.id2=false;
				
			} else {
				$("#idCheckArea2").text("아이디(email) 일치").css("color","green");
				signUpCheck.id2=true;
			}
		}
	});
	
	//----------------------------------------------------------------------
	
	
	// 비밀번호 유효성 및 일치 검사
		$pwd.on("input", function(){
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			
			// 비밀번호1 유효성 검사
			if(!regExp.test($("#pwd1").val())){ 
	        	$("#pwdCheckArea").text("비밀번호 형식이 유효하지 않습니다.").css("color","red");
	        	signUpCheck.pwd1 = false;
	        }else{
	        	$("#pwdCheckArea").text("유효한 비밀번호 형식입니다.").css("color","green");
	        	signUpCheck.pwd1 = true;
	        }
					
			// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
			if(!signUpCheck.pwd1 && $pwd2.val().length > 0){
				swal("유효한 비밀번호를 작성해 주세요.");
				$pwd2.val("");
				$pwd1.focus();
			}else if(signUpCheck.pwd1 && $pwd2.val().length > 0){
				if($("#pwd1").val().trim() != $("#pwd2").val().trim()){
					$("#pwdCheckArea").text("비밀번호 불일치").css("color","red");
					signUpCheck.pwd2 = false;
				}else{
					$("#pwdCheckArea").text("비밀번호 일치").css("color","green");
					signUpCheck.pwd2 = true;
				}
			}
		});
		
	
	//----------------------------------------------------------------------
	
		
		// 이름 유효성 검사
		$name.on("input", function(){
			
			signUpCheck.name=false;
			
			var regExp =  /^[가-힣]{2,}$/; // 한글 두 글자 이상
			
			// 유효성 검사
			if(!regExp.test($name.val())){
				$("#nameCheckArea").text("이름 형식이 유효하지 않습니다.").css("color","red");
				signUpCheck.name = false;
			}else{
				$("#nameCheckArea").text("유효한 이름 형식입니다.").css("color","green");
				signUpCheck.name = true;
			}
		
		});
	
	//----------------------------------------------------------------------
	
		// 닉네임 유효성 검사
		$nick.on("input", function(){
			
			signUpCheck.nick=false;
			
			var regExp =  /^[가-힣a-zA-Z\d]{2,}$/; // 한글 두 글자 이상
			
			// 유효성 검사
			if(!regExp.test($nick.val())){
				$("#nickCheckArea").text("닉네임은 2글자 이상 한글, 영문, 숫자만 사용 가능합니다.").css("color","red");
				signUpCheck.nick = false;
			}else{
				$("#nickCheckArea").text("사용가능한 닉네임입니다.").css("color","green");
				signUpCheck.nick = true;
			}
		
		});
	
	//----------------------------------------------------------------------
	
		// 연락처 유효성 검사
		$phone.on("input", function(){
			
			signUpCheck.phone=false;
			
			var regExp =  /^[\d]{9,11}$/; // 11자리 이하
			
			// 유효성 검사
			if(!regExp.test($phone.val())){
				$("#phoneCheckArea").text("숫자만 입력해주세요.").css("color","red");
				signUpCheck.phone = false;
			}else{
				$("#phoneCheckArea").text("사용가능한 연락처입니다.").css("color","green");
				signUpCheck.phone = true;
			}
		
		});
	
	//----------------------------------------------------------------------

	$("#signUpBtn").on("click", function(){
		// 라디오 버튼
		if(!$(':input:radio[name=memberAge]:checked').val()) {   
			signUpCheck.age = false;   
		}  else {
			signUpCheck.age = true;   
		}

	}) ;
	
	
	//submit 동작
	
	function validate(){
		
			for(var key in signUpCheck){
				
				
				if(!signUpCheck[key]){
					var msg;
					switch(key){
					case "id1" : case "id2" : msg="아이디가  유효하지 않습니다."; break;
					case "pwd1" : case "pwd2" : msg="비밀번호가  유효하지 않습니다."; break;
					case "name" : msg="이름이  유효하지 않습니다."; break;
					case "phone" : msg="전화번호가  유효하지 않습니다."; break;
					case "nick" : msg="닉네임이 유효하지 않습니다."; break;
					case "age" : msg="연령을 선택해주세요."; break;
					
					}
					
					alert(msg) ;
					var el = "#"+key;
					$(el).focus();
					return false;
					
				}
				
		

			}
			
		
			
	};
	
	
	

    
    
    </script>
        
        
        
        
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    
    
    
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>
