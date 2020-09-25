<%@page import="com.kh.sogon.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/roomList.css">
<style>
	#flag img{
		margin-top: 4px;
		width: 18px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body style="background-color: #F0EDEB;">
   <jsp:include page="../common/header.jsp" />
   
   
   <div class="table-title">
       <div style="width: 75%; height: 100%; float: left;">
            <h1>Study Room</h1>
            <p>소곤소곤은 소규모 소통이 가능한 사이트입니다. <br>
            사용자간 질의응답을 통해 지식을 나눠주세요.
            </p>
            <a href="${contextPath}/room/insertRoom"><div class="clear-btn">방만들기</div></a>  
            
        </div>
        
        <div style="width: 23%; height: 100%; float: left;">
        	<img src="${contextPath}/resources/images/roomList-chat.png"  width="100px;" style="float: right; margin-top: 10px;">
        </div>
   </div>

	<hr>

      <div class="selectList">
         <select name="sKey">
         		 <option value="${contextPath}/room/roomList">전체</option>
                  <option value="1">IT</option>
                  <option value="2">공모전</option>
                  <option value="3">면접</option>
                  <option value="4">전공</option>
                  <option value="5">외국어</option>
                  <option value="6">기타</option>
          </select>
       </div>
      
	<%--네모 박스 --%>
   <c:set var="roomList" value="${roomList}"/>
    <div class="room-box">
    <c:forEach var="roomList"  items="${roomList}">
        <div class="roomlist-box">
        
          	 <div id="flag" style="top:-19px"> 
          	 	<!--  N == 아스키코드 78 (char타입이여서 string인식이 안됨)-->
				  <c:if test="${roomList.roomOpen == 78}" >
						<c:set var="src"  value="${contextPath}/resources/images/whitelock.png" />
							<img src="${src}" >
					</c:if> 			
          	 </div>
		
          	 
          	<c:choose>
           		<c:when test="${roomList.roomType ==1}">
           			<c:set var="tag" value="IT"/>
           		</c:when>
           		 <c:when test="${roomList.roomType ==2}">
           			<c:set var="tag"  value="공모전"/>
           		</c:when>
           		<c:when test="${roomList.roomType ==3}">
           			<c:set var="tag"  value="면접"/>
           		</c:when>
           		<c:when test="${roomList.roomType ==4}">
           			<c:set var="tag"  value="전공"/>
           		</c:when>
           	    <c:when test="${roomList.roomType ==5}">
           			<c:set var="tag"  value="외국어"/>
           		</c:when>
           		  	    <c:when test="${roomList.roomType ==6}">
           			<c:set var="tag"  value="기타"/>
           		</c:when>
            </c:choose>
            
            <fmt:formatDate var="createDate" value="${roomList.roomCreateDate}" pattern="yyyy-MM-dd"/> 
            
            <p class="room-content">
          
				
                <div class="category" id="${tag}">${tag}.</div>
                <p class="room-title">${roomList.roomTitle}</p>
                <hr>
 				<span class="count1">참가인원 : ${roomList.roomMemberCount}</span>
 				<span  class="count2">/${roomList.roomMaxNumber}명</span>
				<div style="font-size: 14px; margin-bottom: 8px; margin-top: 8px">개설일 : ${createDate}</div>
 				<div style="font-size: 14px; margin-bottom: 8px;">방장 : ${roomList.memberNick}</div>
				<div class="room-text">${roomList.roomContent}</div>
	
				<c:set var="tags" value="${fn:split(roomList.roomTag, ',')}"/>
		
	             <c:set var="roomNo" value="${roomList.roomNo}" />
	            <div id="tagbox">
	             <c:forEach var="tag" items="${tags}">
	                <div class="tags">#${tag}</div> 
	             </c:forEach>
            </div>
   
			<c:choose>
					<%-- test는 el만 적을 수 있음 (비교, 계산 같은걸 하나 EL 안에 작성가능) --%>
				<c:when test="${roomList.roomMemberCount != roomList.roomMaxNumber}">
		            <a data-toggle="modal"  data-target="#myModal">
		            	<div class="join-button" id="${roomList.roomNo}"   onclick="return validate();"><span>참여하기</span></div>
		            </a>
				</c:when>
				<c:otherwise>
		            <a data-toggle="modal" >
		            	<div class="join-button noPart" id="${roomList.roomNo}"   onclick="return validate();">참여불가</div>
		            </a>
				</c:otherwise>
			</c:choose>
            
      </div> <!-- roomlist end-->
      </c:forEach>
    </div><!--room-container end-->
      
      <hr>
      <!-- 방만들기 영역 -->

