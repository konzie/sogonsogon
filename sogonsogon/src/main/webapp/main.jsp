<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.room-box {
	width: 100%;
	height: 400px;
	/*  display: flex; */
	justify-content: center;
	flex-wrap: unset;
	font-family: 'GmarketSansMedium';
	text-align: center;
}

.roomlist-box {
	width: 250px;
	height: 220px;
	border-radius: 2.5px;
	box-sizing: border-box;
	border: 2px solid black;
	margin-top : 30px;
	display: inline-block;
	text-align: center;
	box-shadow: 14px 14px rgb(255, 178, 181), -14px 14px rgb(255, 178, 181);
	position: relative;
}

.roomlist-box>img {
	width: 70px;
	position: absolute;
	margin: auto;
	top: 0;
	bottom: 240px;
	left: 0;
	right: 0;
}

#tagbox {
	width: 100%;
	height: 25px;
	text-align: center;
	position: relative;
	margin: 5px auto;
}

.tags {
	font-size: 14px;
	background-color: rgba(116, 116, 116, 0.1);
	display: inline-block;
	margin: 4px 4px 0px 4px;
	border-radius: 3px;
	padding: 2px;
}

.join-button {
	width: 90px;
	height: 30px;
	background-color: rgb(248, 162, 113);
	border-radius: 14px;
	margin: auto;
	color: white;
	line-height: 200%;
	margin-top: 18px;
	cursor: pointer;
}

.category {
	font-size: 14px;
	margin: 28px 0px 2px 0px;
}

.review-box>p {
	clear: both;
}

.room-title {
	font-size: 20px;
	margin: 0px;
}

.enter-number {
	margin-bottom: 1px;
	font-size: 13px;
}

.top-area {
	width: 100%;
	height: 100px;
	text-align: center;
	margin-top: 40px;
}

.empty {
	width: 100%;
	height: 40px;
}

/*  */
.modal-button2 {
	width: 100px;
	height: 35px;
	border-radius: 18px;
	background-color: rgb(248, 162, 113);
	line-height: 200%;
	float: left;
	color: white;
	text-decoration: none;
	margin: 0px 6px;
}

.modal-body {
	text-align: center;
}

.button-area {
	height: 40px;
	width: 100%;
}

.button-area .btn {
	width: 80px;
	height: 38px;
	padding: 0px;
	border-radius: 10px;
	font-size: 18px;
	font-family: 'GmarketSansMedium';
}

.modal-body img {
	width: 70px;
}

.modal-btn-area2 {
	margin: 10px auto;
	width: 50%;
	box-sizing: border-box;
	top: 0px;
	bottom: 0px;
	left: 0px;
	right: 0px;
}

.m-title {
	height: 20%;
	font-size: 24px;
	margin: 0px 8px 0px 0px;
}

.m-passnotice {
	font-size: 13px;
}

