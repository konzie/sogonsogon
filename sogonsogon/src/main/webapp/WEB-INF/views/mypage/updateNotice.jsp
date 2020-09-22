<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
      
      #deleteInfo{
      text-decoration: none;
      }
      
      #id{
      style:none;
      }
      
      #content{
      	width : 100%;
      	height : 300px;
      }
      
      .btn{
      	margin:10px 0;
      }
</style>
</head>
<body>

  <jsp:include page="../common/header.jsp" />
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
  <c:choose>
  <c:when test="${member.memberGrade=='G'}">
	   <h4 class="mb-5">내가 쓴 게시글 수정</h4>
  </c:when>
  <c:otherwise>
	   <h4 class="mb-5">공지사항 수정</h4>
  </c:otherwise>
  </c:choose>
	    <form action="${contextPath}/mypage/updateNotice2/${notice.qnaNo}" method="post" role="form" onsubmit="return validate();">
				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">제목</label> 
					<select name="category">
						<option>코딩</option>
						<option>외국어</option>
						<option>기타</option>
					</select>
				</div>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">제목</label> 
					<input type="text" class="form-control" id="title" name="title" size="100" value="${notice.qnaTitle}">
				</div>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성자</label>
					<h5 class="my-0" id="writer">${loginMember.memberNick}</h5>
				</div>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성일</label>
					<h5 class="my-0" id="today"></h5>
				</div>

				<div>
					<label for="content">내용</label>
					<input id="content" name="content" value="${notice.qnaContent}"></input>
				</div>
				
				<hr class="mb-4">

				<div class="text-center">
					<button type="submit" class="btn btn-warning">등록</button>
					<c:choose>
  					<c:when test="${member.memberGrade=='G'}">
					<button type="button" class="btn btn-warning" onclick="location.href='${contextPath}/mypage/myboard'">목록으로</button>
					</c:when>
					<c:otherwise>
					<button type="button" class="btn btn-warning" onclick="location.href='${contextPath}/mypage/adminnotice'">목록으로</button>
					</c:otherwise>
					</c:choose>
				
				</div>
			</form>
	</div>
	   <jsp:include page="../common/footer.jsp" />

	<script>
		// 오늘 날짜 출력 
		var today = new Date();
		var month = (today.getMonth()+1);

		var str = today.getFullYear() + "-"
				+ (month < 10 ? "0"+month : month) + "-"
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