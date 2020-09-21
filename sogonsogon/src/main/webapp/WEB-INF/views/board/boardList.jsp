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
       <!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
       <style>
            body {
        color: #566787;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
	}
    table { text-align: center;}

    #category, #create_dt, #status{width: 120px;}

    #write{float: left;}

    .clearfix{width: 1060px; height: 33px; padding-top:5px; padding-bottom: 70px;}
    .hint-text,.write-Btn{width: 33%;}
    #writeBtn{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:right; font-size:13px; 
    			color:#ff7600; border-radius:2px;
    			background-color:#fff; padding:6px 14px;}
    #writeBtn:hover{border:1px solid #ff7600; background-color:#fff6ed;}			
    .page{width: 34%; float: left;}

	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
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
    /* 페이징 */
      .pageN{
          width: 100%;
          height: 50px;
          text-align: center;
       }
      .pagination2 a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
        border: 1px solid #ddd;
      }
      .pagination2 a.active {
       /*  background-color:  rgb(248, 162, 113); */
        background-color: brown;
        color: white;
      }
      .pagination2 a:hover:not(.active) {background-color: #ddd;}
      .pagination2 a:first-child {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
      }
      .pagination2 a:last-child {
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
      }
      /* 페이징 css end */
      
      /* 검색 영역 */
        *, *:before, *:after {
          -webkit-box-sizing: border-box;
          box-sizing: border-box;
       }
	   .search-box {
	     position: relative;
	     width: 100%;
	     max-width: 360px;
	     height: 60px;
	     border-radius: 120px;
	     margin: 0 auto;
	     background: rgba(255,255,255,0.5);
	   }
	   .search-border {
	     display: block;
	     width: 100%;
	     max-width: 360px;
	     height: 60px;
	   }
	   .border {
	     fill: none;
	     stroke: #ff8c1a;
	     stroke-width: 5;
	     stroke-miterlimit: 10;
	   }
	   #search {
	     font-family: 'Montserrat Alternates', sans-serif;
	     position: absolute;
	     top: 0;
	     left: 0;
	     width: 100%;
	     height: 100%;
	     border-radius: 120px;
	     border: none;
	     background: rgba(255,255,255,0);
	     padding: 0 68px 0 68px;
	     color: black;
	     font-size: 1.32em;
	     font-weight: 400;
	     letter-spacing: -0.015em;
	     outline: none;
	   }
	   #search::-webkit-input-placeholder {color: rgb(112, 112, 112);}
	   .search-icon,
	   .go-icon {
	      position: absolute;
	      top: 0;
	      height: 60px;
	      width: 86px;
	      line-height: 61px;
	      text-align: center;
	   }
	   .search-icon {
	      left: 0;
	      pointer-events: none;
	      font-size: 1.22em;
	      will-change: transform;
	      top: 9px;
	   }
	   .go-icon {
	      right: 0;
	      pointer-events: none;
	      font-size: 1.38em;
	      will-change: opacity;
	      cursor: default;
	      opacity: 0;
	   }
	   /* 검색 css end */
    .hint-text {
        float: left;
        font-size: 13px;
    }

    .write-Btn{float: right;}
    
    #col-sm-4>hr{background-color:white;}
    
    img{width:23px; height:23px;}

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
               
                <table class="table table-striped table-hover" id="table">
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
                                   <td>${board.qnaNo}</td>
                                   <td>${board.qnaCategory}</td>
                                   <td>${board.qnaTitle}</td>
                                   <td>${board.writerNick}</td>
                                   <td>
                                      <jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
                                      <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
                                      <fmt:formatDate var="createDate" value="${board.qnaCreateDate}" pattern="yyyy-MM-dd"/>
                                      <fmt:formatDate var="createTime" value="${board.qnaCreateDate}" pattern="hh:mm:ss"/>
                                      
                                      <c:choose>
                                         <c:when test="${today == createDate }">
                                            ${createTime}
                                         </c:when>
                                         <c:otherwise>
                                         ${createDate}
                                         </c:otherwise>
                                         </c:choose>
                                   </td>
                                   <td>${board.qnaAnswer}</td>
                                   </tr>   
                             </c:forEach>
                       </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
	   	<!--------------------------------- 페이징바  ---------------------------------->
	      <%-- 검색 파라미터가 포함된 url 생성  --%>
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
	 
	 <%---------- 검색  파라미터가 있을 경우 / 없을 경우 url 가공  ---------%>
	 
	 <%-- + 상세조회 목록으로 버튼 주소 가공 --%>
	
	 <c:choose>
	 <%--  검색 조건 존재하는 경우 (파라미터 cp가 쿼리스트링 제일 마지막에 추가  --%>
	 	<c:when test="${!empty paramValues.ct || !empty param.sVal }">
	 	 <c:set var="url" value="${searchParameter}&cp="/>
	 	 <c:set var="listUrl" value="../search/${url}${pInfo.currentPage}" scope="session"/>
	 	</c:when>
	 	
	 	<%-- 검색 조건 존재하지 않는 경우( 파라미터 cp가 쿼리스트링 제일 앞에 추가될 수 있도록 '?' 기호 추가  --%>
	 	<c:otherwise>
	 	<c:set var="url" value="boardList?cp="/>
	 	 <c:set var="listUrl" value="../list/${url}${pInfo.currentPage}" scope="session"/>
	 	</c:otherwise>
	 </c:choose>
		  <!-- 페이징 -->
  
   <div class="pageN">
      <div class="pagination2" style="display: inline-block;">
      
        <a href="${url}1">&laquo;</a> <%-- '<<' --%> <!-- ${url} : cp=  -->
        
        <%-- 10개 목록 --%>
		<c:forEach var="p" begin="${pInfo.startPage}" end="${pInfo.endPage}">
			<c:choose>
				<c:when test="${p==pInfo.currentPage}">
					<a class="active">${p}</a>
				</c:when>
				<c:otherwise>
					<a href="${url}${p}">${p}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
         
        <a href="${url}${pInfo.maxPage}">&raquo;</a>  <%-- '>>' --%>
      </div>
   </div>
       
    
                            
<c:if test="${!empty loginMember }">   
      <a class="btn btn-primary float-right" href="../board/boardWrite">글쓰기</a>
</c:if>
                </div>
            </div>
        
        <div>
          <div  class="text-center" id="searchForm" style="margin-bottom:100px;">
             
                <br>
        
                 <select name="sKey" class="form-control" style="width:100px; display: inline-block;">
                    <option value="horsehead">말머리</option>
                    <option value="coding">코딩</option>
                    <option value="for">외국어</option>
                    <option value="test">공시</option>
                </select>
                <input type="text" name="sVal" class="form-control" style="width:25%; display: inline-block;">
                <button class="form-control btn btn-primary" id="searchBtn" type="button" style="width:100px; display: inline-block;" >검색</button>
            </div>
            
            
        </div>
      

           <jsp:include page="../common/footer.jsp"/> 
           
           
      <script>
      
      $("#table td").on("click",function(e) {
         
         var qnaNo = $(this).parent().children().eq(0).text();
         
         var boardUrl="${contextPath}/board/"+qnaNo;
         
         location.href=boardUrl;
      });
      
      
   // --------------------검색 버튼 동작 
  	$("#searchBtn").on("click", function(){
  		
  		var searchUrl = "";
  		
  		// 검색에 필요한 요소(카테고리, 검색 조건, 검색어 )읽어오기
  		var $ct = $("input[name='ct']:checked");
  		var $sKey = $("select[name='sKey']");
  		var $sVal = $("input[name='sVal']");
  		
  		
  		
  	$ct.each(function(index, item){
  			
  		
  		console.log($(item).val());
  		});
  			
  		console.log($sKey.val());
  		console.log($sVal.val());
  		
  		if($ct.length == 0 && $sVal.val().trim().length == 0){
  			searchUrl = "${pInfo.boardType}";
  			
  		}
  		
  		
  		else{
  			
  			//http://localhost:8080/spring/board/list/1
  			searchUrl = "../search/${pInfo.boardType}?"; //검색 요청 url
  			
  			//카테고리가 체크된 경우
  			if($ct.length != 0){
  				//$ct 배열에 반복 접근 하여 쿼리 스트링에 추가 
  				$ct.each(function(indext, item){
  					//ct=운동 &ct=영화
  					if(indext != 0) searchUrl += "&";
  					searchUrl += "ct=" + $(item).val();
  				});
  				
  				//카테고리 반복 접근이 끝난 후
  				//검색어가 있을 경우 쿼리스트링을 이어서 작성할 수 있도록 '&' 기호 추가 
  				if($sVal.val().trim().length != 0 ) searchUrl += "&";
  			}
  			
  			// 검색어가 입력된 경우
  			if($sVal.val().trim().length != 0){
  				searchUrl += "sKey=" + $sKey.val() + "&sVal=" + $sVal.val();
  			}
  		}
  		
  		//2) location.href를 통해 검색 요청 전달 
  		location.href = searchUrl;
  	});
  	
  	//-------------------검색 값 유지 -----------------------------
  	$(function(){
  		
  		var sKey = "${param.sKey}";
  		var sVal = "${param.sVal}";
  		// EL 구문에서 값이 없을 경우 ""(빈문자열)이 반환됨 . 
  		
  		
  		
  		
  		if(sKey != "" && sVal != "") {
  			
  		// 검색어 세팅
  		$("input[name='sVal']").val(sVal);
  		//검색 조건 세팅
  		$("select[name='sKey'] > option").each(function(index, item){
  			if($(item).val() == sKey){
  				$(item).prop("selected", true);
  			}
  		});
  		
  	}
  		
  		// 카테고리(체크박스) 값 세팅
  		// script 태그 내에 EL/JSTL 사용하기 
  		
  		//HTML, JS/jQuery, Scriptlet(Java), EL/JSTL
  		//서버 동작 시 JSP 파일 코드 해석 순서
  		// 1) Java, 2) EL/JSTL, 3) HTML, 4) JS/jQuery
  		
  		//EL/JSTL 구문은 JS/jQuery보다 해석이 빠르므로
  		// JS 구문 내에 EL/JSTL 작서하여 혼용할 수 있다.
  		
  		
  		<c:forEach var="ctName" items="${paramValues.ct}">
  		  $("input[name='ct']").each(function(index, item){
  			  if($(item).val() == "${ctName}"){
  				  $(item).prop("checked", true);
  			  
  			  }
  		  });
  		</c:forEach>
  	});
  	
  	// -------- 검색창 엔터 이벤트 -----------
  	$("input[name='sVal']").on("keyup", function(event){
  		//console.log(event.keyCode); // 키업 이벤트가 발생할 경우 입력한 키코드가 출력됨 
  	 if(event.keyCode == 13){ // 엔터키가 눌러진 경우
  	  $("#searchBtn").click();	 
  	 }
  	 
  	});
      
      </script>
    </body>
</html>