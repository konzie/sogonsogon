<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 목록</title>
        
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
      <h4 class="mb-5">회원 목록</h4>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th id="memberNo">no.</th>
                        <th id="id">아이디</th>
                        <th id="name">이름</th>
                        <th id="nick">닉네임</th>						
                        <th id="phone">연락처</th>						
                        <th id="phone">이메일</th>						
                        <th id="interest">관심사</th>
                        <th id="enrollDate">가입일</th>
                        <th id="status">회원 상태</th>
                        <th id="grade">회원 등급</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty memberList}">
		         		<tr>		
		         			<td colspan="10" align="center">존재하는 회원이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
                         <c:forEach var="member" items="${memberList}">
                            <tr>		
	              			<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${member.memberEnrollDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${member.memberEnrollDate}" pattern="hh:mm:ss"/>
		              			<td>
			              			<c:if test="${today == createDate}">
		              					<span class="badge badge-primary new">new</span>
			              			</c:if>
                                  <span>${member.memberNo}</span></td>
                                  <td>${member.memberId}</td>
                                  <td>${member.memberName}</td>
                                  <td>${member.memberNick}</td>
                                  <td>${member.memberPhone}</td>
                                  <td>${member.memberEmail}</td>
                                  <td>${member.memberInterest}</td>
                                  <td>${member.memberEnrollDate}</td>
                                  
                                  <c:choose>
	                                 <c:when test="${member.memberStatus.equals('Y')}">
	                                 	<td>정상</td>
	                                 </c:when>
	                                 <c:when test="${member.memberStatus.equals('R')}">
	                                 	<td>신고</td>
	                                 </c:when>
	                                 <c:otherwise>
	                                 	<td>탈퇴</td>
	                                 </c:otherwise>
                                  </c:choose>
                                  <c:choose>
                                  <c:when test="${member.memberGrade.equals('G')}">
                                  	<td>일반 회원</td>
                                  </c:when>
                                  <c:otherwise>
                                  	<td>관리자</td>
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
</script>    
    </body>
</html>