<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
      padding : 10px 10px;
      }
      
      *{
      	text-decoration: none;
      }
</style>
</head>
<body>   

  <jsp:include page="../common/header.jsp" />
  
  <div>
  <jsp:include page="mypage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="mypage2.jsp"/>
	<div class="content2">       
	<div>
		<c:choose>
          	<c:when test="${empty report}">
          		<p>신고된 사항이 없습니다.</p>
          	</c:when>
          	<c:otherwise>
          	<p>
				<a href="${contextPath}/mypage/reportView/${report.boardNo}">${report.boardNo}번 게시글</a>이 신고되었습니다. 
				<br>현재 신고된 수는 ${report.reportCount} 입니다. 
				앞으로 ${3-report.reportCount}번 더 신고 받으면 사이트 이용이 불가합니다.
			</p>
          	</c:otherwise>
        </c:choose>	
	</div>
	   	
	</div>
 </div>    
   <jsp:include page="../common/footer.jsp" />

<script>

</script>
</body>
</html>