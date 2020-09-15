<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String type = request.getParameter("type");
	String cp = request.getParameter("cp");
%>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
    
<style>
 .insert-label {
      display: inline-block;
      width: 80px;
      line-height: 40px
    }
    
    .boardImg{
    	cursor : pointer;
    }
     #row{
	  margin-top: 50px; 
	  }
    
    
</style>

</head>
<body>
 
 <%@ include file="../common/header.jsp" %>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">질문하기</h2>
        <form action="insertAction" method="post" role="form" enctype="multipart/form-data" onsubmit="return validate();">
        
          
					<label class="input-group-addon mr-3 insert-label">말머리</label> 
					<select	class="custom-select" id="category" name="qnaCategory" style="width: 150px;">
						<option>선택</option>
						<option value="코딩">코딩</option>
						<option value="외국어">외국어</option>
						<option value="공시">공시</option>
					</select>
			
          <table class="table table-striped">
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" id ="title" name="qnaTitle"></td>
            </tr>
            
            
            <tr>
                <td>글내용</td>
                <td><textarea rows="10" cols="50" id="content" name="qnaContent" class="form-control"></textarea></td>
            </tr>
             <tr>
            	<td>이미지 삽입</td>
            	<td>
            	<div id="fileArea">
				
					<input type="file" id="img1" name="images" onchange="LoadImg(this,1)"> 
					<input type="file" id="img2" name="images" onchange="LoadImg(this,2)"> 
					<input type="file" id="img3" name="images" onchange="LoadImg(this,3)"> 
					<input type="file" id="img4" name="images" onchange="LoadImg(this,4)">
				</div>
            	
            	</td>

            </tr>

            <tr>
                 
                <td colspan="2"  class="text-center">
                
				<div class="text-center">
					<button type="submit" >등록</button>
                    <a href="${header.referer}" class="btn btn-primary">돌아가기</a>
                    </div>
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>
 


 
<script>


// 유효성검사
function validate(){
	if($("#title").val().trim().length == 0){
		alert("제목을 입력해 주세요.");
		$("#title").focus();
		return false;
	}
	if($("#content").val().trim().length == 0){
		alert("내용을 입력해 주세요");
		$("#content").focus();
		return false;
	}
	 /* if($("#link").val().trim().length == 0){
		alert("링크를 입력해 주세요");
		$("#link").focus();
		return false;
	}  */
}

$(function(){

	$("#contentImgArea1").click(function(){
		$("#img1").click();
	});
	$("#contentImgArea2").click(function(){
		$("#img2").click();
	});
	
	$("#contentImgArea3").click(function(){
		$("#img3").click();
	});
	$("#contentImgArea4").click(function(){
		$("#img4").click();
	});
	
});
	</script>