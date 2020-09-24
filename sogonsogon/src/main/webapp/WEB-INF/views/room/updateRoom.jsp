<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
	@font-face {
		font-family: 'NEXON Lv2 Gothic Bold';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	@font-face {
		font-family: 'BBTreeGL';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGL.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	@font-face {
		font-family: 'Eoe_Zno_L';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	.title {
		width: 100%;
		height: 80px;
		font-size: 40px;
		color: #EA5A00;
		line-height: 70px;
		font-family: 'NEXON Lv2 Gothic Bold';
		letter-spacing: 4px;
	}
	
	.tags {
		width: 88px !important;
		height: 30px !important;
		float: left;
		margin-right: 3px;
	}
	
	.plusbutton {
		background-color: rgb(241, 158, 48);
		width: 15px;
		height: 15px;
		border-radius: 10px;
		line-height: 16px;
		font-size: 20px;
		float: left;
		margin: 5.2px 0px 0px 4px;
		cursor: pointer;
		color: white;
		text-align: center;
	}
	
	.tagform {
		float: left;
	}
	
	.tagbox {
		clear: both;
		width: 100%;
		height: 40px;
		margin-bottom: 10px;
	}
	
	#roomPassword {
		display: none;
	}
	
	#content {
		height: 140px;
	}
	
	.container2 {
		/*   background-color: #F0EDEB; */
		background-color: #FCF9F7;
		padding-bottom: 50px;
		/*         margin-left: 50px; */
		margin: 25px 0px 0px 50px;
		width: 600px;
		padding: 20px;
	}
	
	.bold {
		font-weight: bold;
	}
	
	.btn2, #btn2 {
		background-color: #ffce54;
		border: none;
		border-radius: 16px;
		clear: both;
		color: white;
		height: 30px;
	}
	
	.plusbutton {
		background-color: rgb(241, 158, 48);
		width: 15px;
		height: 15px;
		border-radius: 10px;
		line-height: 12px;
		font-size: 20px;
		float: left;
		margin: 5.2px 0px 0px 4px;
		cursor: pointer;
		color: white;
		text-align: center;
	}
	
	.tagbox {
		clear: both;
		width: 100%;
		height: 40px;
		margin-bottom: 10px;
	}
 	.passArea2{
		display: none;
	} 


</style>
<body>

	<jsp:include page="../common/header.jsp" />
	<div class="container">

		<div class="row">

			<div class="col-lg-3">
				<h1 class="my-4 card-header">방 정보</h1>
				<div class="list-group">
					<p>카테고리 : ${roomDetail.roomTypeName}</p>
					<p>방장 : ${roomDetail.memberId}</p>
					<p>회원 수 : ${roomDetail.roomMemberCount}명</p>
					<p>공개 여부 :
					<c:set var="roomOpenValue" value="${roomDetail.roomOpen}"/> 
						<c:choose>
							<c:when test="${fn:contains(roomDetail.roomOpen, 'Y')}">
								공개
							</c:when>
							<c:otherwise>
								비공개
							</c:otherwise>
						</c:choose>
					</p>
					<p class="list-group-item fas fa-angle-down" id="moreInfo" style="cursor: pointer; color: blue;">&nbsp;더 보기</p>
					<div id="infoList"></div>
					
					<!-- 방장 회원 전용 메뉴-->
					<c:if test="${loginMember.getMemberId() eq roomDetail.memberId}">
					<a href="#modalMemberInfo" class="list-group-item modalLink" id="roomMemberInfo">방 회원 조회</a>
					<a href="${contextPath}/room/updateRoom/${roomDetail.roomNo}" class="list-group-item">방 정보 수정</a>
					</c:if>

				</div>
				<div>
					<button id="prevAtag" class="btn-secondary" style="margin-top: 10px;" onclick="location.href='../roomList/1'">방 나가기</button>
				</div>
			</div>
			<!-- /.col-lg-3 -->
			





			<div class="container2">
				<div class="empty"></div>
				<div class="title">
					<img src="${contextPath}/resources/images/roomInsert-check.png"
						width="40px;" style="margin-right: 10px;">방 정보 수정
				</div>
				<div class="boxarea">
					<form action="../updateRoomInfo/${updateList.roomNo}" role="form" onsubmit="return validate();">
	
						<div class="form-group">
							<label for="exampleFormControlInput1" class="bold">방 이름</label> 
							<input type="text" class="form-control" id="title" name="roomTitle"
								placeholder="방 이름을 작성해주세요." style="width: 530px;" value="${updateList.roomTitle}">
						</div>


						<div class="form-group">
							<label for="exampleFormControlInput1" class="bold">공개 여부</label>
							<br> 
							
	
							<input type="radio" id="o" name="roomOpen" class="open o"	value="Y" checked> 
							<label for="o">공개</label> &nbsp; 
							<input type="radio" id="c" name="roomOpen" class="open c" value="N">
							<label for="c">비공개</label> <br>
							
						
							<div class="passArea2">
								<label for="exampleFormControlInput1" class="bold" style="margin-top: 5px;">기존 비밀번호</label>
								<input type="password"  class="form-control oldPassword" name="roomPassword" id="roomPassword2" style="width: 300px;" placeholder="기존 비밀번호를 입력해주세요.">
								<span class="checkPassword"></span><br>
								<label for="exampleFormControlInput1" class="bold" style="margin-top: 2px;">변경 비밀번호</label>
								<input type="password"  class="form-control"  id="newPassword"  name="newPassword"  style="width: 300px;" placeholder="변경 비밀번호를 입력해주세요.">
							</div>
		
							
							
						</div>

						<div class="form-group">
							<label for="exampleFormControlInput1" class="bold">카테고리</label> <br>
							<select class="custom-select" id="category" name="roomType"
								style="width: 150px;">
								<option value="1" id="tmp1">IT</option>
								<option value="2" id="tmp2">공모전</option>
								<option value="3" id="tmp3">면접</option>
								<option value="4" id="tmp4">전공</option>
								<option value="5" id="tmp5">외국어</option>
								<option value="6" id="tmp6">기타</option>
							</select>
						</div>

						<div class="form-group">
							<label for="exampleFormControlInput1" class="bold">참가 인원
								수</label> <input type="number" class="form-control maxNumber"
								name="roomMaxNumber" maxlength="2" style="width: 150px;" min="1"
								max="50" placeholder="최대 50명"
								value="${updateList.roomMaxNumber}">
						</div>

						<div class="form-group">
							<label for="exampleFormControlTextarea1" class="bold">방 소개</label>
							<textarea class="form-control" id="content" name="roomContent"
								rows="7" style="resize: none;"
								placeholder="방에 대한 간략한 소개를 입력해주세요.">${updateList.roomContent}</textarea>
						</div>


						<div class="form-group">
							<label for="exampleFormControlTextarea1" class="tagform bold">태그
								입력</label>
							<div class="plusbutton">+</div>
							
							<%-- <c:set var="tagList" value="${fn:split(updateList.roomTag, ',')}"/> --%>
							
				             
							<div class="tagbox">
				             <c:forEach var="tagList" items="${updateList.roomTag}">
								<input type="text" class="form-control tags" name="roomTag"  value="${tagList}">
				             </c:forEach>
							</div>

							<button type="button" class="btn2" id="return-btn">목록으로</button>
							&nbsp;
							<button type="submit" class="btn2">등록하기</button>
						</div>

					</form>
				</div>
			</div>
	</div>
