<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.board.model.vo.*, java.util.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | 내가 쓴 글 조회</title>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/site_ico.ico" type="image/x-icon">
<link rel="icon" href="<%=request.getContextPath() %>/resources/img/site_ico.ico" type="image/x-icon">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>


<style>
section {
	margin-left: 200px;
	margin-top: 100px;
	margin-right: 200px;
	margin-bottom: 50px;
}

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }

h4 {
	  letter-spacing: 5px;
}  

hr {
	margin-left: 500px;
	margin-right: 500px;
	border-width: 2px;
}

.product__pagination {
	padding-top: 15px;
}

.product__pagination a {
	display: inline-block;
	font-size: 15px;
	color: #000000;
	font-weight: 600;
	height: 50px;
	width: 50px;
	border: 1px solid transparent;
	border-radius: 50%;
	line-height: 48px;
	text-align: center;
	-webkit-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	cursor: pointer;
	
}

.product__pagination a:hover {
	color: #b7b7b7;
}

.product__pagination a.current-page {
	border: 1px solid #000000;
}

.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
<!-- 	<div class="tab">
  	<button class="tablinks" onclick="open(event, 'Board')">게시글</button>
  	<button class="tablinks" onclick="open(event, 'QnA')">1:1문의</button>
	</div> -->
	
	<div class="tabcontent" id="Board">
	<section>
	<h4 align="center">내가 쓴 게시글</h4>
	<hr />
	<br />
 	<br />
	<br />
	<div class="tableArea">
		<table align="center">
			<thead>
				<tr align="center">
					<th width="30">	<input type="checkbox" id="checkAll"></th>
					<th width="50">번호</th>
					<th width="200">제목</th>
					<th width="80">작성자</th>
					<th width="50">조회수</th>
					<th width="120">작성일</th>
				</tr>
			</thead>
			<tbody>
				<% for(Board b : list) { %>
					<tr align="center">
						<input type="hidden" name="BoardNo" id="BoardNo" value="<%= b.getBoardNo() %>" />
						<td><input type="checkbox" name="bno" id="chk" value="<%= b.getBoardNo() %>"></td>						
						<td><%= b.getBoardNo() %></td>
						<td class="tdclick"><%= b.getBoardTitle() %></td>
						<td><%= b.getMemberId() %></td>
						<td><%= b.getBoardCount() %></td>
						<td><%= b.getBoardDate() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	<br />
		&nbsp;<button id="delete" class="btn btn-default" onclick="deleteChk();"><i class="fa fa-check" aria-hidden="true"></i>
		삭제</button>
	
	    <div class="product__pagination" align="center">
           <a onclick="location.href='<%= request.getContextPath() %>/post.my?memberId=<%= m.getMemberId() %>&ccurrentPage=1'"><<</a>
		
		<%  if(currentPage <= 1){  %>
			<a class="current-page"><</a>
		<%  }else{ %>
			<a onclick="location.href='<%= request.getContextPath() %>/post.my?memberId=<%= m.getMemberId() %>&currentPage=<%= currentPage - 1 %>'"><</a>
		<%  } %>
			
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){ %>
				<a class="current-page"><%= p %></a>
			<% } else { %>
				<a onclick="location.href='<%= request.getContextPath() %>/post.my?memberId=<%= m.getMemberId() %>&currentPage=<%= p %>'"><%= p %></a>
			<% } %>
		<% } %>
				
		<%  if(currentPage >= maxPage){  %>
			<a class="current-page">></a>
		<%  } else { %>
			<a onclick="location.href='<%= request.getContextPath() %>/post.my?memberId=<%= m.getMemberId() %>&currentPage=<%= currentPage + 1 %>'">></a>
		<%  } %>
		
		<a onclick="location.href='<%= request.getContextPath() %>/post.my?memberId=<%= m.getMemberId() %>&currentPage=<%= maxPage %>'">>></a>
	
      </div>
      <br />
      <br />
      <br />
      <br />
	</section>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$('.tdclick').on('mouseenter', function() {
			$(this).css('cursor', 'pointer');
			$(this).parent().css({
				'background-color' : 'lightgray',
				'color' : 'black'
			});
		}).on('mouseleave', function() {
			$(this).parent().css({
				'background-color' : 'transparent',
				'color' : 'black'
			})
		}).on('click', function() {
			var boardNo = $(this).parent().find('input').val();
			console.log(boardNo);
			<% if(m != null) { %>
				location.href='<%= request.getContextPath() %>/selectOne.bo?boardNo=' + boardNo;
			<% } %>
		});
		
		$(document).ready(function(){
		    $("#checkAll").click(function(){
		        if($("#checkAll").prop("checked")){
		            $("input[type=checkbox]").prop("checked",true);
		        }else{
		            $("input[type=checkbox]").prop("checked",false);
		        }
		    })
		})
		
		function deleteChk(){
  			var chk = "";
  			$( "input[id='chk']:checked" ).each (function (){
  				  chk = chk + $(this).val()+ "," ;
 			 });
 			 chk = chk.substring(0,chk.lastIndexOf( ","));
		 
		  if(chk == ''){
		    alert("삭제할 항목을 선택하세요.");
		    return false;
		  }
 			 
		  if(confirm("삭제 하시겠습니까?")){
				location.href='<%= request.getContextPath() %>/chkDelete.bo?memberId=<%= m.getMemberId() %>&bno=' + chk;
		  }
	}
﻿
		
	</script>
<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/player.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/mixitup.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>


</body>
</html>