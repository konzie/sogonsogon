<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>신고 게시판</title>
        
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
</style>
</head>
<body>

  <jsp:include page="../common/header.jsp" />
  
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
	<div class="content2">       
      <h4 class="mb-5">신고 게시판</h4>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th id="boardNo">글번호</th>
                        <th id="category">분류</th>
                        <th id="title">제목</th>
                        <th id="writer">작성자</th>						
                        <th id="create_dt">작성일</th>						
                        <th id="status">답변/미답변</th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty boardList}">
		         		<tr>		
		         			<td colspan="6" align="center">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${boardList}">
	              		<tr>		
		              		<td>${board.boardNo}</td>
		              		<td>${board.boardCategory}</td>
		              		<td>${board.boardTitle}</td>
		              		<td>${board.boardWriter}</td>
		              		<td>
		              			<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
		              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
		              			<fmt:formatDate var="createDate" value="${board.boardCreateDate}" pattern="yyyy-MM-dd"/>
		              			<fmt:formatDate var="createTime" value="${board.boardCreateDate}" pattern="hh:mm:ss"/>
		              			
		              			<c:choose>
		              				<c:when test="${today == createDate }">
		              					${createTime}
		              				</c:when>
		              				<c:otherwise>
		              				${createDate}
		              				</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>${board.boardStatus}</td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
            
            <div class="page" align="center">
                <ul class="pagination">
                    <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                    <li class="page-item active"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">6</a></li>
                    <li class="page-item"><a href="#" class="page-link">7</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>    
   
   <jsp:include page="../common/footer.jsp" />
    
    </body>
</html>