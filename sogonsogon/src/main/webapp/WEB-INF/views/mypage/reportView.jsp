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
      
      #title, #category, #writer, #date{
      	display: inline-block;
      }
      
      #category, #date{
      	float:right;
      }
      
      #board-content{
      	padding: 10px;
      	font-size: 15px;
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
      <h4 class="mb-5">신고게시글 상세조회</h4>
      
      <hr>
      <h3 id="title">${report.qnaTitle}</h3><h6 id="category"> [카테고리 : ${report.qnaCategory}]</h6>
      <hr>
      <div>
		<p id="writer"> 작성자 : ${report.writerNick} </p><p id="date">${report.qnaCreateDate}</p>
	  </div>
		<div id="board-content">${report.qnaContent}
		<p>
			<br><br><br><hr>신고된 게시글 입니다<hr>
		</p>
		</div>
		<hr>
		<div class="float-right">

		<button type="button" class="btn btn-danger" onclick="location.href ='../updateReport/${report.writerNick}/${report.qnaNo}'">삭제</button>
		<button type="button" class="btn btn-dark" onclick="location.href ='../restoreReport/${report.writerNick}/${report.qnaNo}'">복원</button>
		<button type="button" class="btn btn-warning" onclick="location.href ='../adminreport'">목록으로</button>
		</div>
		</div>
	</div>    
   
   <jsp:include page="../common/footer.jsp" />

<script>
$("#board-content>p").css("color","red");
</script>
</body>
</html>