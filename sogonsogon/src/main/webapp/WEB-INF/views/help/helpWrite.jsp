<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String cp = request.getParameter("cp");%>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>    
    
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
    .lock_status{float:right; padding:10px 0 0;}
    
    .text-center{margin-top:20px;}
    
     .btncss {
       width:80px;
       background-color: #ffc107;
       border: none;
       color:#fff;
       padding: 8px 0;
       text-align: center;
       text-decoration: none;
       display: inline-block;
       font-size: 15px;
       margin: 5px !important;
       cursor: pointer;
       border-radius: 20px !important;
       font-size: 18px !important;
       font-weight: bold;
}

 .btncss:hover{
    background-color: #e86c00;
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
        <h2 class="text-center">문의글 쓰기</h2>
        <form action="insertAction"
        enctype="multipart/form-data" role="form" method="post" onsubmit="return validate();">
          <table class="table table-striped">

					<label class="input-group-addon mr-3 insert-label">카테고리</label> 
					<select	class="custom-select" id="category" name="helpCategory" style="width: 150px;">
						<option value="00">선택</option>
						<option value="10">사이트 이용</option>
						<option value="20">시스템</option>
						<option value="30">기타</option>
					</select>
					<input type="hidden" id="categoryNo" value="00">

				<!--  <div class="lock_status">
					<label>공개</label>&nbsp;
					<input type="radio" name="lockStatus" value="N" checked>
					<label>비공개</label>&nbsp;
					<input type="radio" name="lockStatus" value="Y">
				</div>-->
				<div class="lock_status">
				<label>비공개</label>&nbsp;
				<input type="checkbox" id="lockYN">
				<input type="hidden" value="N" id="lockStatus" name="lockStatus">
				</div>
				
			
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" id ="title" name="helpTitle"></td>
            </tr>
            
            
            <tr>
                <td>글내용</td>
                <td><textarea rows="10" cols="50" id="content" name="helpContent" class="form-control"></textarea></td>
            </tr>
             <!--  <tr>
            	<td>이미지 삽입</td>
            	<td>
            	<div id="fileArea">
					<!--  multiple 속성
						- input 요소 하나에 둘 이상의 값을 입력할 수 있음을 명시 (파일 여러개 선택 가능)
					 -->
					<!-- <input type="file" id="img1" name="img1" onchange="LoadImg(this,1)"> 
					<input type="file" id="img2" name="img2" onchange="LoadImg(this,2)"> 
					<input type="file" id="img3" name="img3" onchange="LoadImg(this,3)"> 
					<input type="file" id="img4" name="img4" onchange="LoadImg(this,4)">
				</div>
            	
            	</td>

            </tr>-->

            <tr>
                 
                <td colspan="2"  class="text-center">
                    <button type="submit" class="btncss">등록</button>
                    <input type="reset" value="초기화" class="btncss">
                    <a href="${contextPath}/help/list/1" class="btncss" style="width: 100px; text-decoration: none; color: white;">돌아가기</a>
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
}


	$("#lockYN").change(function(){
        if($("#lockYN").is(":checked")){
        	$("#lockStatus").attr("value", "Y");
        }else{
        	$("#lockStatus").attr("value", "N");
        }
    });
	
    
</script>    