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
		         			<td colspan="7" align="center">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${boardList}">
	              		<tr>		
	              			<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${board.qnaCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${board.qnaCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today == createDate}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span id="boardNo">${board.qnaNo}</span>
		              		</td>
		              		<td>${board.qnaCategory}</td>
		              		<td>${board.qnaTitle}</td>
		              		<td>${board.qnaContent}</td>
		              		<td id=writer>${board.writerNick}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today == createDate }">${createTime}</c:when>
		              				<c:otherwise>${createDate}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>${board.likeCount}</td>
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
        
      <h4 class="mb-5">내가 쓴 스터디방 게시글</h4>
       <table class="table table-striped table-hover myRoomBoard">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>방번호</th>
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
          			<c:when test="${empty roomBoard}">
		         		<tr>		
		         			<td colspan="8" align="center">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="room" items="${roomBoard}">
	              		<tr>		
	              			<jsp:useBean id="now1" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now1}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${room.roomBoardCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${room.roomBoardCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today == createDate}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span id="boardNo">${room.roomBoardNo}</span><span display="none">${room.roomNo}</span>
		              		</td>
		              		<td>${room.roomNo}</td>
		              		<td>${room.roomBoardType}</td>
		              		<td>${room.roomBoardTitle}</td>
		              		<td>${room.roomBoardContent}</td>
		              		<td>${board.roomBoardWriter}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today == createDate }">${createTime}</c:when>
		              				<c:otherwise>${createDate}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>${room.roomBoardLikeCount}</td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
            
            <div class="my-4">
            <ul class="pagination">
               <c:if test="${roomPInfo.currentPage  > roomPInfo.pagingBarSize}">   
                   <li>
                   	<a class="page-link text-primary" href="?cp=1">&lt;&lt;</a>
                   </li>
                   <li>
                      <fmt:parseNumber var="operand3" value="${(roomPInfo.currentPage-1)/roomPInfo.pagingBarSize}" integerOnly="true" />
                      <c:set var="prev1" value="${operand3 * 10 }" />
                      <a class="page-link text-primary" href="?cp=${prev1}">&lt;</a>
                   </li>
                </c:if>
                
                <!-- 10개의 페이지 목록 -->
                <c:forEach var="p1" begin="${roomPInfo.startPage}" end="${roomPInfo.endPage}">
                   <c:choose>
                      <c:when test="${p1==roomPInfo.currentPage}">
                         <li><a class="page-link">${p1}</a></li>
                      </c:when>
                      <c:otherwise>
                         <li>
                           <a class="page-link text-primary" href="?cp=${p1}">${p1}</a>
                         </li>
                      </c:otherwise>
                   </c:choose>
                </c:forEach>
                
                
                 <!-- 다음 페이지로(>) -->
                <!-- next 생성 식:(현재페이지+9)/10*10+1 -->
                <c:if test="${roomPInfo.maxPage>roomPInfo.endPage}">
                <!-- 다음페이지(>) -->
                   <li>
                   <fmt:parseNumber var="operand4" value="${(roomPInfo.currentPage+9)/10}" integerOnly="true"/>
                   <c:set var="next1" value="${operand4*10+1}"/>
                     <a class="page-link text-primary" href="?cp=${next1}">&gt;</a>
                   </li>
                   
                   <!-- 맨 끝으로(>>) -->
                   <li>
                       <a class="page-link text-primary" href="?cp=${roomPInfo.maxPage}">&gt;&gt;</a>
                   </li>
                </c:if>
            </ul>
        </div> 
        </div>
    </div>    
       <jsp:include page="../common/footer.jsp" />
       
    <script>
 /*    $(function(){
    	
    	var writer = $("#writer").text();
    	$.ajax({
    		url : "${contextPath}/mypage/myReportBoard",
    		data : {writer:writer}
    		success : function(reportBoard){
    			for(int i=0;i<reportBoard.size();i++){
    				if($("#boardNo").text==reportBoard[i]){
    					$("#boardNo").parent().parent().css("background-color","lightred");
    				}
    			}
    		}, error : function(reportBoard){
    			console.log("Ajax 통신 실패");
    		} 
    	});	
    }); */
    
    $(".new").parent().parent().css("background-color","bisque");

    $(".myBoard td:not(:last-child)").on("click",function(){
    	if($(this).parent().children().children().eq(0).text()=="new"){
    		var boardNo = $(this).parent().children().children().eq(1).text(); 				
    	}else{
    		var boardNo = $(this).parent().children().children().eq(0).text(); 	
    	}
    	location.href = "${contextPath}/mypage/boardView/"+boardNo;
    }).on("mouseenter", function(){
    	$(this).parent().css("cursor", "pointer");
    });

    $(".myRoomBoard td:not(:last-child)").on("click",function(){
    	if($(this).parent().children().children().eq(0).text()=="new"){
    		var boardNo = $(this).parent().children().children().eq(1).text();
    		var roomNo = $(this).parent().children().children().eq(2).text();
    		}else{
    		var boardNo = $(this).parent().children().children().eq(0).text(); 	
    		var roomNo = $(this).parent().children().children().eq(1).text();
    	}
    	location.href = "${contextPath}/roomBoard/"+roomNo+"/"+boardNo;
    }).on("mouseenter", function(){
    	$(this).parent().css("cursor", "pointer");
    });
    </script>   
    </body>
</html>