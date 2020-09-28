<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<style>
  
        @font-face {
		    font-family: 'NEXON Lv2 Gothic Bold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
            
        @font-face {
            font-family: 'BBTreeGL';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGL.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        } 
        
		@font-face {
		    font-family: 'Eoe_Zno_L';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
            
	   .empty {
	      width: 100%;
	      height: 60px;
	   }
	   
        .title{
            width: 100%;
            height: 80px;
            font-size: 40px;
            text-align: center;
            color: #EA5A00;
            line-height: 70px;
             font-family: 'NEXON Lv2 Gothic Bold';
            letter-spacing: 4px;
        }

        .boxarea{
            background-color: white;
            border-radius: 50px;
            width: 600px;
            height: 700px;
            margin: auto;
            padding: 35px;
              font-family: 'Eoe_Zno_L';
        }
        
        .btn2, #btn2 {
            background-color: #ffce54;
            border: none;
            border-radius: 16px;
            clear: both;
            color:white;
            height: 30px;
        }
        
        .container {max-width: 720px;}
        
        h3 {font-family: 'GmarketSansMedium';}
        
        #tags{
            width: 80px;
            height: 30px;
            float: left;
            margin-right: 3px;
        }

        .plusbutton{
            background-color: rgb(241, 158, 48);
            width: 15px;
            height: 15px;
            border-radius: 10px;
            line-height: 16px;
            font-size: 20px;
            float: left;
            margin: 5.2px 0px 0px 4px;
            cursor: pointer;
            color: white;
            text-align: center;
        }
        .tagform{
            float: left;
        }
        .tagbox{
            clear: both;
            width: 100%;
            height: 40px;
            margin-bottom: 10px;
        }
        #roomPassword{
            display: none;
        }
        #content{
            height: 140px;
        }
        .container2{
      /*   background-color: #F0EDEB; */
        background-color: #FCF9F7;
        padding-bottom: 50px;
        }
        .bold{
        	font-weight: bold;
        }
</style>
<title>방 만들기</title>
</head>

<body>
 <jsp:include page="../common/header.jsp" />
 
   <div class="container2">
   <div class="empty"></div>
            <div class="title"><img  src="${contextPath}/resources/images/roomInsert-check.png"  width="40px;" style="margin-right: 10px;">방만들기</div>
            <div class="boxarea">
                <form action="createRoom" method="post" role="form" onsubmit="return validate();">
                    <div class="form-group">
                       <label for="exampleFormControlInput1" class="bold">방 이름</label> 
                       <input type="text" class="form-control" id="title" name="roomTitle"
                          placeholder="방 이름을 작성해주세요."  style="width: 530px;" maxlength="17">
                    </div>
                    
                    
                 <div class="form-group">
                    <label for="exampleFormControlInput1" class="bold">공개 여부</label> <br>
                    <input type="radio" id="o" name="roomOpen"  class="open"  value="Y" checked> <label for="o">공개</label>  &nbsp;
                    <input type="radio" id="c" name="roomOpen"  class="open"  value="N"> <label for="c">비공개</label>  
                    <input type="password" name="roomPassword" id="roomPassword"  class="form-control passArea" style="width: 250px;" placeholder="비밀번호를 입력해 주세요.">
                 </div>
           
                    <div class="form-group">
                       <label for="exampleFormControlInput1" class="bold">카테고리</label> <br>
                       <select class="custom-select" id="category" name="roomType" style="width: 150px;">
                             <option value="1">IT</option>
                             <option value="2">공모전</option>
                             <option value="3">면접</option>
                             <option value="4">전공</option>
                             <option value="5">외국어</option>
                             <option value="6">기타</option>
                           </select>
                    </div>
                   
                    <div class="form-group">
                       <label for="exampleFormControlInput1" class="bold">참가 인원 수</label>
                       <input type="number" class="form-control maxNumber" name="roomMaxNumber" maxlength="2" style="width: 150px;" min="1" max="50"
                           placeholder="최대 50명">
                    </div>
                    
                    <div class="form-group">
                       <label for="exampleFormControlTextarea1" class="bold">방 소개</label>
                       <textarea class="form-control" id="content" name="roomContent" rows="7" style="resize: none;"
                       placeholder="방에 대한 간략한 소개를 입력해주세요."></textarea>
                    </div>
                       
                    
                       <div class="form-group">
                           <label for="exampleFormControlTextarea1" class="tagform bold">태그 입력</label>
                           <div class="plusbutton">+</div>
                           <div class="tagbox">
                              <input type="text" class="form-control tags"  id="tags" name="roomTag" maxlength="5">
                              <input type="text" class="form-control tags"  id="tags" name="roomTag" maxlength="5">
                              <input type="text" class="form-control tags"  id="tags" name="roomTag" maxlength="5">
                           </div>
              
                            <button type="button" class="btn2"  id="return-btn">목록으로</button>
                            &nbsp;
                            <button type="submit" class="btn2" >등록하기</button>
                     </div>
               
              </form>
            </div>
        </div>
	   <jsp:include page="../common/footer.jsp" />

   <script>  
      // 유효성 검사 
      function validate() {
    	  // 방 이름
         if ($("#title").val().trim().length == 0) {
            alert("방 이름을 입력해 주세요.");
            $("#title").focus();
            return false;
         }
   	    
   	 	 // 참가 인원 수
         if ($(".maxNumber").val().trim().length == 0) {
            alert("참가 인원 수를 입력해주세요.");
            $(".maxNumber").focus();
            return false;
         }
   	  
     	  // 방 소개
         if ($("#content").val().trim().length == 0) {
            alert("방 소개를 입력해 주세요.");
            $("#content").focus();
            return false;
         }

    	  // 태그
         if ($(".tags").val().trim().length == 0) {
            alert("태그를 입력해 주세요");  
            var tag =  $(".tags");
            tag[0].focus();
            return false;
         }
    	 
    	  // 태그
    	  if($("#c").prop("checked")){
    		  if($(".passArea").val().trim() == ""){
    			  alert("비밀번호를 입력해주세요");
    			  return false;
    		  }
    	  }
      }
      

      // 태그 입력창 생성 + 2번까지(수정)
      var tagCnt = 0;
      var tagCnt2 = 0;

       $(".plusbutton").on("click", function(){

      		if(tagCnt <3 ){
		         $tag = $('<input type="text">').addClass("form-control tags").attr("id", "tags").attr("name","roomTag");
		         $(".tagbox").append($tag);
		         tagCnt++;
      		}
      		if (tagCnt>=3){
      			 //$(".plusbutton").css("display","hidden");
      			
      			 
      			 if(tagCnt2 <3){ $(".plusbutton").text("-");
	      			 $(".tags").last().remove();
	      			 // 마이너스가 될때 text에 - 넣으면됨
	      			tagCnt2++;
      			 }else{	 
      				$(".plusbutton").text("+");
      			  $tag = $('<input type="text">').addClass("form-control tags").attr("id", "tags").attr("name","roomTag");
 		         $(".tagbox").append($tag);
 		        tagCnt2--;
      			 }

    	   }
	   });
      
      
  	 
      // 비공개 버튼 누를시 password input태그 생성
      $("#c").on("change",function(){
			$("#roomPassword").css("display","block");
			$(".boxarea").css("height", "740px");
      });
      
      $("#o").on("change",function(){
			$("#roomPassword").css("display","none");
			$(".boxarea").css("height", "700px");
      });
      
      // 이전으로
      $("#return-btn").on("click",function(){
    	 location.href = "${header.referer}";
      });

   </script>
</body>
</html>