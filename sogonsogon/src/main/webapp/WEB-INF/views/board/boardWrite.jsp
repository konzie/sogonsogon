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
<!------------------ Summernote ------------------>
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
<!------------------------------------------------>

</head>
<body>
 
 <%@ include file="../common/header.jsp" %>
	<!------------------ Summernote ------------------>
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote.js"></script>
	<!------------------------------------------------>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
       
        <form action="insertAction" method="post" role="form" enctype="multipart/form-data" onsubmit="return validate();">
        
          
					<label class="input-group-addon mr-3 insert-label">말머리</label> 
					<select	class="custom-select" id="category" name="qnaCategory" style="width: 150px;">
						<option value="00">선택</option>
						<option value="10">코딩</option>
						<option value="20">외국어</option>
						<option value="30">기타</option>
						<option value="40">공지글</option>
					</select>
			
          <table class="table table-striped">
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" id ="title" name="qnaTitle"></td>
            </tr>
            
            
            <tr>
                <td>글내용</td>
                <td><!--  <textarea rows="10" cols="50" id="content" name="qnaContent" class="form-control"></textarea>-->
                <!------------------ Summernote ------------------>
	
						<textarea class="form-control" id="summernote" name="qnaContent"></textarea>
			
					<!------------------------------------------------>	
                
                </td>
            </tr>
          <!--   <tr>
             
             
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
 --> 
            <tr>
                 
                <td colspan="2"  class="text-center">
                
				<div class="text-center">
					<button type="submit"  class="btn btn-success">등록</button>
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
	if($("#category").val() == "00"){
		alert("카테고리를 입력해주세요.");
		return false;
	}
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

    var content = $("#content").val();
    var ban = ["개" , "미친놈" , "ㅅㅂ" ];
    
    for (var i=0; i<ban.length; i++){
       if(content.indexOf(ban[i]) != -1){
          alert("욕설을 포함한 게시글은 등록되지 않습니다.");
          $("#content").val("");
          return false;
       }
    } 

	
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