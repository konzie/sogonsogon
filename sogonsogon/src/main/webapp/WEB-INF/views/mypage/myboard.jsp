<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내가 쓴 게시글</title>
        
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
  <jsp:include page="mypage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="mypage2.jsp"/>
  <div class="content2">              
       <h4 class="mb-5">내가 쓴 게시글</h4>
       <table class="table table-striped table-hover myBoard">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>						
                        <th>작성일</th>						
                        <th>좋아요 수</th>

                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty boardList}">
		         		<tr>		
		         			<td colspan="7" align="center" onclick="event.cancelBubble=true" style="cursor: auto;">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${boardList}">
	              		<tr>
	              	    <jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${board.qnaCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${board.qnaCreateDate}" pattern="hh:mm:ss"/>
	              		<c:choose>		
	              		<c:when test="${board.qnaStatus=='R'}">
	              			<td>
	              			<span style="display:none;" class="status">${board.qnaStatus}</span>
		              		<c:if test="${today == createDate}">
	              				<span class="badge badge-primary new">new</span>
		              		</c:if>
		              		<span style="color: white">${board.qnaNo}</span>
		              		</td>
		              		<td style="color: white">신고</td>
		              		<td style="color: white">${board.qnaTitle}</td>
	              			<td colspan="4" align="center">
	              				<span style="color: white">----------------------해당 ${board.qnaNo} 번 게시글은 신고되었습니다      ----------------------</span>
	              			</td>
		              	</c:when>
		              	<c:otherwise>
	              			<td>
		              		<c:if test="${today == createDate}">
	              				<span class="badge badge-primary new">new</span>
		              		</c:if>
		              		<span id="boardNo">${board.qnaNo}</span>
		              		</td>
		              		<td>${board.qnaCategory}</td>
		              		<td>${board.qnaTitle}</td>
		              		<td>${board.qnaContent}</td>
		              		<td>${board.writerNick}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today == createDate }">${createTime}</c:when>
		              				<c:otherwise>${createDate}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>${board.likeCount}</td>
		              	</c:otherwise>
		              	</c:choose>
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
	$(".status").parent().parent().css("background-color","#FF3636");    

    $("td").on("click",function(){
    	if($(this).parent().children().children().eq(0).text()=="R"){
        	if($(this).parent().children().children().eq(1).text()=="new"){
        		var boardNo = $(this).parent().children().children().eq(2).text(); 				
        	}else{
        		var boardNo = $(this).parent().children().children().eq(1).text(); 	
        	}
    	}else{
        	if($(this).parent().children().children().eq(0).text()=="new"){
        		var boardNo = $(this).parent().children().children().eq(1).text(); 				
        	}else{
        		var boardNo = $(this).parent().children().children().eq(0).text(); 	
        	}	
    	}
    	location.href = "${contextPath}/mypage/boardView/"+boardNo;
    }).on("mouseenter", function(){
    	$(this).css("cursor", "pointer");
    });
    </script>   
    </body>
</html>