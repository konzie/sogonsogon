<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SogonSogon</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/login.css">
<style>
header.masthead {
	padding-top: 10rem;
	padding-bottom: calc(10rem - 8.5rem);
	background:  linear-gradient(to bottom, rgba(244,164, 096, 0.6) 50%,
		rgba(255, 204, 102, 0.5) 100%),  url("${contextPath}/resources/images/header_3.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-size: cover;
}

header.masthead h1 {
   font-size: 2.25rem;
}

@media ( min-width : 1200px) {
   header.masthead h1 {
      font-size: 3.5rem;
   }
}

.searchbar {
   margin-bottom: auto;
   margin-top: auto;
   height: 60px;
   background-color: #353b48;
   border-radius: 30px;
   padding: 10px;
}

.search_input {
   color: white;
   border: 0;
   outline: 0;
   background: none;
   width: 0;
   caret-color: transparent;
   line-height: 40px;
   transition: width 0.4s linear;
}

.searchbar:hover>.search_input {
   padding: 0 10px;
   width: 450px;
   caret-color: red;
   transition: width 0.4s linear;
}

.searchbar:hover>.search_icon {
   background: white;
   color: #e74c3c;
}

.search_icon {
   height: 40px;
   width: 40px;
   float: right;
   display: flex;
   justify-content: center;
   align-items: center;
   border-radius: 50%;
   color: white;
   text-decoration: none;
}

#groupName {
   background-color: #353b48;
   color: white;
}

.nav-up {
   top: -50px;
}


#loginModal{
   display:inline-block;
   display:inline;
   margin:auto;

}

#loginModalContent{
   display:inline-block;
   display:inline;
   margin:auto;
   }
   
#loginModalHeader,#modalBody{
   margin:auto;
}
#loginModalFooter{
float: left;
margin-left: 265px;
margin-bottom: 30px;
}
   

.modal-header{
/*    background-color: white !important; */
   height: 10px !important;
   border-bottom: 0px;
}
.modal-body{
/*    background-color: white !important; */
}
.modal-footer{
/*    background-color: white !important; */
   border-top: 0px;
}
 
 
 #navbarResponsive{
 		font-family: 'GmarketSansMedium'; 
 }
 
 #mainText{
		font-family: 'yg-jalnan'; 
 }
 
 #mainContent{
 		font-family: 'GmarketSansMedium';
 }
	
