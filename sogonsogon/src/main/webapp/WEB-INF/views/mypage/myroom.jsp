<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 가입한 방</title>
<style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .room-box {
         width: 1200px;
            height: 35%;
            justify-content: center;
            flex-wrap: unset;
            font-family: 'GmarketSansMedium';
        }
        .roomlist-box {
            width: 320px;
            height: 220px;
            border-radius: 2.5px;
            box-sizing: border-box;
            border: 2px solid black;
            margin: 0px 30px 50px 30px;
            display: inline-block;
            text-align: center;
            box-shadow: 14px 14px rgb(255, 178, 181), -14px 14px rgb(255, 178, 181);
            position: relative;
            overflow: hidden;
        }

        .roomlist-box>img{
            width: 30%;
            position: absolute;
            margin: auto;
            top: 0;
            bottom: 240px;
            left: 0;
            right: 0;
        } 
       
        #clip-imgs{
            width: 160px;
            position: absolute;
            margin: auto;
            top: 0;
            bottom: 194px;
            left: 0;
            right: 0;
        }

        #tagbox{
           width: 100%;
           height: 25px;
           text-align: center;
           position: relative;
           margin: auto;
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
            margin-top: 14px;
            cursor: pointer;
        }
        .category{
            font-size: 14px;
            margin:10px 0px 2px 0px;
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
        background-color:  #212121;
        color: white;
        border: 1px solid #4CAF50;
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
       background-color: cornflowerblue;
       line-height: 200%;
       float: left;
       color: white;
       text-decoration: none;
     }
     .modal-body{
        text-align: center;
     }
     
      .content{
      float:left;
      width:100%;
      height:100%;
      }
      
      .content2{
      float:left; 
      width: 78%;
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
      <h4 class="mb-5">참여한 스터디방</h4>
     <c:choose>
     <c:when test="${empty roomList}">
        <div> 가입한 방이 없습니다</div>
        <div>
           <button onclick="location.href='../room/roomList/1'">방 리스트 보기</button>
           <button onclick="location.href='${contextPath}/room/insertRoom'">방 만들기</button>
        </div>
     </c:when>
     <c:otherwise>
   <c:set var="roomList" value="${roomList}"/>
    <div class="room-box">
    <c:forEach var="roomList" items="${roomList}">
        <div class="roomlist-box">
        <div id="flag" style="top:-20px"></div>
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
               <div class="category" id="${tag}">${tag}.</div>
               <p class="room-title">${roomList.roomTitle}</p>
            <span class="count1">참가인원 : ${roomList.roomMemberCount}</span>
            <span  class="count2">/${roomList.roomMaxNumber}명</span>
         <div style="font-size: 14px; margin-bottom: 2px; margin-top: 2px">개설일 : ${createDate}</div>
            <div style="font-size: 14px; margin-bottom: 2px;">방장 : ${roomList.memberNick}</div>

         <c:set var="tags" value="${fn:split(roomList.roomTag, ',')}"/>
   
             <c:set var="roomNo" value="${roomList.roomNo}" />
            <div id="tagbox">
             <c:forEach var="tag" items="${tags}">
                <div class="tags">#${tag}</div> 
             </c:forEach>
           </div>
  
      <c:choose>
            <%-- test는 el만 적을 수 있음 (비교, 계산 같은걸 하나 EL 안에 작성가능) --%>
         <c:when test="${roomList.roomMemberCount != roomList.roomMaxNumber}">
               <a data-toggle="modal"  data-target="#myModal">
                  <div class="join-button" id="${roomList.roomNo}" onclick="return validate();"><span>참여하기</span></div>
               </a>
         </c:when>
         <c:otherwise>
               <a data-toggle="modal" >
                  <div class="join-button noPart" id="${roomList.roomNo}" onclick="return validate();">참여불가</div>
               </a>
         </c:otherwise>
      </c:choose>
           
      </div> <!-- roomlist end-->
      </c:forEach>
    </div><!--room-container end-->
    
     </c:otherwise>
     </c:choose>
     
      
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
      
     <!-- Modal -->
     <div class="modal fade" id="myModal" role="dialog">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">
           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title"></h4>
           </div>
           <div class="modal-body">

                <p>초보 자바 개발자들 모임</p>
               <p>방소개</p>
               <input type="password"> 
            
                <a data-dismiss="modal"><div class="modal-button2">뒤로가기</div></a>
                <a href="roomDetail"><div class="modal-button2">참여하기</div></a>
           </div>
         </div>
       </div>
     </div> <!-- modal end -->
     
     
     </div>
 </div>    
   <jsp:include page="../common/footer.jsp" />

<script>
$(".join-button").on("click",function(){

      $(".pass-area").css("display","block");   
         var roomNo = $(this).attr("id");
         // console.log(roomNo);
         $(".hiddenNo").val(roomNo);
      
         $(".transPage").prop("action", "${contextPath}/room/roomDetail/"+ roomNo);
         
         $.ajax({
            url : "${contextPath}/room/roomMList/"+roomNo,
            type : "POST",
            dataType : "JSON",
            success : function(map){
               $(".m-title").html("\""+map.room.roomTitle+"\''");
               $(".m-content").html(map.room.roomContent);
               
               // 비공개 방인경우 비밀번호 입력창 사라짐
               if(map.room.roomOpen == 'Y' ){
                  $(".pass-area").css("display","none");
                  
               }
               
               // 로그인한 멤버가 이미 가입한 방일때 
               for(var i=0; i<map.roomMember.length; i++){
                  if(roomNo == map.roomMember[i].roomMemberRoomNo){
                     $(".pass-area").css("display","none");
                     $(".m-content").append("<br>+이미 가입한 방입니다.");
                  }
               } 
      
            },error : function(){
                console.log("ajax 통신 실패");
            }
         });
    // else end
});

</script>
</body>
</html>