<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${contextPath}/resources/css/helpList.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>고객센터</title>
        
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
                                <!-- <span>목록</span>
                                <select class="form-control" id="limit" onchange="location.href=this.value">
                                    <option value="${contextPath}/help/list/1?cp=1?10">10</option>
                                    <option value="${contextPath}/help/list/1?cp=1">15</option>
                                    <option value="${contextPath}/help/list/1?cp=1?limit=20">20</option>
                                </select>
                                <span>개씩 보기</span> -->
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <button type="button" id="searchBtn" class="btn btn-primary"><i class="fa fa-search"></i></button>
                            <div class="filter-group">
                                <input type="text" name="sVal" class="form-control" placeholder="검색어를 입력해주세요.">
                            </div>
                            <div class="filter-group">
                                <select class="form-control" name="sKey">
                                    <option value="tit">제목</option>
                                    <option value="cont">내용</option>							
                                    <option value="tit-con">제목+내용</option>							
                                </select>
                            </div>
                            <div class="filter-group">
                                <select class="form-control" name="ct">
                                    <option>분류</option>
                                    <option value="사이트 이용">사이트 이용</option>
                                    <option value="시스템">시스템</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                            <span class="filter-icon"><i class="fa fa-filter"></i></span>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover" id="list-table">
                    <thead>
                        <tr>
                            <th id="helpNo" style="width:80px;">글번호</th>
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
                           <td>
                           	<c:choose>
                           		<c:when test="${help.answerChk == 'Y'}">
                           			<span class="status text-success" style="margin: -8px 2px 0 0;">&bull;</span> 답변   	
		                  		</c:when>
		                  		<c:otherwise>
		                  			<span class="status text-wait" style="margin: -8px 2px 0 0;">&bull;</span> 미답변  
		                  		</c:otherwise>                                            		
                           	</c:choose>
                           </td>
                           <td><a class="view" title="자세히" data-toggle="tooltip"><i style="cursor : pointer;" class="material-icons">&#xE5C8;</i></a></td>
                        </tr>
                     </c:forEach>
                  </c:otherwise>
                   </c:choose>
                    </tbody>
                </table>
                <hr>
                <div class="clearfix">
                    <div class="hint-text">Showing <b id="bb">${hInfo.limit}</b> out of <b>${hInfo.allCount}</b> entries</div>
                    
                    
                    <c:set var="url" value="${searchParameter}?cp="/>
         			<c:set var="listUrl" value="../list/${url}${hInfo.currentPage}?${hInfo.limit}" scope="session"/>
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
                    <%----------------- 검색 파라미터가 포함된 url 생성 ------------------%>
         <c:url var="searchParameter" value="">
         	<c:if test="${!empty paramValues.ct }">
         		<c:forEach var="ctName" items="${paramValues.ct}">
         			<c:param name="ct" value="${ctName}"/>
         		</c:forEach>
         	</c:if>
         	
         	<c:if test="${!empty param.sVal }">
         		<c:param name="sKey" value="${param.sKey }"/>
         		<c:param name="sVal" value="${param.sVal }"/>
         	</c:if>
         </c:url>
         
         <%------- 검색 파라미터가 있을 경우 / 없을 경우 url 가공 -------%>
         <%-- + 상세조회 목록으로 버튼 주소 가공 --%>
         
       		<!--검색파라미터가 있을 경우 : search/1?ct=운동&ct=영화&sKey=tit&sVal=test&cp=2
         	검색파라미터가 없을 경우 : list/1?cp=2 -->
         	<c:choose>
         		<%-- 검색 조건 존재하는 경우(파라미터 cp가 쿼리스트링 제일 마지막에 추가 될 수 있도록 '&'기호 추가 --%>
         		<c:when test="${!empty paramValues.ct || !empty param.sVal }">
         			<c:set var="url" value="${searchParameter}&cp="/>
         			<c:set var="listUrl" value="../search/${url}${hInfo.currentPage}" scope="session"/>
         			
         		</c:when>
         		
         		<%-- 검색 조건 존재하지 않는 경우(파라미터 cp가 쿼리스트링 제일 앞에 추가 될 수 있도록 '?'기호 추가 --%>
         		<c:otherwise>
         			<c:set var="url" value="${searchParameter}?cp="/>
         			<c:set var="listUrl" value="../list/${url}${fInfo.currentPage}" scope="session"/>
         		</c:otherwise>
         		
         	</c:choose>
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
        			

        			var helpNo = $(this).parent().parent().children().eq(0).text();
        			var helpUrl = "${contextPath}/help/no=" + helpNo + "?cp=${hInfo.currentPage}";
        			
        			location.href = helpUrl;      			
        		});	
        	});
        	
        	$(function(){
        		$("#writeBtn").on("click",function(){
        			
        			if(${loginMember.memberGrade == 'A'}){
        				alert("관리자 계정으로 로그인하셨습니다.");
        				return false;
        			}    			
        		});	
        	});
        	
        	$("#limit").change(function(){
        	
        	var formControl = $("#limit option:selected").val();
        	
        	$("#bb").text(formControl);
        	
        	
        	});
        	
        	//------------------검색버튼 동작--------------------
            $("#searchBtn").on("click", function(){
            	
          	  //검색 값에 따라 url을 조합하여 저장할 변수
          	  var searchUrl = "";
          	  
          	  //검색에 필요한 요소(카테고리, 검색 조건, 검색어) 읽어오기
          	  var $ct = $("input[name='ct']:selected");
                var $sKey = $("select[name='sKey']");
                var $sVal = $("input[name='sVal']");
                
                alert($ct);
          	  
          	  //1) 검색에 필요한 카테고리 또는 검색어가 입력 되었는지 확인
          	  //	-입력이 되지 않은 경우 -> 해당 게시판 첫 페이지로 돌아가는 url 생성
          	  // 	- 하나라도 입력된 경우 -> 검색 url 생성(쿼리스트링 조합 작업 필요)
          	  
          	  //데이터 형태 확인
          		  $ct.each(function(index,item){
          			  console.log($(item).val());
          		  });
          	  console.log($sKey.val());
          	  console.log($sVal.val());
          	  
          	  //선택된 카테고리의 개수가 0이고, 입력된 검색어의 길이가 0인경우
          	  // == 카테고리 체크 X, 검색어 입력 X 상태로 검색버튼을 클릭한 경우
          	  // -> 해당 게시판의 첫 페이지로 이동
          	  if($ct.value == '분류' && $sVal.val().trim().length == 0){
          		  searchUrl = "1";
          	  }
          	  
          	  //카테고리가 체크 되었거나, 검색어가 입력된 경우 또는 둘 다
          	  else{
          		searchUrl = "../search/?"; //검색 요청 url
          		
          		//카테고리가 체크된 경우
          		if($ct.length != 0){
          			//$ct 배열에 반복 접근하여 쿼리스트링에 추가
          			$ct.each(function(index, item){
          				//ct=운동&ct=영화&ct=음악&ct=기타
          				if(index != 0) searchUrl += "&";
          				searchUrl += "ct=" + $(item).val();
          			});
          			
          			//카테고리 반복 접근이 끝난 후 
          			//검색어가 있을 경우 쿼리스트링을 이어서 작성할 수 있도록 '&' 기호 추가
          			if($sVal.val().trim().length != 0) searchUrl += "&";
          		}
          		
          		//검색어가 입력된 경우
          		if($sVal.val().trim().length != 0){
          			
          			searchUrl += "sKey=" + $sKey.val() + "&sVal=" + $sVal.val();
          		}
          		
          		
          		
          	  }//else end
          	  
       
          	  //2) location.href를 통해 검색 요청 전달
          	  location.href = searchUrl;
          	  
            });
            
            // -------------------- 검색값 유지 ----------------------------
            $(function(){
          	  var sKey = "${param.sKey}";
          	  var sVal = "${param.sVal}";
          	  //EL구문에서 값이 없을 경우 ""(빈 문자열)이 반환됨.
          	  
          	  if(sKey != "" && sVal != ""){
          		  //검색어 세팅
          		  $("input[name='sVal']").val(sVal);
          		  
          	  
      	    	  //검색 조건 세팅
      	    	  $("select[name='sKey'] > option").each(function(index, item){
      	    		  if($(item).val() == sKey){
      	    			  $(item).prop("selected", true);
      	    		  }
      	    	  });
          	  
          	  }
          	  //카테고리 카테고리(체크박스 ) 값 세팅
          	  //script 태그 내에 EL/JSTL 사용하기
          	  
          	  //HTML, JS/jQuery, Scriptlet(Java), EL/JSTL
          	  //서버 동작시 JSP 파일 코드 해석 순서
          	  //1) Java, 2) EL/JSTL, 3) HTML , 4) JS/jquery
          	  
          	  //EL/JSTL 구문은 JS/jQuery보다 해석이 빠르므로
          	  //JS 구문 내에 EL/JSTL 구문을 작성하여 혼용 할 수 있다.
          	  <c:forEach var="ctName" items="${paramValues.ct}">
          	  		$("input[name='ct']").each(function(index,item){
          	  			if($(item).val() == "${ctName}"){
          	  				$(item).prop("checked", true);
          	  			}
          	  		});
      		  </c:forEach>    		  
        
            });
            
            
            // --------------------검색창 엔터 이벤트 -------------------
            $("input[name='sVal']").on("keyup", function(event){
          	  console.log(event.keyCode); //키업 이벤트가 발생 했을때 입력한 키코드가 출력됨
          	  if(event.KeyCode == 13){
          		  $("#searchBtn").click(); //검색 버튼 클릭
          	  }
            });
            
        	
        	       
        </script>
        
    </body>
</html>