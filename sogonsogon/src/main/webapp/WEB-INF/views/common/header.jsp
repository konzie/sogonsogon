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
<link rel="stylesheet" href="resources/css/login.css">
<style>
header.masthead {
	padding-top: 10rem;
	padding-bottom: calc(10rem - 8.5rem);
	background: linear-gradient(to bottom, rgba(192, 155, 155, 0.8) 0%,
		rgba(179, 118, 72, 0.8) 100%), url("${contextPath}/resources/images/bg-masthead.jpg");
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

select {
	background-color: #353b48;
	color: white;
}

.nav-up {
	top: -50px;
}
</style>
</head>
<body>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="${contextPath}">소곤소곤</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/board/boardList">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/board/qnaList">Q&A게시판</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/room/roomList">방 리스트</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">즐겨찾기</a></li>
                        <li class="nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" data-toggle="modal" href="#modal-container-1">로그인</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger">|</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/member/signUpView">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-10 align-self-end">
                        <h1 class="text-uppercase text-white font-weight-bold">오프라인 그룹 스터디 소곤소곤</h1>
                        <hr class="divider my-4" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 font-weight-light mb-5">원하는 구성원 또는 익명의 다수가 모여 공부를 진행할 수 있는 스터디 사이트 입니다<br>모르는 내용에 대해 서로 묻고 풀어보세요</p>
                        <form action="#" method="POST">

                            <div class="d-flex justify-content-center h-100">
                                <div class="searchbar">
                                    <select id="groupName" name="groupName" class="selectpicker" data-style="btn-primary">
                                        <option value="1">자유게시판</option>
                                        <option value="2">Q&A게시판</option>
                                        <option value="3">방</option>
                                    </select>
                                  <input class="search_input" type="text" name="" placeholder="제목검색">
                                  <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
                                </div>
                              </div>
                        </form>
                        
                        
                    </div>
                </div>
            </div>
        </header>
        
       <div class="modal fade" id="modal-container-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" style="align-content: center;">
			<div class="modal-content" style="width: 767px;">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">소곤소곤 로그인</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
		
	  <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="resources/images/jacob-bentzinger-euprCXIZhas-unsplash.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <div class="brand-wrapper">
                <img src="resources/images/로고2.jpg" alt="logo" class="logo">
              </div>
              <form class="form-signin" method="POST" action="#" onsubmit="return loginValidate();">
                  <div class="form-group">
                    <label for="email" class="sr-only">아이디</label>
                    <input type="email" name="memberId" id="memberId" class="form-control" placeholder="아이디" value="">
                  </div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">비밀번호</label>
                    <input type="password" name="memberPwd" id="memberPwd" class="form-control" placeholder="비밀번호">
                  </div>
                  <button class="btn btn-block login-btn mb-4" type="submit">로그인</button>
                </form>
                <a href="#" class="forgot-password-link">아이디 찾기 </a>
                &nbsp;
                <a href="#" class="forgot-password-link">비밀번호 찾기</a>
                <p class="login-card-footer-text">
                <a href="#" class="text-reset">회원가입</a></p>
        
            </div>
          </div>
        </div>
      </div>
   
      </div>

   
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
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
        </script>
        <script>
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
	</script>
</body>
</html>