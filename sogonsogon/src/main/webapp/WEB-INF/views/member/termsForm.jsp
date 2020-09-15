<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입 약관</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">


    <style>
        b{
            font-size:20px;
            font-family: 돋음;
            font-weight:bolder;
            color: darkorange;
            
            }
        hr{
            border-color: darkorange;
            border-width: 4px;
            padding-left: 160px;
            width:900px;
            text-align: center;
            }



			 #termsform{
			    background-color: #fff;
			    max-width: 1200px;
			    margin-top: 100px;
			    padding: 50px 70px;
			    border-top-left-radius: 30px;
			    border-top-right-radius: 30px;
			    border-bottom-left-radius: 30px;
			    border-bottom-right-radius: 30px;
			    box-shadow: 0px 2px 10px rgba(37, 37, 37, 0.075);
			    margin:auto;
			}

		
		.registration-form .form-icon{
			text-align: center;
		    background-color: #383838;
		    border-radius: 50%;
		    font-size: 40px;
		    color: white;
		    width: 100px;
		    height: 100px;
		    margin-top: 50px;
		    margin-bottom: 50px;
		    line-height: 100px;
		    padding: 50px ;
	
		    
		}
		
		
		
		#agreeBtn, #disagreeBtn{
		    border-radius: 30px;
		    padding: 10px 20px;
		    font-size: 18px;
		    font-weight: bold;
		    background-color: #ff8c00;
		    border: none;
		    color: white;
		    margin-top: 20px;
		}

		    textarea{
		        resize: none;
		    }


    </style>

</head>


<body>
 <jsp:include page="../common/header.jsp"/>
    <div class="registration-form" id="wrapper">
      
        
            <form action="${contextPath}/member/signUpView" name="form" method="post" id="termsform">
             <table width="1000" height="650">
              
              <tr>
               <td height="60%" align="center">
               <div class="brand-wrapper">
               
               <span style="padding-left: 120px">
               
               	<p align="left">
                <img src="${contextPath}/resources/images/logo.png" alt="logo" class="logo">
              	<br>
              
				<b>	회원가입 약관</b>
				</span>
               
               </div>
               <br>
               <textarea rows="20" cols="120">
 가. 수집하는 개인정보의 항목             
               첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
            
            회원가입
            - 이름, 아이디(E-mail), 비밀번호, 닉네임, 연락처, 연령, 관심사
         
            둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
            - IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
            셋째, 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
           
나. 개인정보 수집방법
            회사는 다음과 같은 방법으로 개인정보를 수집합니다.
            - 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
            - 협력회사로부터의 제공
            - 생성정보 수집 툴을 통한 수집
               </textarea>
               <br><br>
               <input type="checkbox" name="req"> 개인정보 수집 및 이용에 동의합니다.
               <br>
               <hr>
               </td>
              </tr>
              <tr>
               <td align="center" valign="top">
                <button type="button" class="btn  create-account" id="agreeBtn" onclick="chk()">동의</button>&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn  create-account" id="disagreeBtn"onclick="nochk()" >  동의안함  </button>
            

               </td>
              </tr>
             </table>
             
            </form>
    </div>
           
      
    <jsp:include page="../common/footer.jsp"/>

    <script type="text/javascript">
        function chk(){
         var req = document.form.req.checked;
         var num = 0;
         if(req == true){
          num = 1;
         }
         if(num==1){
          document.form.submit();
         }else{
          alert("개인정보 약관에 동의하셔야 합니다.");
         }
        }
        function nochk(){
         alert("동의하지 않으면 가입하실 수 없습니다");
         location.href="/sogon";
        }
        </script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>
