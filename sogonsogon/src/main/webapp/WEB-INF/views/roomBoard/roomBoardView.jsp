<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<style>
	#board-area{ margin-bottom:100px;}
	#board-content{ padding-bottom:150px;}
	#date-area{font-size: 12px; line-height: 12px}
	#date-area>p{margin: 0}
 

	.boardImgArea{
		height: 300px;
	}

	.boardImg{
		width : 100%;
		height: 100%;
		
		max-width : 300px;
		max-height: 300px;
		
		margin : auto;
	}
	
	#content-main{ margin: 100px auto;}
	
	/* 이미지 화살표 색 조정
	-> fill='%23000' 부분의 000을
	   RGB 16진수 값을 작성하여 변경 가능 
	 */
	.carousel-control-prev-icon {
 		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
	}
	
	.carousel-control-next-icon {
  		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container" id="content-main">

		<div>
			<h1></h1>
			<hr>
			<div id="board-area">

				<!-- Category -->
				<h6 class="mt-4">카테고리 : [${board.roomBoardType}]</h6>
				
				<!-- Title -->
				<h3 class="mt-4">${board.roomBoardTitle}</h3>
	
				<hr>

				<!-- Writer -->
				<div class="lead">
					작성자 : ${board.roomBoardWriter}<br>
				 	<span class="float-right">조회수 : ${board.roomBoardReadCount}</span>
					<div id="date-area">
						<p>작성일 : ${board.roomBoardCreateDate}</p>
						<p>마지막 수정일 :${board.roomBoardModifyDate} </p>  
					</div>
					
					<!-- 추천 기능 -->
					<div>
						<div class="w3-border w3-center w3-padding">
							<br>
							<c:if test="${ loginMember == null }">
								<i class="fa fa-heart" style="font-size:16px;cursor: pointer;"></i>
								<span class="rec_count"></span>	
								<br>
								<h6>추천 기능은 로그인 후 사용 가능합니다.</h6>	
							</c:if>
							<c:if test="${ loginMember != null }">
								<i class="fa fa-heart" id="rec_update" style="font-size:16px;cursor: pointer;"></i>
								&nbsp;<span class="rec_count"></span>
							</c:if>
						</div>
					</div>
					
				</div>

				<hr>

				
				<!-- 이미지 부분 -->
				<c:if test="${!empty files }">

                    <div class="carousel slide m-3" id="carousel-325626">

                        <div class="carousel-inner boardImgArea">


                            <c:forEach var="at" items="${files}" varStatus="vs">
                                <c:set var="src" value="${contextPath}${at.filePath}/${at.fileChangeName}"/>

                                <div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
                                    <img class="d-block w-100 boardImg" src="${src}" />
                                    <input type="hidden" value="${at.fileNo}">
                                </div>
                            </c:forEach>

                        </div> 


                        <a class="carousel-control-prev" href="#carousel-325626" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-325626" data-slide="next">
                        <span class="carousel-control-next-icon"></span> 
                        <span class="sr-only">Next</span></a>
                    </div>
                </c:if>


				<!-- Content -->
				<div id="board-content">
					<% pageContext.setAttribute("newLine", "\n");%>
					${fn:replace(board.roomBoardContent, newLine, "<br>") }
				</div>

				<hr>
				
				<div>
					<div class="float-right">
						<a class="btn btn-primary" 
							<%-- href="${listUrl}">목록으로</a> --%>
							href="${contextPath}/room/roomDetail/${board.roomNo}">목록으로</a>
				<%-- 	<a class="btn btn-primary" 
							href="<c:url value="../list/${board.boardType}">
								<c:param name="cp" value="${param.cp}" />							
							</c:url>">목록으로</a> --%>
							<!-- 상세조회 주소 예시 : board/1/500?cp=1 -->
							<!-- 목록으로 주소 예시 : board/list/1?cp=1 -->
							
							
	                	
	                	<!-- 글 작성자와 로그인한 회원이 같을 경우 -->
	                	<c:if test="${board.roomBoardWriter == sessionScope.loginMember.memberId}">
	                		<c:url var="updateUrl" value="${board.roomBoardNo}/update">
	                			<c:param name="cp" value="${param.cp}"/>
	                		</c:url>
							<a href="${updateUrl}" class="btn btn-primary ml-1 mr-1">수정</a>
							<button id="deleteBtn" class="btn btn-primary">삭제</button> 
						</c:if>
						
						<c:if test="${ loginMember != null }">
							<button id="reportBtn" class="btn btn-outline-danger">신고하기</button> 
						</c:if>
					</div>
				</div>
			</div>

			<hr>
			
			<jsp:include page="roomBoardReply.jsp"/>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function(){
			 recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
			 <c:if test="${ loginMember != null }">
				 boardLikeUserChk();  
			 </c:if>
		});
		
		$("#deleteBtn").on("click", function() {
			if(confirm("정말 삭제 하시겠습니까?")) {
				location.href = "${board.roomBoardNo}/delete";
			}
		});
		
		$("#reportBtn").on("click", function() {
			if(confirm("게시글 작성자를 정말 신고 하시겠습니까?")) {
				location.href = "${board.roomBoardNo}/report";
			}
		});
		
		// 추천버튼 클릭시(추천 추가 또는 추천 제거)
		$("#rec_update").click(function(){
			$.ajax({
				url: "${contextPath}/roomBoard/boardLike",
                type: "POST",
                data: {
                	roomBoardNo: '${board.roomBoardNo}',
                	memberNo: '${sessionScope.loginMember.memberNo}'
                },
                success: function (result) {
                	if(result > 0) {
                		$(".fa-heart").css("color", "black");
                	} else {
                		$(".fa-heart").css("color", "red");
                	}
                	
			        recCount();
                }, error : function() {
                	console.log("AJAX 통신 에러");
                }
			});
		});
		
		// 게시글 추천수
	    function recCount() {
			$.ajax({
				url: "${contextPath}/roomBoard/boardLikeCount",
                type: "POST",
                data: {
                	roomBoardNo: '${board.roomBoardNo}'
                },
                success: function (count) {
                	$(".rec_count").html(count);
                }, error : function() {
                	console.log("AJAX 통신 에러");
                }
			});
	    };
	    
		// 사용자 좋아요 여부 체크
	    function boardLikeUserChk() {
			$.ajax({
				url: "${contextPath}/roomBoard/boardLikeUserChk",
                type: "POST",
                data: {
                	roomBoardNo: '${board.roomBoardNo}',
                	memberNo: '${sessionScope.loginMember.memberNo}'
                },
                success: function (result) {
                	if(result > 0) {
                		$(".fa-heart").css("color", "red");
                	} else {
                		$(".fa-heart").css("color", "black");
                	}
                }, error : function() {
                	console.log("AJAX 통신 에러");
                }
			});
	    };
	   
		
	</script>
</body>
</html>
