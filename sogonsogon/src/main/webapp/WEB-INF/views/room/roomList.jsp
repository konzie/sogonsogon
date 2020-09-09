<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .room-box {
            width: 100%;
            height: 650px;
           /*  display: flex; */
            justify-content: center;
            flex-wrap: unset;
            font-family: 'GmarketSansMedium';
            text-align: center;
        }

        .roomlist-box {
            width: 360px;
            height: 220px;
            border-radius: 2.5px;
            box-sizing: border-box;
            border: 2px solid black;
            margin: 50px;
            display: inline-block;
            text-align: center;
            box-shadow: 14px 14px rgb(255, 178, 181), -14px 14px rgb(255, 178, 181);
            position: relative;
        }

        .roomlist-box>img{
            width: 70px;
            position: absolute;
            margin: auto;
            top: 0; bottom: 240px; left: 0; right: 0;
        } 

        #tagbox{
           width: 100%;
           height: 25px;
           text-align: center;
           position: relative;
           margin: 5px auto;
        }

        .tags{
            font-size: 14px;
            background-color: rgba(116, 116, 116, 0.1);
            display: inline-block;
            margin: 4px 4px 0px 4px;
            border-radius: 3px;
            padding: 2px;
        }
        
        .join-button{
            width: 90px;
            height: 30px;
            background-color: rgb(248, 162, 113);
            border-radius: 14px;
            margin: auto;
            color: white;
            line-height: 200%;
            margin-top: 18px;
            cursor: pointer;
        }
        .category{
            font-size: 14px;
            margin:28px 0px 2px 0px;
        }
        .review-box>p{
            clear: both;
        }
        .room-title{
            font-size: 20px;
            margin:0px;
        }
        .enter-number{
           margin-bottom:1px;
            font-size: 13px;
        }
        
        .top-area{
           width: 100%;
           height: 100px;
           text-align: center;
           margin-top: 40px;
        }
        .empty{
           width: 100%;
           height: 40px;
        }
        
        /*  */
        
	    .table-title {
	      color: #fff;
	      background: #ff9d38;      
	      padding: 16px 25px;
	      margin: -20px 160px 10px;
	      border-radius: 3px 3px 0 0;
	   }
    
      .pageN{
          width: 100%;
          height: 50px;
          text-align: center;
       }
      .pagination2 {
        display: inline-block;
      }
      
      .pagination2 a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
        border: 1px solid #ddd;
      }
      
      .pagination2 a.active {
        background-color:  rgb(248, 162, 113);
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
      
      .selectList{
         text-align: center;
      }
      
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
   
      .modal-button2{
         width: 100px;
         height: 35px;
         border-radius: 18px;
         background-color: rgb(248, 162, 113);
         line-height: 200%;
         float: left;
         color: white;
         text-decoration: none;
         margin: 0px 6px;
     }
      .modal-body{
        text-align: center;
      }
     
       .button-area {
            height: 40px;
            width: 100%;
        }
        
        .button-area .btn{
           width: 80px;
          height: 38px;
          padding: 0px;
          border-radius: 10px;
          font-size: 18px;
          font-family: 'GmarketSansMedium'; 
        }
        .modal-body img{
           width: 70px;
        }
        .modal-btn-area2{
        margin: 10px auto;
        width: 50%;
        box-sizing: border-box;
        top: 0px;
        bottom: 0px;
        left: 0px;
        right: 0px;
        }

        .m-title{
        height: 20%;
        font-size: 24px;
        margin: 0px 8px 0px 0px;
   }
      .m-passnotice{
         font-size: 13px;
      }

       .clear-btn{
         border: 2px solid white;
         color: white;
         text-align: center;
         text-decoration: none;
         width: 90px;
         height: 30px;
         border-radius: 14px;
         line-height: 160%;
         cursor: pointer;
      }
      

</style>
</head>
<body>
   <jsp:include page="../common/header.jsp" />
   
   <div class="empty"></div>
   
   <div class="table-title">
            <h2>Study Room</h2>
            <c:if test="${!empty loginMember}">
             <a href="${contextPath}/room/insertRoom"><div class="clear-btn">방만들기</div></a>            
            </c:if>
   </div>

	<hr>

      <div class="selectList">
         <select>
                  <option value="1">IT</option>
                  <option value="2">공모전</option>
                  <option value="3">면접</option>
                  <option value="4">전공</option>
                  <option value="5">외국어</option>
                  <option value="6">기타</option>
          </select>
       </div>

	<%--네모 박스 --%>
   <c:set var="roomList" value="${roomList}"/>
    <div class="room-box">
    <c:forEach var="roomList" items="${roomList}">
        <div class="roomlist-box">
            <img src="${contextPath}/resources/images/clip.png">
          	
          	<c:choose>
           		<c:when test="${roomList.roomType ==1}">
           			<c:set var="tag" value="IT"/>
           		</c:when>
           		 <c:when test="${roomList.roomType ==2}">
           			<c:set var="tag"  value="공모전"/>
           		</c:when>
           		<c:when test="${roomList.roomType ==3}">
           			<c:set var="tag"  value="면접"/>
           		</c:when>
           		<c:when test="${roomList.roomType ==4}">
           			<c:set var="tag"  value="전공"/>
           		</c:when>
           	    <c:when test="${roomList.roomType ==5}">
           			<c:set var="tag"  value="외국어"/>
           		</c:when>
           		  	    <c:when test="${roomList.roomType ==6}">
           			<c:set var="tag"  value="기타"/>
           		</c:when>
            </c:choose>
            
            <fmt:formatDate var="createDate" value="${roomList.roomCreateDate}" pattern="yyyy-MM-dd"/>
            
            <p class="room-content">
                <p class="category" id="${tag}">[${tag}]</p>
                <p class="room-title">${roomList.roomTitle}</p>
                <p class="enter-number">
                    방장 : ${roomList.memberNick}<br>
                    참가인원 : /10명
                    │ 개설일 : ${createDate}
             </p>
			
			<c:set var="tags" value="${fn:split(roomList.roomTag, ',')}"/>
	
            <div id="tagbox">
             <c:forEach var="tag" items="${tags}">
                <div class="tags">#${tag}</div> 
             </c:forEach>
            </div>
            
            <a data-toggle="modal"  data-target="#myModal">
            	<div class="join-button" id="${roomList.roomNo}">참여하기</div>
            </a>
      </div> <!-- roomlist end-->
      </c:forEach>
    </div><!--room-container end-->
      
      <hr>
      <!-- 방만들기 영역 -->
     

      
     <!-- 페이징 -->
	<c:set var="url" value="/sogon/room/roomList?cp="  />
   <div class="pageN">
      <div class="pagination2">
      
        <a href="${url}1">&laquo;</a> <%-- '<<' --%>
        
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
       
       <!-- 검색 영역 -->
       <div class="top-area">    
               <div class="search-box">
                <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
                <form action="" class="search-form">
                    <input type="text" placeholder="Search" id="search" autocomplete="off">
                </form>
                <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
                 xml:space="preserve">
              <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
              <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
            </svg>
                <div class="go-icon"><i class="fa fa-arrow-right"></i></div>
            </div>
      </div> <!-- top-area end -->
      
      
              
     <!-- Modal -->
     <div class="modal fade" id="myModal" role="dialog">
       <div class="modal-dialog ">
         <div class="modal-content">
           <div class="modal-header">입장하기
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title"></h4>
           </div>
           <div class="modal-body">

               <p class="m-title"></p>
               <p class="m-content" style="margin-bottom: 6px;"></p>
              
              
              <div class="pass-area">
                 <img src="${contextPath}/resources/images/lock.png">
                 <p style="margin: 0px;">참여 번호 입력</p>
                 <p class="m-passnotice">
                       참여 비밀 번호가 필요한 채팅방입니다.<br>
                       방장이 알려준 참여 비밀 번호를 입력해 주세요.
                 </p>
                  <input type="password" placeholder="영문/숫자 4~10자리"  name="inputPwd	"> 
  	<input type="hidden"  class="hiddenNo" name="roomNo"> <!--  hiddenNo 영역보일시 display:none처리-->
              </div>

            
            <div class="modal-btn-area2" > 
              	<button type="button"  class="modal-button2" data-dismiss="modal">뒤로가기</button>
                <button type="button"  class="modal-button2" id="modal-btn">참여하기</button>
            </div>
      
           </div>
           
         </div>
       </div>
     </div> <!-- modal end -->
   
   
   <jsp:include page="../common/footer.jsp" />
   
     
<script>

// 방번호 넘기기 위한 함수
	$(".join-button").on("click",function(){
		   var roomNo = $(this).attr("id");
		   console.log(roomNo);
		   $(".hiddenNo").val(roomNo);

		   
		   	$("#modal-btn").on("click",function(){
				location.href = "${contextPath}/room/roomDetail/"+ roomNo;
			});
		   
			$.ajax({
				url : "${contextPath}/room/roomMList/"+roomNo,
				type : "POST",
				dataType : "JSON",
				success : function(Room){
					console.log(Room);
					$(".m-title").html(Room.roomTitle);
					$(".m-content").html(Room.roomContent);
					
					if(Room.roomOpen == 'Y'){
						$(".pass-area").css("display","none");
					}
					
				},error : function(){
					 console.log("ajax 통신 실패");
				}
			});
	});
	

</script>
</body>
</html>