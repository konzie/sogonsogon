<%@page import="org.springframework.ui.Model"%>
<%@page import="com.kh.sogon.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
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
	font-family: 'Poppins', sans-serif;
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
	margin-top: 12px;
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

	/* 슬라이드 css */
	.section{
		width: 100%;
		padding-top:150px;
	}
	
	#carouselExampleCaptions{
		height: 25%;
	}
	
	#carouselExampleCaptions div{
		height: 100%;
	}
	
	#carouselExampleCaptions img{
		width: 100%;
	}
	#roomListArea{
		background-color: #f8f9fa;
		height: 300px;
	}
	.container{
		width: 100%;
	}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="WEB-INF/views/common/header.jsp" />

<!-- 이미지 슬라이드 영역 -->

  <section id="content">
  
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
        	<img src="${contextPath}/resources/images/슬라이드1.png">
          <div class="carousel-caption d-none d-md-block">

          </div>
        </div>
        <div class="carousel-item">
        	<img src="${contextPath}/resources/images/슬라이드1.png">
          <div class="carousel-caption d-none d-md-block">

          </div>
        </div>
        <div class="carousel-item">
        	<img src="${contextPath}/resources/images/슬라이드1.png">
          <div class="carousel-caption d-none d-md-block">

          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <!-- 이미지 슬라이드 영역 end -->
    