@font-face {
		font-family: 'GmarketSansMedium';
		src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
@font-face { font-family: 'yg-jalnan'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff'); 
	font-weight: normal; font-style: normal; }
     



</style>
<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<c:if test="${!empty msg}"> 
	<script>
   	swal("${msg}");
	</script>
   <c:remove var="msg"/>
 </c:if>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="${contextPath}"> <img src="${contextPath}/resources/images/logo.png" alt="logo" class="logo" style="width: 130px;"></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/board/boardList">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/room/roomList/1">방 리스트</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/help/list/1">고객센터</a></li>
                        <li class="nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
             
                         <c:choose>
	            		<c:when test="${empty loginMember}">
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" data-toggle="modal" href="#modal-container-1">로그인</a></li>
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger">|</a></li>
	                  		<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/member/termsForm">회원가입</a></li>
	                    </c:when>
	            		<c:otherwise>
	            		    <c:choose>
	            			<c:when test="${loginMember.getMemberGrade().equals('A')}">
                         		<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/mypage/adminpage">${loginMember.memberName}</a></li>
                         	</c:when>
                         	<c:otherwise>
                         		<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/mypage/mypage">${loginMember.memberName}</a></li>
                         	</c:otherwise>
                         	</c:choose>
                          <li class="nav-item"><a class="nav-link js-scroll-trigger">|</a></li>
                         <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/member/logout">로그아웃</a></li>
                        </c:otherwise>
            		</c:choose>
            		    
                    </ul>
                </div>
            </div>
        </nav>

        <header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-10 align-self-end" id="mainText">
                        <h1 class="text-uppercase text-white font-weight-bold">오프라인 그룹 스터디 소곤소곤</h1>
                        <hr class="divider my-4" />
                    </div>
                    <div class="col-lg-8 align-self-baseline" id="mainContent">
                        <p class="text-white-75 font-weight-light mb-5">원하는 구성원 또는 익명의 다수가 모여 공부를 진행할 수 있는 스터디 사이트 입니다<br>모르는 내용에 대해 서로 묻고 풀어보세요</p>

                            <div class="d-flex justify-content-center h-100">
                                <div class="searchbar">
                                    <select id="groupName" name="groupName" class="selectpicker" data-style="btn-primary">
                                        <option value="1">자유게시판</option>
                                        <option value="2">Q&A게시판</option>
                                    </select>
                                  <input class="search_input" type="text" name="msVal" placeholder="제목검색">
                                  <a  class="search_icon" id="mainSearchBtn"><i class="fas fa-search"></i></a>
                                </div>
                              </div>
                       
                        
                        
                    </div>
                </div>
            </div>
        </header>
        
       <div class="modal fade" id="modal-container-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" style="align-content: center;" style="width: 767px;" id="loginModal">
			<div class="modal-content" style="width: 767px;" id="loginModalContent">
				<div class="modal-header" style="width: 767px;" id="loginModalHeader">
					
				</div>
				<div class="modal-body" style="width: 767px;" id="modalBody">
	
	<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
				<c:if test="${not empty cookie.saveId}">
					<c:set value="checked" var="checked"/>
				</c:if>
				
	  <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="${contextPath}/resources/images/jacob-bentzinger-euprCXIZhas-unsplash.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <div class="brand-wrapper">
                <img src="${contextPath}/resources/images/logo.png" alt="logo" class="logo">
              </div>
              <form class="form-signin" method="POST" action="${contextPath}/member/loginAction" onsubmit="return loginValidate();">
                  <div class="form-group">
                    <label for="email" class="sr-only">아이디</label>
                    <input type="email" name="memberId" id="memberId" class="form-control" placeholder="아이디" required autofocus> 
                  </div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">비밀번호</label>
                    <input type="password" name="memberPwd" id="memberPwd" class="form-control" placeholder="비밀번호" required>
                  </div>
                  <button class="btn btn-block login-btn mb-4" type="submit">로그인</button>
            
               <div class="checkbox mb-3">
				<label> 
					<input type="checkbox" name="saveId" id="saveId" > 아이디 저장 
				</label>
				
				
	
				</div>
				
                </form>
                <a href="${contextPath}/member/findIdForm" class="forgot-password-link">아이디 찾기 </a>
                &nbsp;
                <a href="${contextPath}/member/findPwdForm" class="forgot-password-link">비밀번호 찾기</a>
                <p class="login-card-footer-text">
                <a href="${contextPath}/member/termsForm" class="text-reset">회원가입</a></p>
				
				<div  style="width: 767px;" id="loginModalFooter">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
        
            </div>
          </div>
        </div>
      </div>
   
      </div>

   
				</div>
			</div>
		</div>
	</div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>        
        <script>
        
        
            var didScroll;
            var lastScrollTop = 0;
            var delta = 5;
            var navbarHeight = $("#mainNav").outerHeight();
            
            $(window).scroll(function(event){
                didScroll = true;
            });

            setInterval(function() {
              if (didScroll) {
                hasScrolled();
                didScroll = false;
              }
            }, 250);

            function hasScrolled() {
              var st = $(this).scrollTop();
              if(Math.abs(lastScrollTop - st) <= delta)
              return;
              if (st > lastScrollTop && st > navbarHeight){
                $("#mainNav").removeClass('nav-down').addClass('nav-up');
              } else {
                if(st + $(window).height() < $(document).height()) { 
                  $("#mainNav").removeClass('nav-up').addClass('nav-down');
                }
              }

              lastScrollTop = st;
            }
    
		// 로그인 유효성 검사
		// -> 아이디, 비밀번호 중 하나라도 입력되지 않으면 form 태그 기본 이벤트를 제거
		function loginValidate() {
			
			if($("#memberId").val().trim() == ""){
				alert("아이디를 입력해 주세요.");
				$("#memberId").focus();
				return false; // 기본 이벤트 제거
			}
			if($("#memberPwd").val().trim() == ""){
				alert("비밀번호를 입력해 주세요.");
				$("#memberPwd").focus();
				return false; // 기본 이벤트 제거
			}
			
			return true;
			
		}
		
		
	// 쿠키
		$(document).ready(function(){
 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#memberId").val(key); 
     
    if($("#memberId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#saveId").change(function(){ // 체크박스에 변화가 있다면,
        if($("#saveId").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#memberId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#saveId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		
		
		   // --------------------검색 버튼 동작 
  	$("#mainSearchBtn").on("click", function(){
  		
  		
  		var $sVal = $("input[name='msVal']");
  		var $sKey = "tit-con"
  		
  		if($sVal.val().trim().length == 0){
			alert("검색어를 입력해주세요.");
			
			
  		}
  		else{
  			searchUrl = "${contextPath}/board/search?cp=1&";
  			
  			// 검색어가 입력된 경우
  			if($sVal.val().trim().length != 0){
  				searchUrl += "sKey"+$sKey+"&sVal=" + $sVal.val();
  			}
  	  		location.href = searchUrl;
  		}
  	});
  	

  	// -------- 검색창 엔터 이벤트 -----------
  	$("input[name='msVal']").on("keyup", function(event){

  	 if(event.keyCode == 13){ 
  	  $("#mainSearchBtn").click();	 
  	 }
  	 
  	});
  	
  	//---
			
		
	</script>
</body>
</html>