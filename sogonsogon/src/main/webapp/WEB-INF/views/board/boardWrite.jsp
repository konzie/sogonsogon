<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	String cp = request.getParameter("cp");
%>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  

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
        <form action="<%=request.getContextPath()%>/board/insert.do?type=<%=type%>&cp=<%=cp%>"
        enctype="multipart/form-data"    role="form" method="post" onsubmit="return validate();">
          <table class="table table-striped">
          
					<label class="input-group-addon mr-3 insert-label">말머리</label> 
					<select	class="custom-select" id="category" name="category" style="width: 150px;">
						<option>선택</option>
						<option value="사이트이용">코딩</option>
						<option value="시스템">외국어</option>
						<option value="기타">공시</option>
					</select>
			
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" id ="title" name="title"></td>
            </tr>
            
            
            <tr>
                <td>글내용</td>
                <td><textarea rows="10" cols="50" id="content" name="content" class="form-control"></textarea></td>
            </tr>
             <tr>
            	<td>이미지 삽입</td>
            	<td>
            	<div id="fileArea">
					<!--  multiple 속성
						- input 요소 하나에 둘 이상의 값을 입력할 수 있음을 명시 (파일 여러개 선택 가능)
					 -->
					<input type="file" id="img1" name="img1" onchange="LoadImg(this,1)"> 
					<input type="file" id="img2" name="img2" onchange="LoadImg(this,2)"> 
					<input type="file" id="img3" name="img3" onchange="LoadImg(this,3)"> 
					<input type="file" id="img4" name="img4" onchange="LoadImg(this,4)">
				</div>
            	
            	</td>

            </tr>

            <tr>
                 
                <td colspan="2"  class="text-center">
                    <input type="submit" value="확인" class="btn btn-success">
                    <input type="reset" value="초기화" class="btn btn-warning">
                    <a href="<%=request.getContextPath()%>/i_board/list.do?type=<%=type%>" class="btn btn-primary">돌아가기</a>
                </td>
            </tr>
             
          </table>
        </form>
    </div>
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
	if($("#link").val().trim().length == 0){
		alert("링크를 입력해 주세요");
		$("#link").focus();
		return false;
	}
}

$(function(){
	//$("#fileArea").hide();
	
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
	function LoadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				switch(num){
				case 1 :
					$("#contentImg1").attr("src", e.target.result);
					break;
				case 2 :