<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        #list-table td{
        cursor : pointer;
        }
        
        .boardTitle > img{
           width: 50px;
           height: 50px;
        }
        
        .trBold{
        	font-weight: bold;
        }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container">

		<div class="row">

			<div class="col-lg-3">
				<h1 class="my-4 card-header">방 정보</h1>
				<div class="list-group">
					<p>카테고리 : ${roomDetail.roomTypeName}</p>
					<p>방장 : ${roomDetail.memberId}</p>
					<p>회원 수 : ${roomDetail.roomMemberCount}명</p>
					<p>공개 여부 :
					<c:set var="roomOpenValue" value="${roomDetail.roomOpen}"/> 
						<c:choose>
							<c:when test="${fn:contains(roomDetail.roomOpen, 'Y')}">
								공개
							</c:when>
							<c:otherwise>
								비공개
							</c:otherwise>
						</c:choose>
					</p>
					<p class="list-group-item fas fa-angle-down" id="moreInfo"
						style="cursor: pointer; color: blue;">&nbsp;더 보기</p>
					<div id="infoList"></div>
					
					<!-- 방장 회원 전용 메뉴-->
					<c:if test="${loginMember.getMemberId() eq roomDetail.memberId}">
					<a href="#" class="list-group-item" id="roomMemberInfo">방 회원 조회</a>
					<a href="#" class="list-group-item">방 정보 수정</a>
					</c:if>

				</div>
				<div>
					<button id="prevAtag" class="btn-secondary" style="margin-top: 10px;" onclick="location.href='../roomList/1'">방 나가기</button>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9"> 

				<div class="card mt-4">
					<div class="card-body">
						<h3 class="card-title">${roomDetail.roomTitle}</h3>
					</div>
				</div>
				<!-- /.card -->

				<div class="card card-outline-secondary my-4">
					<div class="card-body">
						<table class="table" id="list-table">
							<thead>
								<tr>
									<th>글 번호</th>
									<th>말머리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회</th>
									<th>좋아요</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>


						<div class="my-4">
							<ul class="pagination" style="justify-content: center;">

							</ul>
						</div>

						<c:if test="${!empty loginMember}">
								<a class="btn btn-primary float-right" href="${contextPath}/roomBoard/${roomDetail.roomNo}/boardInsertView">글쓰기</a>
						</c:if>
						
							<select name="sKey" class="form-control"
								style="width: 100px; display: inline-block;">
								<option value="title">글제목</option>
								<option value="boardGroup">말머리</option>
								<option value="writer">작성자</option>
							</select> <input type="text" name="sVal" class="form-control" style="width: 25%; display: inline-block;">
							<button class="form-control btn btn-primary" id="searchBtn"
								style="width: 100px; display: inline-block;">검색</button>
					</div>
				</div>
				<!-- /.card -->

			</div>
			<!-- /.col-lg-9 -->

		</div>

	</div>

	<jsp:include page="../common/footer.jsp" />
	
	        <script>
            var enterChk = false;
            
            $("#infoList").on("click", 	"#outRoom", function() {
            	console.log(1);
            	var withDrawChk = confirm("정말 해당 방을 탈퇴 하시겠습니까?");
            	if(withDrawChk) {
	            	location.href= "${contextPath}/room/roomDetail/withDraw/${roomDetail.roomNo}?memberNo=${loginMember.memberNo}";
            	}
            });
            
            $("#moreInfo").on("click", function() {
                if(!enterChk) {
                	<jsp:useBean id="now" class="java.util.Date"/>
                	
                    <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate var="createDate" value="${roomDetail.roomCreateDate}" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate var="createTime" value="${roomDetail.roomCreateDate}" pattern="hh:mm:ss"/>
                    
                    
                    <c:choose>   
                    	<c:when test="${today == createDate}">
                    	   
                    	   var $p1 = $("<p>").html("<br><h6>방 생성날짜 : ${createTime}</h6><br>");
                    	</c:when>
                    	<c:otherwise>
                     	  
                     	 	var $p1 = $("<p>").html("<br><h6>방 생성날짜 : ${createDate}</h6><br>");
                    	</c:otherwise>
                 	</c:choose>
                            
                    
                    $("#infoList").append($p1);
                    <c:if test="${!empty loginMember}">
	                    var $p2 = $("<p>").html("현재 방 내에서 채택된 답변 수 : ${writeBoardReplyAdoptionCount} <br> 작성한 글 수  : ${writeBoardCount}<br> 작성한 댓글 수 : ${writeBoardReplyCount}<br>");
	                    var $button = $("<button>", {type : "button" , id : "outRoom", class : "btn-primary"}).attr("onclick","${contextPath}/room/roomDetail/withDraw/${roomDetail.roomNo}?memberNo=${loginMember.memberNo}").text("방 탈퇴");
	                    $("#infoList").append($p2, $button);
                    </c:if>
                    $("#moreInfo").hide();
                    enterChk = true;
                }
            });
            
            
         	// 게시글 상세보기 기능 구현
            $(function(){
	          	  $("#list-table > tbody").on("click", "td", function(){
	          		  var roomBoardNum = $(this).parent().children().eq(0).text();
	      				
	          		  var roomBoardUrl =
	          			  "${contextPath}/roomBoard/"+ ${roomDetail.roomNo} + "/" + roomBoardNum/*  +"?cp=${pInfo.currentPage}" */;	
	          					  
	          		// 게시글 상세조회 요청
	          		location.href = roomBoardUrl;
	          	  });
	          	  
	          	// ---------------------- 검색 버튼 동작 ---------------------------------
		            $("#searchBtn").on("click", function() {
		          	  // 검색 값에 따라 url을 조합하여 저장할 변수
		          	  var searchUrl = "";
		          	  
		          	  // 검색에 필요한 요소(카테고리, 검색 조건, 검색어) 읽어오기
		          	  var $sKey = $("select[name='sKey']");
		          	  var $sVal = $("input[name='sVal']");
		          	  
		          	  // 1) 검색에 필요한 카테고리 또는 검색어가 입력 되었는지 확인
		          	  // - 입력이 되지 않은 경우 -> 해당 게시판 첫 페이지로 돌아가는 url 생성
		          	  // - 하나라도 입력된 경우 -> 검색 url 생성(쿼리스트링 조합 작업 필요)
		          	  // if() {}
		          	  
		          	  // 선택된 카테고리의 개수가 0 이고, 입력도니 검색어의 길이가 0인 경우
		          	  // == 카테고리 체크 X, 검색어 입력 X 상태로 검색버튼을 클릭한 경우
		          	  if($sVal.val().trim().length == 0) {
		          		  searchUrl = "${roomDetail.roomNo}";
		          	  }
		          	  
		          	  // 카테고리가 체크 되었거나, 검색어가 입력된 경우 또는 둘다
		          	  else {
		          		  /* searchUrl = "search/${roomDetail.roomNo}?"; // 검색 요청 url */
		          		  searchUrl = "${roomDetail.roomNo}?";
		          		
		          		  // 검색어가 입력된 경우
		          		  if($sVal.val().trim().length != 0) {
		          			  searchUrl += "sKey=" + $sKey.val() + "&sVal=" + $sVal.val();
		          		  }
		          		  
		          	  }
		          	  
		          	  // 2) location.href를 통해 검색 요청 전달
		          	  location.href = searchUrl;
		            });
		            
		            // --------------- 검색 값 유지 --------------------------------
		            $(function() {
		          	  var sKey = "${param.sKey}";
		          	  var sVal = "${param.sVal}";
		          	  
		          	  // EL 구문에서 값이 없을 경우 ""(빈문자열)이 반환됨
		          	  
		          	  if(sKey != "" && sVal != "") {
		          		  // 검색어 세팅
		          		  $("input[name='sVal']").val(sVal);
		          		  
		          		  // 검색 조건 세팅
		          		  $("select[name='sKey'] > option").each(function(index, item){
		          			  if($(item).val() == sKey) {
		          				  $(item).prop("selected", true);
		          			  }
		          		  });
		          	  }
		          	  
		            });
		            
		         // --------------- 검색창 엔터 이벤트 --------------------------------
		         $("input[name='sVal']").on("keyup", function(event){
		      	   // console.log(event.keyCode); // 키업 이벤트가 발생할 경우 입력한 키 값이 출력 됨.
		      	   
		      	   if(event.keyCode == 13) { // 엔터키가 눌러졌을 경우
		      		   $("#searchBtn").click(); // 검색 버튼 클릭
		      	   }
		      	   
		         });
		         
	          	  
	          	if("${param.sVal}" != "") {
	          		var url = "${contextPath}/roomBoard/boardList/${roomDetail.roomNo}?cp=${param.cp}&sKey=${param.sKey}&sVal=${param.sVal}";
	          	} else {
	          		var url = "${contextPath}/roomBoard/boardList/${roomDetail.roomNo}?cp=${param.cp}";
	          	} 
	  			
				$.ajax({
					url : url,
					type : "POST",
					dataType:"json",
					success : function(object){
						var currentPage = object.pInfo.currentPage;
						var endPage = object.pInfo.endPage;
						var startPage = object.pInfo.startPage;
						var pagingBarSize = object.pInfo.pagingBarSize;
						var boardType = object.pInfo.boardType;
						var maxPage = object.pInfo.maxPage;
						
						
						$.each(object.rbList, function(i){
							$table = $("#list-table > tbody");
							
							if(object.rbList[i].roomBoardType == '공지') {
								$tr = $("<tr>").addClass("trBold");
							} else {
								$tr = $("<tr>");
							}
							
							
							$td1 = $("<td>").text(object.rbList[i].roomBoardNo);
							$td2 = $("<td>").text(object.rbList[i].roomBoardType);
							$td3 = $("<td>").addClass("boardTitle");
							for (var j = 0; j < object.thList.length; j++) {
								
								if (object.thList[j].parentBoardNo == object.rbList[i].roomBoardNo) {
									var src = "${contextPath}" + object.thList[j].filePath + "/" +  object.thList[j].fileChangeName;
									$thImg = $("<img>").attr("src",src);
									$td3.append($thImg);
								}
							}
							
							 $td3.append(object.rbList[i].roomBoardTitle);
							
							$td4 = $("<td>").text(object.rbList[i].roomBoardWriter);
							$td5 = $("<td>").text(object.rbList[i].roomBoardCreateDate);
							$td6 = $("<td>").text(object.rbList[i].roomBoardReadCount);
							$td7 = $("<td>").text(object.rbList[i].roomBoardLikeCount);
							
							$tr.append($td1,$td2,$td3,$td4,$td5,$td6,$td7);
		
							$table.append($tr);
							
						});
						
						
						if(currentPage > pagingBarSize) {
							
							$li1 = $("<li>")
							if("${param.sVal}" != "") {
								$a1 = $("<a>").addClass("page-link text-primary").attr("href",boardType+"?cp=1&sKey=${param.sKey}&sVal=${param.sVal}").html("&lt;&lt;");
							} else {
								$a1 = $("<a>").addClass("page-link text-primary").attr("href",boardType+"?cp=1").html("&lt;&lt;");
							}
							
							
							
							var operand1 = (currentPage - 1) / pagingBarSize;
			                var prev = operand1 * 10;
		                    
		                    $li2 = $("<li>")
		                    if("${param.sVal}" != "") {
								$a2 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + prev + "&sKey=${param.sKey}&sVal=${param.sVal}").html("&lt;");
		                    } else {
								$a2 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + prev).html("&lt;");
		                    }
		                    
							$li1.append($a1);
							$li2.append($a2);
							$(".pagination").append($li1, $li2);
						}
						
		                
		                
		                for (var p = startPage; p <= endPage; p++) {
							if (currentPage == p) {
				                   $li3 = $("<li>")
								   $a3 = $("<a>").addClass("page-link").html(p);
							} else {
		                          $li3 = $("<li>")
		                          if("${param.sVal}" != "") {
								  	$a3 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + p + "&sKey=${param.sKey}&sVal=${param.sVal}").html(p);
		                          } else {
								  	$a3 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + p).html(p);
		                          }
		                          
							}
	                        $li3.append($a3);
	                        $(".pagination").append($li3);
						}
		                
		                
		               
		               if (maxPage > endPage) {
		            	   var operand2 = (currentPage + (pagingBarSize-1)) / pagingBarSize;
		            	   var next = operand2 * pagingBarSize + 1;
		            	   $li4 = $("<li>")
		            	   if("${param.sVal}" != "") {
							   $a4 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + next + "&sKey=${param.sKey}&sVal=${param.sVal}").html("&gt;");
		            	   } else {
							   $a4 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + next).html("&gt;");
		            	   }
		            	   
		            	   $li5 = $("<li>")
		            	   if("${param.sVal}" != "") {
						   	   $a5 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + maxPage + "&sKey=${param.sKey}&sVal=${param.sVal}").html("&gt;&gt;");
		            	   } else {
		            		   $a5 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + maxPage).html("&gt;&gt;");
		            	   }
		            	   
		            	   
		            	   $li4.append($a4);
		            	   $li5.append($a5);
		            	   $(".pagination").append($li4, $li5);
						} 
						
					},error : function(){
						console.log("통신 실패");
					}
				});
				

				
            });
         	
            
            

        </script>
</body>
</html>