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

      .table-title {
      color: #fff;
      background: #ff9d38;      
      width:100%;
      height:15%;
    }
      .content{
          width: 90%;
          height: 80%;
          margin-top:10px;
          position:relative;
      }
                
      .mypageNav {
          float:left; 
          width: 25%;
          height:80%;
          color: #fff;
          background: #ff9d38;  
    	  font-size: 100%;
          padding:0;
          margin:0;
      }
      
      .content2{
      	width:75%;
        height:80%;
        float:left; 
        padding:3%;
      }
      
      .mypageNav>ul{
          margin:0;
          padding:0;
          height:100%;
      }
      
      .mypageNav>ul li{
          list-style-type: none;
          width:100%;
          height:25%;
          font-size:20px;
          line-height: 40px;
          text-align: center;
          margin:0%;
          padding:0;
      }
      
      .mypageNav>ul li a{
          text-decoration: none;
          color:white;
          font-weight:bold;
          width:100%;
          height:100%;
          display:block;
      }
      
      .mypageNav>ul li:hover{
          background-color: crimson;
      }
</style>
</head>
<body>
  <jsp:include page="../common/header.jsp" />
   
   <div class="empty"></div>
   
   <div class="table-title">
      <div class="row">
         <div class="col-sm-4">
            <h2><b>My Page</b></h2>
         </div>
      </div>
   </div>
   
      <section class="content">
      	<div class="mypageNav">
            <ul>
                <li><a href="${contextPath}/mypage/myroom"> <img src="${contextPath}/resources/images/meeting.png" width="50px" height="50px">참여 스터디 방</a></li>
                <li><a href="${contextPath}/mypage/myboard"> <img src="${contextPath}/resources/images/classroom.png" width="50px" height="50px">내가 작성한 글</a></li>
                <li><a href="${contextPath}/mypage/myreply"> <img src="${contextPath}/resources/images/answer.png" width="50px" height="50px">채택된 댓글</a></li>
                <li><a href="${contextPath}/mypage/myInfo"> <img src="${contextPath}/resources/images/personal-information.png" width="50px" height="50px">내정보</a></li>
            </ul>
       </div>
       <div class="content2"> 
       <h4 class="mb-5">내가 쓴 게시글</h4>      
            <div class="table-filter">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="show-entries">
                            <span>목록</span>
                            <select class="form-control">
                                <option>5</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
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
                                <option>말머리</option>
                                <option>외국어</option>
                                <option>코딩</option>
                                <option>공시</option>
                                <option>자격증</option>
                            </select>
                        </div>
                        <span class="filter-icon"><i class="fa fa-filter"></i></span>
                    </div>
                </div>
            </div>
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
          		<td colspan="6">존재하는 게시글이 없습니다.
          		</td>
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
            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <div class="page">
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
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
                <div class="write-Btn"><button class="btn btn-primary">글쓰기</button></div>
            </div>
        </div>    
	</section>  
    </body>
</html>