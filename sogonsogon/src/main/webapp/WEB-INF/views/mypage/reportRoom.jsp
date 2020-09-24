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
 
         <h4 class="mb-5">스터디룸 게시판 신고 목록</h4>
       <table class="table table-striped table-hover reportRoomBoard">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>						
                        <th>작성일</th>		
                        <th>처리 </th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty roomReportList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="roomBoard" items="${roomReportList}">
	              		<tr>		
	              			<jsp:useBean id="now1" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today1" value="${now1}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate1" value="${roomBoard.roomBoardCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime1" value="${roomBoard.roomBoardCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today1 == createDate1}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span>${roomBoard.roomBoardNo}</span><span style="display:none;">${roomBoard.roomNo}</span><span>(ROOM : ${roomBoard.roomNo})</span>
		              		</td>
		              		<td>${roomBoard.roomBoardType}</td>
		              		<td>${roomBoard.roomBoardTitle}</td>
		              		<td>${roomBoard.roomBoardContent}</td>
		              		<td>${roomBoard.roomBoardWriter}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today1 == createDate1 }">${createTime1}</c:when>
		              				<c:otherwise>${createDate1}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td><button type="button" class="btn btn-danger btn-sm" onclick="location.href ='updateReport/${roomBoard.roomBoardWriterNo}/${roomBoard.roomBoardNo}/${roomBoard.roomNo}'">경고</button>          <button type="button" class="btn btn-dark btn-sm" onclick="location.href ='restoreReportRoom/${roomBoard.roomBoardWriterNo}/${roomBoard.roomBoardNo}/${roomBoard.roomNo}'">X</button></td>
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
    
    $(".new").parent().parent().css("background-color","bisque");

    $("td:not(td:last-of-type)").on("click",function(){
    	if($(this).parent().children().children().eq(0).text()=="new"){
    		var boardNo = $(this).parent().children().children().eq(1).text();
    		var roomNo = $(this).parent().children().children().eq(2).text(); 
    	}else{
    		var boardNo = $(this).parent().children().children().eq(0).text(); 
    		var roomNo = $(this).parent().children().children().eq(1).text(); 
    	}
    	location.href = "${contextPath}/mypage/reportView2/"+boardNo+"/"+roomNo;
    }).on("mouseenter", function(){
    	$(this).css("cursor", "pointer");
    });
    </script>    
    </body>
</html>