</div> 
			<jsp:include page="../common/footer.jsp" />
<script type="text/javascript">

//유효성 검사
function validate() {
	  // 방 이름
	   if ($("#title").val().trim().length == 0) {
	      alert("방 이름을 입력해 주세요.");
	      $("#title").focus();
	      return false;
	   }
	    
	   // 참가 인원 수
	   if ($(".maxNumber").val().trim().length == 0) {
	      alert("참가 인원 수를 입력해주세요.");
	      $(".maxNumber").focus();
	      return false;
	   }
		  
	  // 방 소개
	   if ($("#content").val().trim().length == 0) {
	      alert("방 소개를 입력해 주세요.");
	      $("#content").focus();
	      return false;
	   }

	  // 태그
	   if ($(".tags").val().trim().length == 0) {
	      alert("태그를 입력해 주세요");  
	      var tag =  $(".tags");
	      tag[0].focus();
	      return false;
	   }
	 
	  // 기존 비밀번호 검사
	  var oldPassword = "${updateList.roomPassword}";
	  if($("#roomPassword2").val() !=  oldPassword ){
		  alert("기존 비밀번호를 입력해주세요");
		  $("#roomPassword2").focus();
		  return false;
	  }
	  
	  // 비밀번호
	  if($("#c").prop("checked")){
		  if($("#newPassword").val().trim() == ""){
			  alert("변경 비밀번호를 입력해주세요");
			  $("#newPassword").focus();
			  return false;
		  }
	  }

	  
}

//check 결과 가져오기
$(function(){
	// 비공개 방일때 비밀번호 입력창 hidden
	if( '${updateList.roomOpen}' != 'Y'){
		$(".c").prop("checked", true); 
		$(".passArea2").css("display","block");
	}
	
	
}); 

	// 비공개 버튼 누를시 password input태그 생성
	$("#c").on("change",function(){
			$(".passArea2").css("display","block");
			$(".boxarea").css("height", "790px");
	});
	
	$("#o").on("change",function(){
			$(".passArea2").css("display","none");
			$(".boxarea").css("height", "620px");
	});
	
		
	// 카테고리 SELECT 
	// console.log($("#tmp${updateList.roomType}").val());
	$("#tmp${updateList.roomType}").prop("selected","true");
	
	// 목록으로 돌아가기
	 $("#return-btn").on("click",function(){
		 location.href = "${header.referer}";
	  });
	
	// 이전 비밀번호 일치 검사
	$("#roomPassword2").on("keyup",function(){
		  var oldPassword = "${updateList.roomPassword}";

			if($("#roomPassword2").val() == oldPassword){
				$(".checkPassword").text("비밀번호가 일치합니다.").css("color","green");
			}else{
				$(".checkPassword").text("비밀번호가 불일치합니다.").css("color","red");
			}

	}); 

 // 태그 입력창 생성 + 2번까지(수정)
 var tagCnt = 0;
 var tagCnt2 = 0;

  $(".plusbutton").on("click", function(){

 		if(tagCnt <3 ){
		         $tag = $('<input type="text">').addClass("form-control tags").attr("id", "tags").attr("name","roomTag");
		         $(".tagbox").append($tag);
		         tagCnt++;
 		}
 		if (tagCnt>=3){
 			 //$(".plusbutton").css("display","hidden");
 			
 			 if(tagCnt2 <3){ $(".plusbutton").text("-");
	      			 $(".tags").last().remove();
	      			 // 마이너스가 될때 text에 - 넣으면됨
	      			tagCnt2++;
 			 }else{	 
 				$(".plusbutton").text("+");
 			  $tag = $('<input type="text">').addClass("form-control tags").attr("id", "tags").attr("name","roomTag");
		         $(".tagbox").append($tag);
		        tagCnt2--;
 			 }

	   }
	   });
	
	
</script>
</body>
</html>