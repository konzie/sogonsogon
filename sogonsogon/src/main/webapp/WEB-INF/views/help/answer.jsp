<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String cp = request.getParameter("cp");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
    #back-color2{
        width: 100%;
        height: 100%;
        background-color:#F0EDEB;}
    #wrapper2{   margin:auto; 
                width: 880px;
                padding-bottom: 25px;}          
    .detailView2{
        width: 880px;
        height: 500px;
        border-radius: 8px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
        background-color: white;
        border: solid 1px #c2c2c2;
    }

    .view-header2{
        padding:1rem 0 0;
        margin-bottom: 1rem;
        color:black;
        
    }
    
    .page-title2:after{
    	display: block;
	    width: 7%;
	    height: 17px;
	    border-radius: .5rem;
	    background: #ffc107;
	    content: '';
	    margin-top: -16px;
    }
    

    #date2{font-size:15px;}				
    .detail-info2{
    			height : 9%; 
    			border-bottom: 1px solid #c2c2c2;
    			padding:12px 20px;
    			}
    .detail-info2 dl{float:left;}			
    .detail-info2 dt{float:left; display:inline-block; padding-right:10px;}			
    .detail-info2 dd{padding-right:30px; float:left;}	
    		
    .content2{height : 79%; border-bottom: 1px solid #c2c2c2; padding:20px;}
    .detail-footer2{height:12%; padding:13px;}
    
    #updateBtn2{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:left; font-size:13px; 
    			color:#007bff; border-radius:3px;
    			background-color:#fff; padding:6px 14px;
    			margin-right:10px;
    			}
    #updateBtn2:hover{border:1px solid #007bff;}
    
    #deleteBtn2{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			font-size:13px; 
    			color:#ff4d32; border-radius:3px; float:left;
    			background-color:#fff; padding:6px 14px;}
    #deleteBtn2:hover{border:1px solid #ff4d32;}
    
    
    
    #listBtn2{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:right; font-size:13px; 
    			color:black; border-radius:3px;
    			background-color:#fff; padding:6px 14px;
    			margin-right:10px;}
    #listBtn2:hover{border:1px solid #4d4d4d; }
    
    #answerBtn2{	
    			text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:right; font-size:13px; 
    			color:#ff7600; border-radius:2px;
    			background-color:#fff; padding:6px 14px; margin-right:10px;}
    #answerBtn2:hover{border:1px solid #ff7600; background-color:#fff6ed;}
    

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

<body id="back-color2">
        <div id="wrapper2">
       
            <div class="view-header2">
	            <h3 class="page-title2"><b>답변</b></h3>
            </div>
            <div class="detailView2">
            	<div class="detail-info2">
            		<dl>
            			<dt>작성자</dt> <dd>${help.helpWriter}</dd>
            		</dl>
            		<dl>
            			<dt>등록일</dt> <dd>${help.helpCreateDate}</dd>
            		</dl>
            		<dl>
            			<dt>수정일</dt> <dd>${help.helpModifyDate}</dd>
            		</dl>
            			
            	</div>
            	<div class="content2">${help.helpContent}</div>
            	<div class="detail-footer2">
                	
                	<c:if test="${loginMember.memberGrade == 'A'}">
                		<c:url var="updateUrl" value="no=${help.helpNo}/update">
	                		<c:param name="cp" value="${param.cp}"/>
	                	</c:url>
            		
            		<div class="answer-Btn2"><a id="answerBtn2" type="button" href="${contextPath}/help/answerwrite">답변 수정</a></div>

	
                	</c:if>
            	</div>
            </div>
        </div>
	
	
	<script>
	
	if(${help.answerChk == 'Y'}){
		
		$(function(){
			selectAnswer();
		});
	}
	
	function selectAnswer(){
		var url = "${contextPath}/answer/selectanswer/${help.helpNo}";
		console.log(url);
		$.ajax({
			url : url,
			type : "POST",
			dataType:"json",
			success:function(aList){
				console.log(aList);								
				
			}, error : function(request, status, error){
				 	console.log("ajax 통신 오류");
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        
			}
	
		});
	
	
	$("#deleteBtn").on("click",function(){
		if(confirm("정말 삭제 하시겠습니까?")){
			//spring/help/no=185/delete
			location.href = "no=${help.helpNo}/delete";
		}
	
	});
	
	$("#updateBtn").on("click",function(){
		if(confirm("문의글을 수정하시겠습니까?")){
		}
	});		
	
	}	
	
	</script>
</body>
</html>
