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
       <h4 class="mb-5">내가 쓴 스터디방 게시글</h4>
       <table class="table table-striped table-hover myRoomBoard">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성일</th>						
                        <th>조회수</th>						
                        <th>좋아요 수</th>

                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty roomBoard}">
		         		<tr>		
		         			<td colspan="7" align="center" onclick="event.cancelBubble=true" style="cursor: auto;">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="room" items="${roomBoard}">
	              		<tr>		
	              	    <jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${room.roomBoardCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${room.roomBoardCreateDate}" pattern="hh:mm:ss"/>
	              		<c:choose>	
	              		<c:when test="${room.roomBoardStatus=='R'}">
	              			<td>
	              			<span style="display:none;" class="status">${room.roomBoardStatus}</span>
		              		<c:if test="${today == createDate}">
	              				<span class="badge badge-primary new">new</span>
		              		</c:if>
		              		<span style="color: white">${room.roomBoardNo}</span><span style="display: none;">${room.roomNo}</span>
		              		<span style="color: white"> (room : ${room.roomNo})</span>
		              		</td>
		              		<td style="color: white">신고</td>
		              		<td style="color: white">${room.roomBoardTitle}</td>
	              			<td colspan="4" align="center">
	              				<span style="color: white">----------------------해당 ${room.roomNo}번 방의 ${room.roomBoardNo} 번 게시글은 신고되었습니다      ----------------------</span>
	              			</td>
		              	</c:when>
		              	<c:otherwise>
		              		<td>
		              			<c:if test="${today == createDate}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span id="boardNo">${room.roomBoardNo}</span><span style="display: none;">${room.roomNo}</span>
		              		<span>(room : ${room.roomNo})</span>
		              		</td>
		              		<td>${room.roomBoardType}</td>
		              		<td>${room.roomBoardTitle}</td>
		              		<td>${room.roomBoardContent}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today == createDate }">${createTime}</c:when>
		              				<c:otherwise>${createDate}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>${room.roomBoardReadCount}</td>
		              		<td>${room.roomBoardLikeCount}</td>
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

	$(".status").parent().parent().css("background-color","#FF3636");
    
    $(".new").parent().parent().css("background-color","bisque");

    $("td").on("click",function(){
    	if($(this).parent().children().children().eq(0).text()=="R"){
	    	if($(this).parent().children().children().eq(1).text()=="new"){
	    		var boardNo = $(this).parent().children().children().eq(2).text();
	    		var roomNo = $(this).parent().children().children().eq(3).text();
    		}else{
	    		var boardNo = $(this).parent().children().children().eq(1).text(); 	
	    		var roomNo = $(this).parent().children().children().eq(2).text();
	    	}
        }else{
        	if($(this).parent().children().children().eq(0).text()=="new"){
        		var boardNo = $(this).parent().children().children().eq(1).text();
        		var roomNo = $(this).parent().children().children().eq(2).text();
        	}else{
	    		var boardNo = $(this).parent().children().children().eq(0).text(); 	
	    		var roomNo = $(this).parent().children().children().eq(1).text();	
        	}
        }
    	location.href = "${contextPath}/mypage/roomBoardView/"+boardNo+"/"+roomNo;
    }).on("mouseenter", function(){
    	$(this).css("cursor", "pointer");
    });
    </script>   
    </body>
</html>