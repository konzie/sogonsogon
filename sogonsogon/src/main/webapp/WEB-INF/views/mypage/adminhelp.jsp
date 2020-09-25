<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>고객센터</title>
        
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
      
      .pagination {
      	justify-content: center;
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
      <h4 class="mb-5">고객센터</h4>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th id="boardNo">글번호</th>
                        <th id="category">분류</th>
                        <th id="title">제목</th>
                        <th id="title">내용</th>
                        <th id="writer">작성자</th>						
                        <th id="create_dt">작성일</th>						
                        <th id="lockStatus">답변여부</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty helpList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${helpList}">
	              		<tr>		
	              			<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${board.helpCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${board.helpCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today == createDate}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span>${board.helpNo}</span>
	              			<c:if test="${board.lockStatus=='Y'}">
	              				<img src="${contextPath}/resources/images/lock2.png" width="30px" height="30px">
	              			</c:if>
		              		</td>
		              		<td>${board.helpCategory}</td>
		              		<td>${board.helpTitle}</td>
		              		<td>${board.helpContent}</td>
		              		<td>${board.writerNick}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today == createDate }">${createTime}</c:when>
		              				<c:otherwise>${createDate}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${board.answerChk=='N'}"><button type="button" class="btn btn-warning btn-sm" onclick="location.href='answerView/${board.helpNo}'">답변하기</button></c:when>
		              				<c:otherwise><button type="button" class="btn btn-secondary btn-sm answerEnd">답변완료</button></c:otherwise>
		              			</c:choose>
		              		</td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
            
            <div class="my-4">
            <ul class="pagination">
               <c:if test="${pInfo.currentPage  > pInfo.pagingBarSize}">   
                   <li>
                   	<a class="page-link text-primary" href="?cp=1">&lt;&lt;</a>
                   </li>
                   <li>
                      <fmt:parseNumber var="operand1" value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}" integerOnly="true" />
                      <c:set var="prev" value="${operand1 * 10 }" />
                      <a class="page-link text-primary" href="?cp=${prev}">&lt;</a>
                   </li>
                </c:if>
                
                <!-- 10개의 페이지 목록 -->
                <c:forEach var="p" begin="${pInfo.startPage}" end="${pInfo.endPage}">
                   <c:choose>
                      <c:when test="${p==pInfo.currentPage}">
                         <li><a class="page-link">${p}</a></li>
                      </c:when>
                      <c:otherwise>
                         <li>
                        <%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${p}">${p}</a> --%>
                            <a class="page-link text-primary" href="?cp=${p}">${p}</a>
                         </li>
                      </c:otherwise>
                   </c:choose>
                </c:forEach>
                
                
                 <!-- 다음 페이지로(>) -->
                <!-- next 생성 식:(현재페이지+9)/10*10+1 -->
                <c:if test="${pInfo.maxPage>pInfo.endPage}">
                <!-- 다음페이지(>) -->
                   <li>
                   <fmt:parseNumber var="operand2" value="${(pInfo.currentPage+9)/10}" integerOnly="true"/>
                   <c:set var="next" value="${operand2*10+1}"/>
                     <a class="page-link text-primary" href="?cp=${next}">&gt;</a>
                   </li>
                   
                   <!-- 맨 끝으로(>>) -->
                   <li>
                       <a class="page-link text-primary" href="?cp=${pInfo.maxPage}">&gt;&gt;</a>
                   </li>
                </c:if>
            </ul>
        </div> 
        </div>
    </div>    
   
   <jsp:include page="../common/footer.jsp" />
    
    <script>

    $(".new").parent().parent().css("background-color","bisque");

    $("td:not(:last-child)").on("click",function(){
    	if($(this).parent().children().children().eq(0).text()=="new"){
    		var boardNo = $(this).parent().children().children().eq(1).text(); 				
    	}else{
    		var boardNo = $(this).parent().children().children().eq(0).text(); 	
    	}
    	location.href = "${contextPath}/mypage/helpView/"+boardNo;
    }).on("mouseenter", function(){
    	$(this).css("cursor", "pointer");
    });

    $(".answerEnd").attr("disabled",true);
    </script>
    </body>
</html>