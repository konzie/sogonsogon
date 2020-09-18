<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${contextPath}/resources/css/helpList.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>QnA</title>
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style></style>
        
        <script>
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>       
    </head>
    
<!-- body 시작 ---------------------------------------------------------------------- -->   
    
    <body style="background-color: #F0EDEB;">
    <jsp:include page="../common/header.jsp"/>
        <div class="container">
        <div class="table-title">
			       <div style="width: 75%; height: 100%; float: left;">
			            <h1>Help Desk</h1>
			            <p>궁금한 내용을 남겨주세요.<br>
			                                 자세히 답변 드립니다. 
			            </p>         
			       </div>
			       
			       <div style="width: 25%; height: 100%; float: left;">
			        	<img src="${contextPath}/resources/images/helpIcon.png" style="float: right; margin-top: -16px;">
			       </div>
			        
			   </div>
        
     		<hr>   
        
            <div class="table-wrapper">
                
                <div class="table-filter">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="show-entries">
                                <span>목록</span>
                                <select class="form-control">
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                </select>
                                <span>개씩 보기</span>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                            <div class="filter-group">
                                <input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
                            </div>
                            <div class="filter-group">
                                <select class="form-control">
                                    <option>제목</option>
                                    <option>내용</option>							
                                </select>
                            </div>
                            <div class="filter-group">
                                <select class="form-control">
                                    <option>분류</option>
                                    <option>사이트 이용법</option>
                                    <option>기타</option>
                                </select>
                            </div>
                            <span class="filter-icon"><i  class="fa fa-filter"></i></span>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover" id="list-table">
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
                  <c:when test="${empty helpList}">
                     <tr>
                        <td colspan="7">존재하는 게시글이 없습니다.</td>
                     </tr>
                  </c:when>                   
                  <c:otherwise>
                     <c:forEach var="help" items="${helpList}">
                        <!-- helpList에 있는 요소를 반복접근 하여 help라는 변수에 저장하여 내부에서 사용 -->
                        <tr>
                           <td>${help.helpNo}</td>
                           <td>${help.helpCategory}</td>
                           
                           <td>
                           		<c:if test="${help.lockStatus == 'Y'}">
		                        	<img src="${contextPath}/resources/images/lock2.png">
		                  		</c:if>  
                           			${help.helpTitle}
                           			<!--<input type="text" value="${help.lockStatus}" id="lock_YN" name="lock_YN">
                           			
                           			<c:choose>
	                           			<c:when test="${help.helpWriter == loginMember.memberNick}">
	                           			<input type="text" value="Y" id="writer_YN" name="lock_YN">
			                  			</c:when> 
	                           			<c:when test="${help.helpWriter != loginMember.memberNick}">
	                           			<input type="text" value="N" id="writer_YN" name="lock_YN">
			                  			</c:when> 
		                  			</c:choose>-->
                           			
                           </td>
                           <td>${help.helpWriter}</td>                           
                           <td>    
                              <jsp:useBean id="now" class="java.util.Date"/>
                              <%-- Date now = new Date(); (현재시간) --%>
                                 
                              <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
                              <fmt:formatDate var="createDate" value="${help.helpCreateDate}" pattern="yyyy-MM-dd"/>
                              <fmt:formatDate var="createTime" value="${help.helpCreateDate}" pattern="hh:mm:ss"/>
                              <c:choose>   
                                 <c:when test="${today == createDate}">
                                    ${createTime}
                                 </c:when>
                                 <c:otherwise>
                                    ${createDate}
                                 </c:otherwise>
                              </c:choose>
                           </td>
                           <td><span class="status text-wait">&bull;</span> 미답변</td>
                           <td><a class="view" title="자세히" data-toggle="tooltip"><i style="cursor : pointer;" class="material-icons">&#xE5C8;</i></a></td>
                        </tr>
                     </c:forEach>
                  </c:otherwise>
                   </c:choose>
                    </tbody>
                </table>
                <hr>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>10</b> out of <b>${hInfo.allCount}</b> entries</div>
                    
                    
                    <c:set var="url" value="${searchParameter}?cp="/>
         			<c:set var="listUrl" value="../list/${url}${hInfo.currentPage}" scope="session"/>
                    <div class="page">
                        <ul class="pagination">
                        	<c:if test="${hInfo.currentPage > hInfo.pagingBarSize }">         
			                   <li class="page-item">			                   
			                      <!-- fmt 태그를 이용한 소수점 제거 -->
			                      <c:set var="prev" value="${hInfo.currentPage-1}"/>	                      
			                         <%--<a class="page-link text-primary" href="${pInfo.boardType}?cp=${prev}">&lt;</a> --%>
			                         <a href="${url}${prev}">Previous</a>
			                   </li>
			                   <li><a href="${url}1">1</a></li>
			                   <li><a>...</a><li>
                            </c:if>                       
                            
                            <c:forEach var="p" begin="${hInfo.startPage }" end="${hInfo.endPage }">
								
								<c:choose>
			                   
								<c:when test="${p == hInfo.currentPage}">
			                         <li class="page-item active" ><a>${p}</a></li>
			                    </c:when>
								<c:otherwise>
			                         <li class="page-item ">
			                            <%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${p}">${p}</a>--%>
			                            <a href="${url}${p}">${p}</a>
			                         </li>
								</c:otherwise>
								</c:choose>            
			                </c:forEach>
                            
                            
                            
                           <c:if test="${hInfo.maxPage > hInfo.endPage}">
                           <li><a>...</a><li>
						   <li><a href="${url}${hInfo.maxPage}">${hInfo.maxPage}</a></li> 
                            <li class="page-item">
		                   		<c:set var="next" value="${hInfo.currentPage+1 }"/>
		                  		<%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${next}">&gt;</a>--%>
		                  		<a class="page-link" href="${url}${next}">Next</a>
		                   </li>
		                   </c:if>
                        </ul>
                    </div>
                    <c:if test="${!empty loginMember}">
                    <div class="write-Btn"><a id="writeBtn" type="button" href="${contextPath}/help/helpwrite">글쓰기</a></div>
                	</c:if>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
        
        <script>
        
        	//detail view 가기
        	$(function(){
        		$(".view").on("click",function(){
        			

        			var boardNo = $(this).parent().parent().children().eq(0).text();
        			var boardUrl = "${contextPath}/help/no=" + boardNo + "?cp=${hInfo.currentPage}";
        			
        			location.href = boardUrl;      			
        		});	
        	});
        	       
        </script>
        
    </body>
</html>