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
        background-color:#F0EDEB;}
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
    			background-color:#fff; padding:6px 14px;
    			margin-right:10px;}
    #listBtn:hover{border:1px solid #4d4d4d; }
    
    #answerBtn{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:right; font-size:13px; 
    			color:#ff7600; border-radius:2px;
    			background-color:#fff; padding:6px 14px;}
    #answerBtn:hover{border:1px solid #ff7600; background-color:#fff6ed;}
    

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

         <c:if test="${empty help}">
			<script type="text/javascript">
					$(document).ready(function() {
					alert("비공개 게시물입니다.");
					
					history.back();
					//location.href = "list/1";
				});
			</script>
		</c:if>

<body id="back-color">
	
	<jsp:include page="../common/header.jsp"/>
        <div id="wrapper">
       
            <div class="view-header">
	            <h4><b>고객센터</b></h4>
	            <h6>- ${help.helpCategory}</h6>
            </div>
            <div class="detailView">
            	<div class="detail-header">
            		<h4 class="detail-title" style="margin-bottom: 0;" >
            		<c:if test="${help.lockStatus == 'Y'}">
                     	<img src="${contextPath}/resources/images/lock2.png">
               		</c:if> 
            		${help.helpTitle}</h4>
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
            	<div class="content">${help.helpContent}</div>
            	<div class="detail-footer">
            		<c:if test="${loginMember.memberNick == help.helpWriter}">
            		<div class="update-Btn"><a id="updateBtn" type="button">수정</a></div>
            		<div class="delete-Btn"><a id="deleteBtn" type="button">삭제</a></div>
            		
                    <div class="list-Btn"><a id="listBtn" type="button" href="${contextPath}/help/list/1">목록</a></div>
	
                	</c:if>
                	
                	<c:if test="${loginMember.memberGrade == 'A'}">
            		<div class="update-Btn"><a id="updateBtn" type="button">수정</a></div>
            		<div class="delete-Btn"><a id="deleteBtn" type="button">삭제</a></div>
            		
            		<div class="answer-Btn"><a id="answerBtn" type="button" href="${contextPath}/help/answerwrite">답변 작성</a></div>
                    <div class="list-Btn"><a id="listBtn" type="button" href="${contextPath}/help/list/1">목록</a></div>
	
                	</c:if>
            	</div>
            </div>
        </div>
	<jsp:include page="../common/footer.jsp"/>
	
	
	<script>
	
	$("#deleteBtn").on("click",function(){
		if(confirm("정말 삭제 하시겠습니까?")){
			//spring/help/no=185/delete
			location.href = "no=${help.helpNo}/delete";
		}
	
	});
	
	$("#updateBtn").on("click",function(){
		if(confirm("문의글을 수정하시겠습니까?")){
			location.href = "no=${help.helpNo}/update";
		}
	});		
	
	</script>
</body>
</html>
