<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>아이디찾기 화면</title>
   <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

	<style>
	body{
		    background-color: wheat;
			}
		
		.registration-form{
			padding: 50px 0;
		}
		
		.registration-form .wrapper{
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
		
        .form-group{
            text-align: center;
        }

	</style>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
    <div class="registration-form">
         <div class="wrapper">
         
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                	<b>${memberName}</b>님의 Id(E-mail)는 <br>
                <b>${findEmail}</b>입니다.
                <br> <br>
                <a href="/sogon">
                   <button class="btn btn-block create-account" >메인으로</button>
                </a>
            </div>
       </div>
        
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <jsp:include page="../common/footer.jsp"/>

	


</body>
</html>
