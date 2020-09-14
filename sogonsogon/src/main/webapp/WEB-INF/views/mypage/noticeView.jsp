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
      	border : 1px solid brown;
      	width : 100%;
      	height : 300px;
      }
      
      .btn{
      	margin:10px 0;
      }
      
      h3{
      	 float:left;
      }
      
      h6{
      	 float:right;
      }
      
      hr{
      	color:brown;
      }
</style>
<title>공지사항 상세조회</title>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
	<div class="content2">       
      <h4 class="mb-5">공지사항 상세조회</h4>
      
      <hr>
      <h3>${notice.qnaTitle}</h3>
      <h6> [카테고리 : ${notice.qnaCategory}]</h6>
      <hr>
      <div>
		<p align=left> 작성자 : ${notice.writerNick} </p><p align=right>${notice.qnaCreateDate}</p>
	  </div>
		<div id="board-content" position="absolute">${notice.qnaContent}</div>
		<hr>
		<div class="float-right">
		<button type="button" class="btn btn-warning" onclick="location.href ='../deleteNotice/${notice.qnaNo}'">삭제</button>
		<button type="button" class="btn btn-warning" onclick="location.href ='../adminnotice'">목록으로</button>
		</div>
		</div>
	</div>    
   
   <jsp:include page="../common/footer.jsp" />

</body>
</html>