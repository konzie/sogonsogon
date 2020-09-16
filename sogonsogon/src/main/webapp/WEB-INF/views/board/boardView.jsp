<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
    #back-color{
        width: 100%;
        height: 100%;
        background-color:#ff9d38;}
    #wrapper{   margin:auto; 
                width: 880px;}          
    .detailView{
        width: 880px;
        height: 610px;
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
    			padding:12px 20px;
    			}
    .detail-info dl{float:left;}			
    .detail-info dt{float:left; display:inline-block; padding-right:10px;}			
    .detail-info dd{padding-right:30px; float:left;}	
    		
    .content{height : 69%; border-bottom: 1px solid #c2c2c2; padding:20px;}
    .detail-footer{height:10%; padding:13px;}
    
    #updateBtn{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:left; font-size:13px; 
    			color:#007bff; border-radius:3px;
    			background-color:#fff; padding:6px 14px;
    			margin-right:10px;
    			}
    #updateBtn:hover{border:1px solid #007bff;}
    
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
    			background-color:#fff; padding:6px 14px;}
    #listBtn:hover{border:1px solid #4d4d4d; }

</style>
</head>
<body id="back-color">
	<jsp:include page="../common/header.jsp"/>
        <div id="wrapper">
            <div class="view-header">
	            <h4><b>고객센터</b></h4>
	            <h6>- ${board.qnaCategory}</h6>
            </div>
            <div class="detailView">
            	<div class="detail-header">
            		<h4 class="detail-title" style="margin-bottom: 0;" >${help.helpTitle}</h4>
            		<span id="date" style="color:#4a4a4a;">${help.helpCreateDate}</span>
            	</div>
            	<div class="detail-info">
            		<dl>
            			<dt>작성자</dt> <dd>${help.helpWriter}</dd>
            		</dl>
            		<dl>
            			<dt>수정일</dt> <dd>${help.helpModifyDate}</dd>
            		</dl>
            			
            	</div>
            	<div class="content">${board.qnaContent}</div>
            	<div class="detail-footer">
            		<c:if test="${loginMember.memberNick == board.qnaWriter}">
            		<div class="update-Btn"><a id="updateBtn" type="button" href="${contextPath}/help/list">수정</a></div>
            		<div class="delete-Btn"><a id="deleteBtn" type="button" href="${contextPath}/help/list">삭제</a></div>
            		
                    <div class="list-Btn"><a id="listBtn" type="button" href="${contextPath}/help/list">목록</a></div>
                	</c:if>
            	</div>
            </div>
        </div>
               <!-- 댓글영역  -->
	 <jsp:include page="reply.jsp"/>
        
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	$("#deleteBtn").on("click",function(){
		if(confirm("정말 삭제 하시겠습니까?")){
			//spring/board/1/515/delete
			location.href = "${board.qnaNo}/delete";
		}
		
	});
		
		
	</script>
</body>
</html>