<!-- body with:100%할시 container이름변경  -->
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
            <table class="table" >
               <thead>
                  <tr>
                     <th>글번호</th>
                     <th>분류</th>
                     <th>제목</th>
                     <th>작성자</th>
                  </tr>
               </thead>
               <tbody id="freeboard">
             
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
                  <p class="category"  id="category0"></p>
                  <p class="room-title" id="room-title0">${roomList.roomTitle}</p>
                  <p class="enter-number">
                     방장 :<span id="member-nick0"></span>
                     <br> 참가인원 : <span id="member-count0"></span>/<span id="max-count0"></span>명 <br>
                      개설일 : <span id="create-date0"></span>
                     ${createDate}
                  </p>


                  <div id="tagbox">
                     <div class="tags" id="tags0">#${tag}</div>
                  </div>
                  
				 
                  <a data-toggle="modal" data-target="#myModal">
                     <div class="join-button" id="join-button0">참여하기</div>
				 <input type="hidden"  id="roomNo0">
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
                  <p class="category"  id="category1"></p>
                  <p class="room-title"  id="room-title1">${roomList.roomTitle}</p>
                  <p class="enter-number">
                     방장 :<span id="member-nick1"></span>
                     <br> 참가인원 : <span id="member-count1"></span>/<span id="max-count1"></span>명 <br>
                      개설일 : <span id="create-date1"></span>
                  </p>
                  <div id="tagbox">
                     <div class="tags" id="tags1"></div>
                  </div>
					
				
                  <a data-toggle="modal" data-target="#myModal">
                     <div class="join-button" id="join-button1">참여하기</div>
					 <input type="hidden"  id="roomNo1">	
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
                  <p class="category" id="category2"></p>
                  <p class="room-title"  id="room-title2">${roomList.roomTitle}</p>
                  <p class="enter-number">
                     방장 :<span id="member-nick2"></span>
                     <br> 참가인원 <span id="member-count2"></span>/<span id="max-count2"></span>명 <br>
                      개설일 : <span id="create-date2"></span>
                  </p>


                  <div id="tagbox">
                     <div class="tags" id="tags2"></div>
                  </div>
				
				 
                  <a data-toggle="modal" data-target="#myModal">
                     <div class="join-button" id="join-button2">참여하기</div>
				 <input type="hidden"  id="roomNo2">
                  </a>
               </div>
               <!-- roomlist end-->
            </div>
            <!--room-container end-->

         </div>
         <div class="col-lg-3" align="center">

            <div class="room-box">
               <div class="roomlist-box">
                  <img src="${contextPath}/resources/images/clip.png" style="width: 70px;">
                  <p class="room-content">
                  <p class="category"  id="category3"></p>
                  <p class="room-title"  id="room-title3"></p>
                  <p class="enter-number">
                     방장 :<span id="member-nick3"></span>
                     <br> 참가인원 : <span id="member-count3"></span>/<span id="max-count3"></span>명 <br>
                      개설일 : <span id="create-date3"></span>
                  </p>


                  <div id="tagbox">
                     <div class="tags" id="tags3"></div>
                  </div>
				
                  <a data-toggle="modal" data-target="#myModal">
                     <div class="join-button" id="join-button2">참여하기</div>
				 <input type="hidden"  id="roomNo2">
                  </a>
               </div>
               <!-- roomlist end-->
            </div>
            <!--room-container end-->

         </div>
      </div>
   </div>
   
   
      <!-- Modal -->
      <c:if test="${!empty loginMember}">
     <form class="transPage" method="post">
     <div class="modal fade" id="myModal" role="dialog" style="text-align: center;">
       <div class="modal-dialog ">
         <div class="modal-content">
           <div class="modal-header">입장하기
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title"></h4>
           </div>
           <div class="modal-body">

               <p class="m-title" style="font-weight: bold;"></p>
               <p class="m-content" style="margin-bottom: 6px; font-size: 14px;"></p>
              
              <div class="pass-area">[
             	    <img src="${contextPath}/resources/images/lock.png"  style="width: 40px;">

                 <p style="margin: 0px;">참여 번호 입력</p>
                  <input type="password" placeholder="영문/숫자 4~10자리"  name="inputPwd" style="margin-top: 10px;"> 
                 <p class="m-passnotice">
                       참여 비밀 번호가 필요한 채팅방입니다.<br>
                       참여 비밀 번호를 입력해 주세요.
                 </p>
  				  <input type="hidden"  class="hiddenNo" name="roomNo"> <!--  hiddenNo 영역보일시 display:none처리-->
              </div>

            
            <div class="modal-btn-area2" > 
              	<button type="button"  class="modal-button2" data-dismiss="modal">뒤로가기</button>
                <button type="button"  class="modal-button2" id="modal-btn">참여하기</button>
            </div>
      
           </div>
         </div>
       </div>
     </div>
     </form> <!-- modal end -->
     </c:if>
     
   <jsp:include page="WEB-INF/views/common/footer.jsp" />

	
	<script type="text/javascript">
/* 		$(function() {
			roomListView();
		}); */
		
	/* 	function roomListView() {
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
		} */
		
		
	$(function() {
		$.ajax({
			url: "${contextPath}/room/mainRoomList",
			type : "POST",
			dataType : "JSON",
			success: function(roomList){
				
				for(var i=0; i<roomList.length; i++){
					var tags =(roomList[i].roomTag).split(',');
					
					if(roomList[i].roomType == "1"){
						var caregoryName = "IT";
					}else if(roomList[i].roomType == "2"){
						var caregoryName = "공모전";
					}else if(roomList[i].roomType == "3"){
						var caregoryName = "면접";
					}else if(roomList[i].roomType == "4"){
						var caregoryName = "전공";
					}else if(roomList[i].roomType == "5"){
						var caregoryName = "외국어";
					}else{
						var caregoryName = "기타";
					}
					
					//$("#category"+i).text(roomList[i].roomType);
					$("#category"+i).text(caregoryName);
					$("#room-title"+i).text(roomList[i].roomTitle);
					$("#tags"+i).text(tags);
					$("#member-nick"+i).text(roomList[i].memberNick);
					$("#member-count"+i).text(roomList[i].roomMemberCount);
					$("#max-count"+i).text(roomList[i].roomMaxNumber);
					$("#create-date"+i).html(roomList[i].roomCreateDate);
					$("#roomNo"+i).html(roomList[i].roomNo);
					
				}
			},error: function(){
				 console.log("ajax 통신 실패");
			}	
		}); /* ajax end */
		
	});
	
	if("${loginMember}" != ""){
		for(var i=0; i<4; i++){		
			$("#join-button"+i).on("click",function(){
				// 참여하기 버튼 눌렀을 때 방번호 얻기
				var roomNo = $(this).next().text();
				console.log(roomNo);
				
				 $(".transPage").prop("action", "${contextPath}/room/roomDetail/"+ roomNo);
				  
				
				$.ajax({
					url : "${contextPath}/room/roomMList/"+roomNo,
					type : "POST",
					dataType : "JSON",
					success : function(map){
						$(".m-title").html("\""+map.room.roomTitle+"\''");
						$(".m-content").html(map.room.roomContent);
						
						// 비공개 방인경우 비밀번호 입력창 사라짐
						if(map.room.roomOpen == 'Y' ){
							$(".pass-area").css("display","none");
							
						}
						
						// 로그인한 멤버가 이미 가입한 방일때 
						for(var i=0; i<map.roomMember.length; i++){
							if(roomNo == map.roomMember[i].roomMemberRoomNo){
								$(".pass-area").css("display","none");
								$(".m-content").append("<br>+이미 가입한 방입니다.");
							}
						} 
			
					},error : function(){
						 console.log("ajax 통신 실패");
					}
				}); /*ajax end  */
				
				//$("#myModal").open();
				
			});
		}
	}
	
	$("#modal-btn").click(function(){
		//$(".transPage").submit();
		location.href=$(".transPage").attr("action");
	});
	
	// ------------------자유게시판 실시간 조회-----------------------------
		$(function() {
			$.ajax({
				url: "${contextPath}/board/mainBoardList",
				dataType : "JSON",
				success: function(boardList){
					console.log(boardList);
					
					$("#freeBoard").html("");
	
					$.each(boardList, function(index, item){
						
						var $tr = $("<tr>"); // 행
						var $td1 = $("<td>").text(item.qnaNo);
						var $td2 = $("<td>").text(item.qnaCategory);
						var $td3 = $("<td>").text(item.qnaTitle);
						var $td4 = $("<td>").text(item.writerNick);
						
						
						$tr.append($td1, $td2, $td3, $td4);
						//console.log($tr);
						
						$("#freeBoard").append($tr);
					});
					
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
				
			}); // ajax end
		}); // ready함수 end
		
	//----------------------q&a게시판 실시간 조회----------------------------
	// qna 게시판이 없어요...
	</script>
</body>
</html>