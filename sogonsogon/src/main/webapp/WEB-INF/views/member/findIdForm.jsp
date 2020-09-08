<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>아이디찾기</title>
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
		
		
		#nameCheckArea, #phoneCheckArea{
	   	 font-size: 14px;
		}
		
		.checkSpan{
		    margin-bottom:15px; 
		    margin-top: 5px;
		    /* 비밀번호 유효성검사 */
		}
		
	</style>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
    <div class="registration-form">
         <form method="POST" action="findIdAction" onclick="validate();">
         
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item itemspan" id="name" name="memberName" placeholder="이름">
                <div  class="checkSpan" > <span id="nameCheckArea">  </span> </div>
                
                <input type="number" class="form-control item itemspan" id="phone" name="memberPhone" placeholder="휴대폰번호">
                <div  class="checkSpan" > <span id="phoneCheckArea">  </span> </div>

            </div>
            
           
            <div class="form-group">
				<input type="submit" class="btn btn-block create-account" value="아이디찾기" id="findIdBtn">
			</div>        
        </form>
        
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <jsp:include page="../common/footer.jsp"/>

	<script>
    // 각 유효성 검사 결과를 저장할 객체

	 var findIdCheck = { 
				"name":false,
				"phone":false
			};
	
	 //********** 실시간 유효성 검사  ************/

	var $name = $("#name");
	var $phone = $("#phone");

	// 이름 유효성 검사
	$name.on("input", function(){
		
		
		var regExp =  /^[가-힣]{2,}$/; // 한글 두 글자 이상
		
		// 유효성 검사
		if(!regExp.test($name.val())){
			$("#nameCheckArea").text("이름 형식이 유효하지 않습니다.").css("color","red");
			findIdCheck.name = false;
		}else{
			$("#nameCheckArea").text("유효한 이름 형식입니다.").css("color","green");
			findIdCheck.name = true;
		}
	
	});
	
	// 연락처 유효성 검사
	$phone.on("input", function(){
		
		
		var regExp =  /^[\d]{9,11}$/; // 11자리 이하
		
		// 유효성 검사
		if(!regExp.test($phone.val())){
			$("#phoneCheckArea").text("숫자만 입력해주세요.").css("color","red");
			findIdCheck.phone = false;
		}else{
			$("#phoneCheckArea").text("올바른 연락처 형식입니다.").css("color","green");
			findIdCheck.phone = true;
		}
	
	});
	
	function validate(){
		
		
		$("#findIdBtn").on("click", function(){
			
			for(var key in findIdCheck){
				
				if(!findIdCheck[key]){
					var msg;
					switch(key){
					case "name" : msg="이름이"; break;
					case "phone" : msg="전화번호가"; break;
					
					}
					
					alert(msg + " 유효하지 않습니다.");
					var el = "#"+key;
					$(el).focus();
					return false;
				}
			}
			
			return true;
			
		});
			
			
	};
	
	</script>



</body>
</html>