.clear-btn {
	border: 2px solid white;
	color: white;
	text-align: center;
	text-decoration: none;
	width: 90px;
	height: 30px;
	border-radius: 14px;
	line-height: 160%;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/header.jsp" />
	메인페이지.
	<div class="container">
		<div class="row">
			<div class="col-lg-6" align="center">이미지영역1</div>
			<div class="col-lg-6" align="center">이미지영역2</div>
		</div>

		<hr>

		<div class="row">
			<div class="col-lg-6" align="center">
				<p>
				<h2>자유게시판</h2>
				</p>
				<table class="table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4" align="center"><strong>글 내용이 없습니다.</strong></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-lg-6" align="center">
				<p>
				<h2>Q&A게시판</h2>
				</p>
				<table class="table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4" align="center"><strong>글 내용이 없습니다.</strong></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<hr>

		<div class="row">
			<div class="col-lg-12" align="center">
				<h2>방 리스트</h2>
			</div>
		</div>

		<div class="row" id="roomListArea">
			<div class="col-lg-3" align="center">

				<div class="room-box">
					<div class="roomlist-box">
						<img src="${contextPath}/resources/images/clip.png">


						<p class="room-content">
						<p class="category" id="${tag}">[${tag}]</p>
						<p class="room-title">${roomList.roomTitle}</p>
						<p class="enter-number">
							방장 : ${roomList.memberNick}<br> 참가인원 : /10명 │ 개설일 :
							${createDate}
						</p>


						<div id="tagbox">
							<div class="tags">#${tag}</div>
						</div>

						<a data-toggle="modal" data-target="#myModal">
							<div class="join-button" id="${roomList.roomNo}">참여하기</div>
						</a>
					</div>
					<!-- roomlist end-->
				</div>
				<!--room-container end-->


			</div>
			<div class="col-lg-3" align="center">

				<div class="room-box">
					<div class="roomlist-box">
						<img src="${contextPath}/resources/images/clip.png">


						<p class="room-content">
						<p class="category" id="${tag}">[${tag}]</p>
						<p class="room-title">${roomList.roomTitle}</p>
						<p class="enter-number">
							방장 : ${roomList.memberNick}<br> 참가인원 : /10명 │ 개설일 :
							${createDate}
						</p>


						<div id="tagbox">
							<div class="tags">#${tag}</div>
						</div>

						<a data-toggle="modal" data-target="#myModal">
							<div class="join-button" id="${roomList.roomNo}">참여하기</div>
						</a>
					</div>
					<!-- roomlist end-->
				</div>
				<!--room-container end-->

			</div>
			<div class="col-lg-3" align="center">


				<div class="room-box">
					<div class="roomlist-box">
						<img src="${contextPath}/resources/images/clip.png">


						<p class="room-content">
						<p class="category" id="${tag}">[${tag}]</p>
						<p class="room-title">${roomList.roomTitle}</p>
						<p class="enter-number">
							방장 : ${roomList.memberNick}<br> 참가인원 : /10명 │ 개설일 :
							${createDate}
						</p>


						<div id="tagbox">
							<div class="tags">#${tag}</div>
						</div>

						<a data-toggle="modal" data-target="#myModal">
							<div class="join-button" id="${roomList.roomNo}">참여하기</div>
						</a>
					</div>
					<!-- roomlist end-->
				</div>
				<!--room-container end-->

			</div>
			<div class="col-lg-3" align="center">

				<div class="room-box">
					<div class="roomlist-box">
						<img src="${contextPath}/resources/images/clip.png">


						<p class="room-content">
						<p class="category" id="${tag}">[${tag}]</p>
						<p class="room-title">${roomList.roomTitle}</p>
						<p class="enter-number">
							방장 : ${roomList.memberNick}<br> 참가인원 : /10명 │ 개설일 :
							${createDate}
						</p>


						<div id="tagbox">
							<div class="tags">#${tag}</div>
						</div>

						<a data-toggle="modal" data-target="#myModal">
							<div class="join-button" id="${roomList.roomNo}">참여하기</div>
						</a>
					</div>
					<!-- roomlist end-->
				</div>
				<!--room-container end-->

			</div>
		</div>
	</div>
	<jsp:include page="WEB-INF/views/common/footer.jsp" />
	
	<script type="text/javascript">
		$(function() {
			roomListView();
		});
		
		function roomListView() {
			$.ajax({
				url : "room/roomListView",
				dataType : "json",
				success : function(roomList) {
					$("#roomListArea").html(""); // 초기화
					
					$.each(roomList, function(index, item)) {
						$div1 = $("<div>").addClass("col-lg-3");
						$div2 = $("<div>").addClass("roomlist-box");
						$img = $("<img>").attr("src", "${contextPath}/resources/images/clip.png");
						
						$p1 = $("<p>").addClass("room-content");
						$p2 = $("<p>").addClass("category").text(item.tag);
						$p3 = $("<p>").addClass("room-title").text(item.title);
						$p4 = $("<p>").addClass("enter-number").html("방장 : <br>인원 : " );
						
						$div3 = $("<div>").attr("id", "tagbox");
						$div4 = $("<div>").addClass("tags").text(item.tag);
						
					}
					
					
				}, error : function() {
					console.log("ajax 통신 실패");
				}
			});
		}
	</script>
</body>
</html>