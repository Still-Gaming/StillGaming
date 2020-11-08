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
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" />
<style>
	.input-group {
		container : 'body';
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<div class="titleArea">
		<h2>자유 게시판</h2>
	</div>
		
	<div class="tableArea">
		<table align="center" style="color:white;">
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
	
		<button class="btn" onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1'"><<</button>
		
		<%  if(currentPage <= 1){  %>
			<button disabled><</button>
		<%  }else{ %>
			<button class="btn" onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage - 1 %>'"><</button>
		<%  } %>
			
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){ %>
				<button disabled><%= p %></button>
			<% } else { %>
				<button class="btn" onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= p %>'"><%= p %></button>
			<% } %>
		<% } %>
				
		<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
		<%  } else { %>
			<button class="btn" onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage + 1 %>'">></button>
		<%  } %>
		
		<button class="btn" onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage %>'">>></button>
		
	</div>
	
	<div class="btnArea">
		<button class="btn btn-primary" onclick="location.href='<%= request.getContextPath() %>/views/board/boardInsertForm.jsp'">글쓰기</button>
	</div>
	
	<form action="<%= request.getContextPath() %>/search.bo">
		<div class="searchArea">
			<div class="input-group">
				<select name="category" id="category">
					<option value="title" selected>제목</option>
					<option value="memberId">작성자</option>
				</select>
			
				<input type="text" name="searchWord" id="searchWord" />
				
				<span class="input-group-btn">
					<button class="btn btn-success" type="button">검색</button>
				</span>
			</div>
		</div>
	</form>
	
	<%@ include file="/views/common/footer.jsp" %>
	
	<script>
		$('td').on('mouseenter', function() {
			$(this).css('cursor', 'pointer');
			$(this).parent().css({
				'background-color' : 'white',
				'color' : 'black'
			});
		}).on('mouseleave', function() {
			$(this).parent().css({
				'background-color' : 'transparent',
				'color' : 'white'
			})
		}).on('click', function() {
			var boardNo = $(this).parent().find('input').val();
			
			<% if(m != null) { %>
				location.href='<%= request.getContextPath() %>/selectOne.bo?boardNo=' + boardNo;
			<% } else { %>
				location.href='<%= request.getContextPath() %>/views/member/memberLogin.jsp';
			<% } %>
		});
	</script>
</body>
</html>