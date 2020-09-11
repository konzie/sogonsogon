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
					<a href="#" class="list-group-item" id="roomMemberInfo">방 회원
						조회</a> <a href="#" class="list-group-item">공지사항 작성</a> <a href="#"
						class="list-group-item">방 정보 수정</a>
					</c:if>

				</div>
				<div>
					<button id="prevAtag" class="btn-secondary" style="margin-top: 10px;" onclick="location.href='../roomList'">방 나가기</button>
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
						
						<form action="#" method="get">
							<select name="searchKey" class="form-control"
								style="width: 100px; display: inline-block;">
								<option value="title">글제목</option>
								<option value="boardGroup">말머리</option>
								<option value="writer">작성자</option>
							</select> <input type="text" name="searchValue" class="form-control"
								style="width: 25%; display: inline-block;">
							<button class="form-control btn btn-primary"
								style="width: 100px; display: inline-block;">검색</button>
						</form>
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
            $("#moreInfo").on("click", function() {
                if(!enterChk) {
                    /* var $p1 = $("<p>").html("<br><h6>방 생성날짜 : ${roomDetail.roomCreateDate}</h6><br> 현재 방 내에서 채택된 답변 수 : 10 <br> 작성한 글 수  : 1<br> 작성한 글 수 : 3<br>"); */
                    var $p1 = $("<p>").html("<br><h6>방 생성날짜 : ${roomDetail.roomCreateDate}</h6><br>");
                    $("#infoList").append($p1);
                    <c:if test="${!empty loginMember}">
	                    var $p2 = $("<p>").html("현재 방 내에서 채택된 답변 수 : 10 <br> 작성한 글 수  : 1<br> 작성한 글 수 : 3<br>");
	                    var $button = $("<button>", {type : "button" , id : "outRoom", class : "btn-primary"}).text("방 탈퇴");
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
	          	  	
	          	var url = "${contextPath}/roomBoard/boardList/${roomDetail.roomNo}?cp=${param.cp}";
	  			
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
						
						console.log(object.thList);

						
						$.each(object.rbList, function(i){
							$table = $("#list-table > tbody");
							$tr = $("<tr>");
							$td1 = $("<td>").text(object.rbList[i].roomBoardNo);
							$td2 = $("<td>").text(object.rbList[i].roomBoardType);
							$td3 = $("<td>").addClass("boardTitle");
							for (var j = 0; j < object.thList.length; j++) {
								
								if (object.thList[j].parentBoardNo == object.rbList[i].roomBoardNo) {
									var src = "${contextPath}" + object.thList[j].filePath + "/" +  object.thList[j].fileChangeName;
									console.log(src);
									$thImg = $("<img>").attr("src",src);
									$td3.append($thImg);
								}
							}
							
							 $td3.append(object.rbList[i].roomBoardTitle);
							
							$td4 = $("<td>").text(object.rbList[i].roomBoardWriter);
							$td5 = $("<td>").text(object.rbList[i].roomBoardCreateDate);
							$td6 = $("<td>").text(object.rbList[i].roomBoardReadCount);
							$td7 = $("<td>").text("0");
							
							$tr.append($td1,$td2,$td3,$td4,$td5,$td6,$td7);
							$table.append($tr);
							
						});
						
						
						if(currentPage > pagingBarSize) {
							
							$li1 = $("<li>")
							$a1 = $("<a>").addClass("page-link text-primary").attr("href",boardType+"?cp=1").html("&lt;&lt;");
							
							
							var operand1 = (currentPage - 1) / pagingBarSize;
			                var prev = operand1 * 10;
		                    
		                    $li2 = $("<li>")
							$a2 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + prev).html("&lt;");
		                    
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
								  $a3 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + p).html(p);
							}
	                        $li3.append($a3);
	                        $(".pagination").append($li3);
						}
		                
		                
		               
		               if (maxPage > endPage) {
		            	   var operand2 = (currentPage + (pagingBarSize-1)) / pagingBarSize;
		            	   var next = operand2 * pagingBarSize + 1;
		            	   $li4 = $("<li>")
						   $a4 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + next).html("&gt;");
		            	   
		            	   $li5 = $("<li>")
						   $a5 = $("<a>").addClass("page-link text-primary").attr("href",boardType + "?cp=" + maxPage).html("&gt;&gt;");
		            	   
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