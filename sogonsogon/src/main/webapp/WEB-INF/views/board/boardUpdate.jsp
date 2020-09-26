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
        <h2 class="text-center">질문글 쓰기</h2>
        <form action="${contextPath}/board/updateAction/${board.qnaNo}"
        enctype="multipart/form-data" role="form" onsubmit="return validate();">
          <table class="table table-striped">

					<label class="input-group-addon mr-3 insert-label">카테고리</label> 
					<select	class="custom-select" id="category" name="qnaCategory" style="width: 150px;">
					
						<option value="10">코딩</option>
						<option value="20">외국어</option>
						<option value="30">기타</option>
						<option value="40">공지글</option>
					</select>

			
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" id ="title" name="qnaTitle" value="${board.qnaTitle}"></td>
            </tr>
            
            
            <tr>
                <td>글내용</td>
                <td>
                  <!------------------ Summernote ------------------>
	
						<textarea class="form-control" id="summernote" name="qnaContent">${board.qnaContent}</textarea>
			
					<!------------------------------------------------>	
               </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-center">
                    <button type="submit" class="btn btn-success">수정</button>
                     <a href="${header.referer}" class="btn btn-primary">돌아가기</a>
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>
 </div>
 
<%@ include file="../common/footer.jsp" %>
 


 
<script>

$.each($("#category>option"), function(index, item){
    if($(item).text() == "${board.qnaCategory}"){
       $(item).prop("selected","true");
    }
 });
 

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
}
 

</script>
