<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
      .content{
      float:left;
      width:100%;
      height:100%;
      }
      
      .content2{
	      float:left; 
	      width:72%;
	      height:100%;
	      padding:20px 0px 0px 30px;
      }
      
      #board-content{
      	width : 100%;
      	height : 100px;
      }
      
      .btn{
      	margin:10px 0;
      }
      
      #title, #category, #writer, #date{
      	display: inline-block;
      }
      
      #category, #date{
      	float:right;
      }
      
      #board-content{
      	padding: 10px;
      	font-size: 15px;
      	width : 100%; 
      	height : 120px; 
      }
      
      #answer-content{
      	width:100%;
      	height:300px;
      }
</style>
<title>고객센터 답변달기</title>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
	<div class="content2">       
      <h4 class="mb-5">답변달기</h4>
      
      <hr>
      <h3 id="title">${help.helpTitle}</h3><h6 id="category"> [카테고리 : ${help.helpCategory}]</h6>
      <hr>
      <div>
		<p id="writer"> 작성자 : ${help.writerNick} </p><p id="date">${help.helpModifyDate}</p>
	  </div>
		<div id="board-content">${help.helpContent}
		</div>
		<div><br><p>답글 작성</p>
		<input id="answer-content" name="answer">
		</div>
		<div class="float-right">
		<button type="button" class="btn btn-warning" onclick="location.href ='../insertAnswer/${help.helpNo}'">등록</button>
		</div>
		</div>
	</div>    
   
   <jsp:include page="../common/footer.jsp" />

</body>
</html>