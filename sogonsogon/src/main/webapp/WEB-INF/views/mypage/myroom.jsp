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
        @font-face { font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff'); font-weight: normal; font-style: normal; }

        .room-box {
         width: 1200px;
         height: 35%;
         justify-content: center;
         flex-wrap: unset;
         font-family: 'GmarketSansMedium';
         margin: 0px;
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

   .border {
     fill: none;
     stroke: #ff8c1a;
     stroke-width: 5;
     stroke-miterlimit: 10;
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
      .my-4{
         margin-right: 300px !important;
      }
      
      button {
       width:100px;
       background-color: #ffc107;
       border: none;
       color:#fff;
       padding: 8px 0;
       text-align: center;
       text-decoration: none;
       display: inline-block;
       font-size: 15px;
       margin: 5px !important;
       cursor: pointer;
       border-radius: 16px !important;
       font-size: 14px !important;
       font-weight: bold;
}

 button:hover{
    background-color: #e86c00;
 }
   .nonspace{
      font-family: 'NEXON Lv1 Gothic OTF Light'; 
      font-size: 18px;
      text-align: center;
   }
   h3{
      font-family: 'NEXON Lv1 Gothic OTF Bold'; 
      text-align: center;
      
   }
   
   @font-face { font-family: 'NEXON Lv1 Gothic OTF Light'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff') format('woff'); font-weight: normal; font-style: normal; }
   @font-face { font-family: 'NEXON Lv1 Gothic OTF Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Bold.woff') format('woff'); font-weight: normal; font-style: normal; }
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
      <h3 class="mb-5"><div>참여한 스터디방</div></h3>
     <c:choose>
     <c:when test="${empty roomList}">
        <div class="nonspace">
           <div> 가입한 방이 없습니다 <br> 새로운 방을 만들어주세요!</div>
              <br>
              <div>
                 <button onclick="location.href='../room/roomList/1'">방 리스트 보기</button>
                 <button onclick="location.href='${contextPath}/room/insertRoom'" style="width: 80px;">방 만들기</button>
              </div>
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
      
     
     </div>
 </div>    
      
   <jsp:include page="../common/footer.jsp" />

<script>
$(".join-button").on("click",function(){
         var roomNo = $(this).attr("id");

         $(".hiddenNo").val(roomNo);

      location.href="${contextPath}/room/roomDetail/"+ roomNo;
      
});

</script>
</body>
</html>