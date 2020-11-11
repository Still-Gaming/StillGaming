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
<title>커뮤니티</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">

<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	<div class="titleArea">
		<h2>자유 게시판</h2>
	</div>
		
	<div class="tableArea">
		<table align="center">
			<thead>
				<tr align="center">
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
						<td><%= b.getBoardNo() %></td>
						<td><%= b.getBoardTitle() %></td>
						<td><%= b.getMemberId() %></td>
						<td><%= b.getBoardCount() %></td>
						<td><%= b.getBoardDate() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	
	<div class="pagingArea" align="center">
	
		<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1'"><<</button>
		
		<%  if(currentPage <= 1){  %>
			<button disabled><</button>
		<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage - 1 %>'"><</button>
		<%  } %>
			
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){ %>
				<button disabled><%= p %></button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= p %>'"><%= p %></button>
			<% } %>
		<% } %>
				
		<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
		<%  } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage + 1 %>'">></button>
		<%  } %>
		
		<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage %>'">>></button>
		
	</div>
	
	<div class="btnArea">
		<button onclick="location.href='<%= request.getContextPath() %>/views/board/boardInsertForm.jsp'">글쓰기</button>
	</div>
	
	<form action="<%= request.getContextPath() %>/search.bo">
		<div class="searchArea">
			<select name="category" id="category">
				<option value="title" selected>제목</option>
				<option value="memberId">작성자</option>
			</select>
			
			<input type="text" name="searchWord" id="searchWord" />
			
			<button>검색</button>
		</div>
	</form>
	
	<%@ include file="/views/common/footer.jsp" %>
	
	<script>
		$('td').on('mouseenter', function() {
			$(this).css('cursor', 'pointer');
			$(this).parent().css({
				'background-color' : 'black',
				'color' : 'white'
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
			<% } else { %>
				location.href='<%= request.getContextPath() %>/views/member/memberLogin.jsp';
			<% } %>
		});
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