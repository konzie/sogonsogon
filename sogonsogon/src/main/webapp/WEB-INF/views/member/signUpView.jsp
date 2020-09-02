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

#idCheckArea, #pwdCheckArea{
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

#check-id{
    border-radius: 30px;
    padding: 10px 20px;
    font-size: 15px;

    background-color: darkorange;
    border: none;
    color: white;
   
    width: 100px;
    display: inline;
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
        <form>
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item itemspan" id="email" placeholder="아이디(Email)">
            </div>
            <div class="form-group spanMargin ">
                <div class="emailCheckInput">
                    <input type="text" class="form-control item" id="emailCheck" placeholder="아이디(Email) 중복확인">
                </div>
                <div > 
                     <button type="button" class="btn" id="check-id">인증요청 &nbsp;</button>
                </div>
            </div>
           
            <div  class="checkSpan" > <span id="idCheckArea"> 아이디가 일치합니다. </span> </div>

            <div class="form-group">
                <input type="password" class="form-control item itemspan" id="pwd" placeholder="비밀번호">
            </div>
            <div class="form-group spanMargin" >
                <input type="password" class="form-control item" id="pwdCheck" placeholder="비밀번호 중복확인">
            </div>
            <div  class="checkSpan" > <span id="pwdCheckArea"> 비밀번호가 일치합니다. </span> </div>

            <div class="form-group">
                <input type="text" class="form-control item itemspan" id="userName" placeholder="이름">
            </div>
            <div class="form-group"> 
                <input type="text" class="form-control item itemspan" id="userNick" placeholder="닉네임">
            </div>
            <div class="form-group">
                <input type="number" class="form-control item itemspan" id="phone-number" placeholder="연락처">
            </div>
          
            <hr>
            <div class="custom-control custom-checkbox">
                <div> <h5>연령</h5> </div>

                <div class="form-radio-inline">
                    <input type="radio" name="age" value="10" id="age10">
                    <label for="10"> 10대 </label> &nbsp;
                    <input type="radio" name="age" value="20" id="age20">
                    <label for="20"> 20대 </label> &nbsp;                   
                    <input type="radio" name="age" value="30" id="age30">
                    <label for="30"> 30대 </label> &nbsp;                   
                    <input type="radio" name="age" value="40" id="age40">
                    <label for="40"> 40대 </label> &nbsp;                   
                    <input type="radio" name="age" value="50" id="age50">
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
                <button type="button" class="btn btn-block create-account">회원가입</button>
            </div>
        </form>
        
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>
