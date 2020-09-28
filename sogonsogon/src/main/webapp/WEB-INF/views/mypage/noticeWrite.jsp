<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
      .content{
      float:left;
      width:100%;
      height:100%;
      }
      
      .content2{
      float:left; 
      width:72%;
      height:100%;
      padding:20px 0px 0px 30px;
      }
      
      textarea{
      	padding:10px;
      }
      
      label{
      	margin:5px;
      }
      
      .today{
      	float: right;
      }
</style>
<!------------------ Summernote ------------------>
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
<!------------------------------------------------>
</head>
<body>

  <jsp:include page="../common/header.jsp" />
	<!------------------ Summernote ------------------>
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote.js"></script>
	<!------------------------------------------------>
  <c:choose>
  <c:when test="${member.memberGrade=='G'}">
	     <div>
  <jsp:include page="mypage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="mypage2.jsp"/>
  </c:when>
  <c:otherwise>
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
  </c:otherwise> 
  </c:choose>  
  <div class="content2">       
	   <h4 class="mb-5">공지사항 작성</h4>
	    <form action="${contextPath}/mypage/noticeInsert" method="post" role="form" onsubmit="return validate();">
				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">카테고리</label> 
				  <c:choose>
 				  <c:when test="${loginMember.memberGrade=='A'}">
					<h5 class="my-0" id="category">공지글</h5><input style="display: none;" name="category" value="공지글">
				  </c:when>
				  <c:otherwise>
				  <select name="category">
						<option value="코딩">코딩</option>
						<option value="외국어">외국어</option>
						<option value="기타">기타</option>
				  </select>
				  </c:otherwise>
				  </c:choose>
				
				
				</div>
				
				<div class="form-inline mb-2">
					<label>제목</label> 
					<textarea class="form-control" name="title" rows="1" cols="170" style="resize: none;" id="title"></textarea>
				</div>

				<div class="form-inline mb-2">
					<label>작성자</label>
					<h5 class="my-0" id="writer">${loginMember.memberNick}</h5>
				</div>
					
				<div class="form-inline mb-2">
					<label>작성일</label> <h5 class="my-0" id="today"></h5>
				</div>

				<div class="form-inline mb-2">
					<textarea class="form-control" id="content" name="content" rows="10" cols="200" style="resize: none;"></textarea>
				</div>
				
				<hr class="mb-4">

				<div class="text-center">
					<button type="submit" class="btn btn-warning">등록</button>
					<button type="button" class="btn btn-warning" onclick="location.href='adminnotice'">목록으로</button>
				</div>
			</form>
	</div>
	   <jsp:include page="../common/footer.jsp" />

	<script>
		// 오늘 날짜 출력 
		var today = new Date();
		var month = (today.getMonth()+1);

		var str = today.getFullYear() + "/"
				+ (month < 10 ? "0"+month : month) + "/"
				+ today.getDate();
		$("#today").html(str);

		// 유효성 검사 
		function validate() {
			if ($("#title").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#content").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
		}
		
		
	</script>
</body>
</html>