<!-- ------------------------------------------------------------------------------------------------------------- -->
	<!--검색 전 : http://localhost:8081/sogon/room/roomList/1-->
    <!--검색 후 :  http://localhost:8081/sogon/room/search/검색어  -->
    <!-- select box : http://localhost:8081/sogon/room/select/2 -->

    
	    <%-- 검색 파라미터가 포함된 url 생성 --%>
	    <c:url var="searchParameter" value="${pInfo.boardType}">
	    <%--ct 라는 값이 비어있지 않는다면  / c:param  : 파라미터에 붙어짐--%>
	    <%--  paramValues  : paramValues 객체는 다수의 파라미터 값을 배열로 가져올 때 사용된다. --%>
	    	
	    	<c:if test="${!empty param.sVal}">
	    		<c:param name="sKey" value="${param.sKey}"/>
	    		<c:param name="sVal" value="${param.sVal}"/>
	    	</c:if>
	    </c:url> 
	     
	     
	     <%-- 검색 파라미터가 있을 경우 / 없을 경우 url 가공 --%>
	      <c:choose>
		      	<%-- 검색 조건이 존재하는 경우(파라미터 cp가 쿼리스트링 제일 마지막에 추가될 수 있도록 '&' 기호 추가) --%>
		      	<c:when test="${ !empty param.sVal }">
		      	<%-- http://localhost:8081/sogon/room/search/테 --%>
		      		<c:set var="url" value="${searchParameter}&cp="  />
	    			 <%-- + 상세 조회 목록으로 버튼 주소 가공 --%>
	    			  <c:set var="listUrl" value="../search/${url}${pInfo.currentPage}" scope="session"/>

	     
		      	</c:when>
		      		<%-- 검색 조건이 존재하지 않는 경우(파라미터 cp가 쿼리스트링 제일 앞에 추가될 수 있도록 '?' 기호 추가) --%>
		      	<c:otherwise>
		      		<c:set var="url" value="${searchParameter}?cp="  />
		      		 <c:set var="listUrl" value="../list/${url}${pInfo.currentPage}" scope="session"/>
		      		
		      	</c:otherwise>
	      </c:choose>
	      

  <!-- ------------------------------------------------------------------------------------------------------------- -->  

      
      
     <!-- 페이징 -->
    <c:set var="url" value="/sogon/room/${roomPath}/${type}?cp="  />
   <div class="pageN">
      <div class="pagination2" style="display: inline-block;">
      
        <a href="${url}1">&laquo;</a> <%-- '<<' --%> <!-- ${url} : cp=  -->
        
        <%-- 10개 목록 --%>
		<c:forEach var="p" begin="${pInfo.startPage}" end="${pInfo.endPage}">
			<c:choose>
				<c:when test="${p==pInfo.currentPage}">
					<a class="active">${p}</a>
				</c:when>
				<c:otherwise>
					<a href="${url}${p}">${p}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
         
        <a href="${url}${pInfo.maxPage}">&raquo;</a>  <%-- '>>' --%>
      </div>
   </div>
       
       <!-- 검색 영역 -->
       <div class="search-area">    
               <div class="search-box">
                <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
                <form action="" class="search-form">
                    <input type="text" placeholder="제목 또는 태그를 입력해주세요." id="search" autocomplete="off" name="sVal" style="font-size: 16px;">
                </form>
                <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
                 xml:space="preserve">
              <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
              <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
            </svg>
                <div class="go-icon"><i class="fa fa-arrow-right"></i></div>
            </div>
      </div> <!-- search-area end -->
      
      
              
     <!-- Modal -->
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
               <p class="m-content" style="margin-bottom: 6px; font-size: 16px; width: 400px;"></p>
              
              <div class="pass-area">[
             	    <img src="${contextPath}/resources/images/lock.png"  style="width: 40px;">
]
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
                <button type="submit"  class="modal-button2" id="modal-btn">참여하기</button>
            </div>
      
           </div>
           
         </div>
       </div>
     </div> <!-- modal end -->
     </form>
   
          <div class="loginText" >${loginMember.memberNo}</div>

   
   <jsp:include page="../common/footer.jsp" />
   
<script>
// 방만들기 버튼 유효성 검사
$(".clear-btn").on("click",function(){
	if($(".loginText").text() ==""){
		alert("로그인을 해주세요");
		return false;
	}
});

// 방번호 넘기기 위한 함수
	$(".join-button").on("click",function(){
		if($(".loginText").text() ==""){ // 로그인안됐을때 경고창
			alert("로그인을 해주세요");
			return false;
		    
		}else{
			$(".pass-area").css("display","block");   
			   var roomNo = $(this).attr("id");
			   // console.log(roomNo);
			   $(".hiddenNo").val(roomNo);
			
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
								$(".m-content").append("<br>이미 가입한 방입니다.<br>바로 입장이 가능합니다.").css("font-size","18px;");
							}
						} 
						
					},error : function(){
						 console.log("ajax 통신 실패");
					}
				});
		} // else end
	});
	
	// 검색창 엔터시 동작
	$("#search").on("keyup", function(event){
		if(event.keyCode == 13){ // 엔터키가 눌러진 경우
			var searchUrl = "";
			
			var $search = $("#search").val();
			console.log( $search );
			if($search.trim().length != 0){ // 검색어 있는 경우
				//searchUrl ="${pInfo.boardType}";		
				location.href="${contextPath}/room/search/"+$search;
			
			}else{ // 검색어 없는 경우
				alert("검색어없음");
				$(".room-box ").text("해당 게시글이 없습니다.");
			}
			
		}
	});

	
	// 셀렉트박스 목록 정렬
	$(function(){
		$("select[name='sKey']").change(function() {
			var option = $("select[name='sKey'] option:selected").val();
			console.log(option); // option에는 번호담겨있음
			
			console.log(option);
			
			if(isNaN(option)){
				location.href= "${contextPath}/room/roomList/1";
			}else{
				location.href= "${contextPath}/room/select/"+option;
			}
		});
	});
	
	// 검색값 유지
	$(function(){
		var roomPath = "${roomPath}";
		var sKey = "${type}";
		var sVal = "${param.sVal}";
		
		// EL 구문에서 값이 없을 경우 ""(빈문자열)이 반환됨
		
		
		if(sKey != "" || sVal != ""){
			// 검색어 세팅
			$("input[name='sVal']").val(sVal);  
			
			// 검색 조건 세팅
			$("select[name='sKey'] > option").each(function(index,item){
				if(index == 0 && roomPath == "roomList"){
					$(item).prop("selected",true);
				}
				
				else if( roomPath != "roomList" && $(item).val() == sKey){
					$(item).prop("selected",true);
				}
			});
		}
	});

	
	
</script>
</body>
</html>