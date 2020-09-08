<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>자유질문방</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
            body {
        color: #566787;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
		font-size: 13px;
	}
    th, td { text-align: center;}

    #category, #create_dt, #status{width: 120px;}

    #write{float: left;}

    .clearfix{width: 1090px; height: 33px; padding-bottom: 70px;}
    .hint-text,.write-Btn{width: 33%;}
    .page{width: 34%; float: left;}

	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: 30px auto;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    
    #wrapper{
    	width : 100%;
    	height : 100%;
    
    }
	.table-wrapper .btn {
		float: right;
		color: #333;
    	background-color: #fff;
		border-radius: 3px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-wrapper .btn:hover {
        color: #333;
		background: #f2f2f2;
	}
	.table-wrapper .btn.btn-primary {
		color: #fff;
		background: #03A9F4;
	}
	.table-wrapper .btn.btn-primary:hover {
		background: #03a3e7;
	}
	.table-title .btn {		
		font-size: 13px;
		border: none;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
	.table-title {
		color: #fff;
		background: #ff9d38;		
		padding: 16px 25px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.show-entries select.form-control {        
        width: 60px;
		margin: 0 5px;
	}
	.table-filter .filter-group {
        float: right;
		margin-left: 15px;
    }
	.table-filter input, .table-filter select {
		height: 34px;
		border-radius: 3px;
		border-color: #ddd;
        box-shadow: none;
	}
	.table-filter {
		padding: 5px 0 15px;
		border-bottom: 1px solid #e9e9e9;
		margin-bottom: 5px;
	}
	.table-filter .btn {
		height: 34px;
	}
	.table-filter label {
		font-weight: normal;
		margin-left: 10px;
	}
	.table-filter select, .table-filter input {
		display: inline-block;
		margin-left: 5px;
	}
	.table-filter input {
		width: 200px;
		display: inline-block;
	}
	.filter-group select.form-control {
		width: 110px;
	}
	.filter-icon {
		float: right;
		margin-top: 7px;
	}
	.filter-icon i {
		font-size: 18px;
		opacity: 0.7;
	}	
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 70px;
	}
	table.table tr th:last-child {
		width: 80px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.view {        
		width: 30px;
		height: 30px;
		color: #2196F3;
		border: 2px solid;
		border-radius: 30px;
		text-align: center;
    }
    table.table td a.view i {
        font-size: 22px;
		margin: 2px 0 0 1px;
    }   
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
	.status {
		font-size: 30px;
		margin: 2px 2px 0 0;
		display: inline-block;
		vertical-align: middle;
		line-height: 10px;
	}
    .text-success {
        color: #10c469;
    }
    .text-wait {
        color: #ff5b5b;
    }
    .pagination {
        float: center;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        font-size: 13px;
    }

    .write-Btn{float: right;}

	.colsm{
	 width :100% important;
	}
        </style>
        <script>
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            });
            </script>
       
    </head>
    <body>
    
    <jsp:include page="../common/header.jsp"/>
        <div class="container">
            <div class="table-wrapper" id="wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4" id="colsm">
                            <h2><b>자유 질문방</b></h2><hr><h5>자유롭게 질문을 주고 받으세요 ! </h5>
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
        </div> 
          
      
     	
<c:if test="${!empty loginMember }">	
      <a class="btn btn-primary float-right" href="../${boardList[0].boardType}/insert">글쓰기</a>
</c:if>
    
	      <c:url var="searchParameter" value="${pInfo.boardType}">
	      <c:if test="${!empty paramValues.ct }">
	      <c:forEach var="ctName" items="${paramValues.ct}">
	      	<c:param name ="ct" value="${ctName}"/>
	      	
	      </c:forEach>
	      
	      </c:if>
	      <c:if test="${!empty param.sVal }">
	       <c:param name="sKey" value="${param.sKey}"/>
	       <c:param name="sVal" value="${param.sVal}"/>
	      </c:if>
	 </c:url>
	
	 <c:choose>
	 	<c:when test="${!empty paramValues.ct || !empty param.sVal }">
	 	 <c:set var="url" value="${searchParameter}&cp="/>
	 	 <c:set var="listUrl" value="../search/${url}${pInfo.currentPage}" scope="session"/>
	 	</c:when>
	 	
	 	<c:otherwise>
	 	<c:set var="url" value="${searchParameter}?cp="/>
	 	 <c:set var="listUrl" value="../list/${url}${pInfo.currentPage}" scope="session"/>
	 	</c:otherwise>
	 </c:choose>
		<div class="my-4">
            <ul class="pagination">
            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize}">	
            		
            		
	                <li>
	                    <a class="page-link text-primary" href="${url}1">&lt;&lt;</a>
	                </li>
	                
	                <li>
	                	<fmt:parseNumber var="operand1" value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}" integerOnly="true"/>
	               		
	               		<c:set var ="prev" value="${operand1 * 10 }"/>
                   		<a class="page-link text-primary" href="${url}${prev}">&lt;</a>
	                </li>
                </c:if>
                
                <c:forEach var="p" begin="${pInfo.startPage}" end="${pInfo.endPage}">
                
                	<c:choose>
                		<c:when test="${p==pInfo.currentPage}">
                			<li><a class="page-link">${p}</a></li>
                			</c:when>
                			
                			<c:otherwise>
	                		<li>
	                			<a class="page-link text-primary" href="${pInfo.boardType}?cp=${p}">${p}</a>
		                	</li>
		                	</c:otherwise>
		            </c:choose>	
                </c:forEach>
              
                <c:if test="${pInfo.maxPage > pInfo.endPage}">
                
               
	                <li>
	                <fmt:parseNumber var="operand2" value="${(pInfo.currentPage +(pInfo.pagingBarSize-1))/10 }" integerOnly="true"/>
                	<c:set var="next" value="${operand2 * 10 + 1}"/>
           
						  <a class="page-link text-primary" href="${url}${p}">${p}</a>
	                </li>
	                
	                <li>
	                    <a class="page-link text-primary" href="${pInfo.boardType}?cp=${pInfo.maxPage}">&gt;&gt;</a>
	                </li>
	            </c:if>
	                
	                
                
            </ul>
        </div>	     

        <div>
          <div  class="text-center" id="searchForm" style="margin-bottom:100px;">
             
                <br>
                <select name="sKey" class="form-control" style="width:100px; display: inline-block;">
                    <option value="tit">글제목</option>
                    <option value="con">내용</option>
                    <option value="tit-con">제목+내용</option>
                </select>
                 <select name="sKey" class="form-control" style="width:100px; display: inline-block;">
                    <option value="horsehead">말머리</option>
                    <option value="coding">코딩</option>
                    <option value="for">외국어</option>
                    <option value="test">공시</option>
                </select>
                <input type="text" name="sVal" class="form-control" style="width:25%; display: inline-block;">
                <button class="form-control btn btn-primary" id="searchBtn" type="button" style="width:100px; display: inline-block;">검색</button>
            </div>
            <c:if test="${!empty loginMember}">
                    <div class="write-Btn"><a class="btn btn-primary float-right" href="${contextPath}/board/helpwrite">글쓰기</a></div>
                	</c:if>
            
        </div>
   	
	</div>
           <jsp:include page="../common/footer.jsp"/> 
           
           
           	<script>
		
		$(function(){
			
			$("#list-table td").on("click",function(){
				
				var boardNo = $(this).parent().children().eq(0).text();
				
			
				var boardUrl =
					"${contextPath}/board/${pInfo.boardType}/" +
					boardNo + "?cp=${pInfo.currentPage}";
				
			location.href = boardUrl;			
			});
		});;
	
	
	// --------------------검색 버튼 동작 
	$("#searchBtn").on("click", function(){
		
		var searchUrl = "";
		
		var $ct = $("input[name='ct']:checked");
		var $sKey = $("select[name='sKey']");
		var $sVal = $("input[name='sVal']");
		
		
	$ct.each(function(index, item){
			
		
		
		
		
		if($ct.length == 0 && $sVal.val().trim().length == 0){
			searchUrl = "${pInfo.boardType}";
			
		}
		
		
		else{
			searchUrl = "../search/${pInfo.boardType}?";
			
			
			if($ct.length != 0){
				
				$ct.each(function(indext, item){
					
					if(indext != 0) searchUrl += "&";
					searchUrl += "ct=" + $(item).val();
				});
				
				
				if($sVal.val().trim().length != 0 ) searchUrl += "&";
			}
			
		
			if($sVal.val().trim().length != 0){
				searchUrl += "sKey=" + $sKey.val() + "&sVal=" + $sVal.val();
			}
		}
		
	
		location.href = searchUrl;
	});
	

	$(function(){
		
		var sKey = "${param.sKey}";
		var sVal = "${param.sVal}";
		
		
		
		
		if(sKey != "" && sVal != "") {
			
		
		$("input[name='sVal']").val(sVal);
		
		$("select[name='sKey'] > option").each(function(index, item){
			if($(item).val() == sKey){
				$(item).prop("selected", true);
			}
		});
		
	}
		
	$("input[name='sVal']").on("keyup", function(event){
	
	 if(event.keyCode == 13){ 
	  $("#searchBtn").click();	 
	 }
	 
	});
		
	</script>
	   
    </body>
</html>