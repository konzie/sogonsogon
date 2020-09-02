<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            width: 100%;
            height: 350px;
            display: flex;
            justify-content: center;
            flex-wrap: unset;
            font-family: 'GmarketSansMedium';
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
            text-align: center;
        }

        .roomlist-box>img{
            width: 70px;
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
           margin-top: 5px;
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

      .table-title {
      color: #fff;
      background: #ff9d38;      
      padding: 16px 25px;
      margin: -20px 160px 10px;
      border-radius: 3px 3px 0 0;
    }

      .content{
          width: 100%;
          height: 100%;
  		  margin: -20px 160px 10px;
          margin-top:10px;
      }
                
      .mypageNav {
          width: 20%;
          color: #fff;
          background: #ff9d38;  
          float:left; 
          padding:0;
      }
      
      .content2{
      	width:80%; 
        float:left; 
        padding:0;
      	
      }
      
      .mypageNav>ul{
          margin:0;
          padding:0;
          height:100%;
      }
      
      .mypageNav>ul li{
          list-style-type: none;
          width:100%;
          height:20%;
          font-size:18px;
          line-height: 40px;
          text-align: center;
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
            <ul class="navbar-nav">
                <li><a href="${contextPath}/mypage/myroom"> <img src="${contextPath}/resources/images/meeting.png" width="50px" height="50px">참여 스터디 방</a></li>
                <li><a href="${contextPath}/mypage/myboard"> <img src="${contextPath}/resources/images/classroom.png" width="50px" height="50px">내가 작성한 글</a></li>
                <li><a href="${contextPath}/mypage/myreply"> <img src="${contextPath}/resources/images/answer.png" width="50px" height="50px">채택된 댓글</a></li>
                <li><a href="${contextPath}/mypage/myInfo"> <img src="${contextPath}/resources/images/personal-information.png" width="50px" height="50px">내정보</a></li>
            </ul>
       </div>
       <div class="content2">
      <div class="selectList">
         <select>
              <option>IT</option>
              <option>공모전</option>
              <option>면접</option>
              <option>전공</option>
              <option>외국어</option>
              <option>기타</option>
          </select>      
       </div>             

   <%int num=0; %>
    <!-- 1 -->
    <%for(int i=0; i<2; i++){ %>
    <div class="room-box"> <!--review box 1-1-->
        <%for(int j=0; j<2; j++){ %>
        <div class="roomlist-box">
            <img src="${contextPath}/resources/images/clip.png">
            
            <p class="room-content">
                <p class="category">[IT]</p>
                <p class="room-title">초보 자바 개발자들 모임</p>
                <p class="enter-number">
                    방장 : 누구누구님 <br>
                    참가인원 : /10명
                    │ 개설일 : 2020. 05. 12.
                </p>

            <div id="tagbox">
                <div class="tags">#스터디</div> 
                <div class="tags">#코딩</div> 
                <div class="tags">#자바</div> 
                <div class="tags">#개발자</div> 
                <div class="tags">#스프링</div>
            </div>
            <a data-toggle="modal"  data-target="#myModal"><div class="join-button">참여하기</div></a>
            
        </div> <!-- roomlist end-->
       <%num++;} %>
    </div><!--room-container end-->
      <%} %>
      
      
   <div class="pageN">
      <div class="pagination2">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a href="#" class="active">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">&raquo;</a>
      </div>
   </div>
       
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
   </section>
      
   <jsp:include page="../common/footer.jsp" />

<script>
   $(".join-button").on("click",function(){
      
   });
</script>
</body>
</html>