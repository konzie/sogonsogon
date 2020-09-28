<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
    #back-color{
        width: 100%;
        height: 100%;
        background-color:#ff9d38;}
    #wrapper{   margin:auto; 
                width: 880px;}          
    .detailView{
        width: 880px;
        height: 100%;
        border-radius: 8px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
        background-color: white;
        border: solid 1px #c2c2c2;
    }

    .view-header{
        padding:1.5rem 0 0;
        margin-bottom: 1rem;
        color:white;
    }
    
    .detail-header{
    				height:13%; 
    				border-bottom: 1px solid #c2c2c2;
    				padding:15px 20px 10px;
    				}
    #date{font-size:15px;}				
    .detail-info{
    			height : 8%; 
    			border-bottom: 1px solid #c2c2c2;
    			padding:12px 20px 30px 20px;
    			}
    .detail-info dl{float:left;}			
    .detail-info dt{float:left; display:inline-block; padding-right:10px;}			
    .detail-info dd{padding-right:30px; float:left;}	
    		
    .content{height : 79%; border-bottom: 1px solid #c2c2c2; padding:20px;}
   
    
    #updateBtn{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:left; font-size:13px; 
    			color:#007bff; border-radius:3px;
    			background-color:#fff; padding:6px 14px;
    			margin-right:10px;
    			}
    #updateBtn:hover{border:1px solid #007bff;}
    
    .update-Btn, .delete-Btn {  
    
    height: 30px;
    /* float: left; */
    display: inline-block;
    
    }
    
    
    #deleteBtn{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			font-size:13px; 
    			color:#ff4d32; border-radius:3px; float:left;
    			background-color:#fff; padding:6px 14px;}
    #deleteBtn:hover{border:1px solid #ff4d32;}
    
    #listBtn{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:right; font-size:13px; 
    			color:black; border-radius:3px;
    			background-color:#fff; padding:6px 14px;
    			display : block;}
    #listBtn:hover{border:1px solid #4d4d4d; }
    
    #likeBtn{
    	padding:6px 14px;
    }

	.list-Btn{
		height:10px;
		padding: 20px;
	}
	
	#reportBtn{
	  float: right;
	  
	  
	}
	
	
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
	

</style>
</head>
<body id="back-color">
	<jsp:include page="../common/header.jsp"/>
        <div id="wrapper">
            <div class="view-header">
	            <h4><b>자유게시판</b></h4>
	            <h6>- ${board.qnaCategory}</h6>
            </div>
            <div class="detailView">
            	<div class="detail-header">
            		<h4 class="detail-title" style="margin-bottom: 0;" >${board.qnaTitle}</h4>
            		<span id="date" style="color:#4a4a4a;">${board.qnaCreateDate}</span>
            	</div>
            	<div class="detail-info">
            		<dl>
            			<dt>작성자</dt> <dd>${board.writerNick}</dd>
            		</dl>
            		<dl>
            			<dt>수정일</dt> <dd>${board.qnaModifyDate}</dd>
            		</dl>
            			
            	</div>
				<c:if test="${!empty files }">

                    <div class="carousel slide m-3" id="carousel-325626">

                        <div class="carousel-inner boardImgArea">

		
                            <c:forEach var="at" items="${files}" varStatus="vs">
                                <c:set var="src" value="${contextPath}${at.filePath}/${at.fileChangeName}"/>

                                <div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
                                    <img class="d-block w-100 boardImg" src="${src}"  />
                                    <input type="hidden" value="${at.fileNo}">
                                </div>
                            </c:forEach>

                        </div> 


                        <a class="carousel-control-prev" href="#carousel-325626" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-325626" data-slide="next">
                        <span class="carousel-control-next-icon"></span> 
                        <span class="sr-only">Next</span></a>
                    </div>
                </c:if>
             
            	
            	
            	<div class="content">${board.qnaContent}
            	<hr>
            		<c:if test="${loginMember.memberNo == board.qnaWriter}">
	            		<div class="update-Btn"><a id="updateBtn" type="button" href="${contextPath}/board/${board.qnaNo}/update">수정</a></div>
	            		<div class="delete-Btn"><a id="deleteBtn" type="button" href="${contextPath}/board/${board.qnaNo}/delete">삭제</a></div>
	            		
<%-- 	                    <div class="list-Btn"><a id="listBtn" type="button" href="${contextPath}/board/boardList">목록</a></div>
 --%>                	</c:if>
                	<c:if test="${loginMember.memberNo != board.qnaWriter}">
	                	<!-- 추천 기능 -->
						<div>
							<div class="w3-border w3-center w3-padding">
								<c:if test="${ loginMember == null }">
									<i class="fa fa-heart" style="font-size:16px;cursor: pointer;" id="likeBtn"></i>
									<span class="rec_count"></span>	
									<h6>추천 기능은 로그인 후 사용 가능합니다.</h6>	
							
								</c:if>
								<c:if test="${ loginMember != null }">
									<i class="fa fa-heart" id="rec_update" style="font-size:16px;cursor: pointer;"></i>
									&nbsp;<span class="rec_count"></span>
								</c:if>
								<c:if test="${loginMember != null }">
								<button id="reportBtn" class="btn btn-outline-danger">신고</button>
								</c:if>
							</div>
						</div>
					
                	</c:if>
                	
             <!-- 댓글영역  -->
	 <jsp:include page="reply.jsp"/>
            	</div>
            	
            </div>
			<div class="list-Btn"><a id="listBtn" type="button" href="${contextPath}/board/boardList">목록</a></div>
        </div>
              
        
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	$("#deleteBtn").on("click",function(){
		if(confirm("정말 삭제 하시겠습니까?")){
			//spring/board/1/515/delete
			location.href = "${board.qnaNo}/delete";
		}
		
	});


		$(function(){
			 recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
			 <c:if test="${ loginMember != null }">
				 qnaLikeUserChk();
			 </c:if>
		});
		
		
		// 추천버튼 클릭시(추천 추가 또는 추천 제거)
		$("#rec_update").click(function(){
			
			$.ajax({
				url: "${contextPath}/board/qnaBoardLike",
	            type: "POST",
	            data: {
	            	qnaNo: '${board.qnaNo}',
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
				url: "${contextPath}/board/qnaLikeCount",
	            type: "POST",
	            data: {
	            	qnaNo: '${board.qnaNo}'
	            },
	            success: function (count) {
	            	$(".rec_count").html(count);
	            }, error : function() {
	            	console.log("AJAX 통신 에러");
	            }
			});
	    };
	    
		// 사용자 좋아요 여부 체크
	    function qnaLikeUserChk() {
			$.ajax({
				url: "${contextPath}/board/qnaLikeUserChk",
	            type: "POST",
	            data: {
	            	qnaNo: '${board.qnaNo}',
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
	   
		
		$("#reportBtn").on("click", function() {
			if(confirm("게시글 작성자를 정말 신고 하시겠습니까?")) {
				location.href = "${contextPath}/board/${board.qnaNo}/report";
			}
		});
		
		
	</script>
</body>
</html>
