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
   String searchWord = pi.getSearchWord();
   String str = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
	<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
		
	<div class="container table-responsive-xs">
		<table align="center" class="table table-bordered table-hover">
			<thead class="table-secondary">
				<tr align="center">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
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
		
		<div class="">
			<button class="btn btn-light" onclick="location.href='<%= request.getContextPath() %>/views/board/boardInsertForm.jsp'">글쓰기</button>
		</div>
	</div>
	
	<div class="pagingArea" align="center">
		
		<% 
			if(pi.getSearchWord() == null) {
				str = request.getContextPath() + "/selectList.bo?currentPage=";
			} else {
				str = request.getContextPath() + "/search.bo?category=" + pi.getCategory() + "&searchWord=" + pi.getSearchWord() + "&currentPage=";
			}
		
		%>
		<button class="btn btn-light" onclick="location.href='<%= str %>1'"><<</button>
		
		<%  if(currentPage <= 1){  %>
			<button class="btn btn-light" disabled><</button>
		<%  } else { %>
			<button class="btn btn-light" onclick="location.href='<%= str %><%= currentPage - 1 %>'"><</button>
		<%  } %>
			
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){ %>
				<button class="btn btn-light" disabled><%= p %></button>
			<% } else { %>
				<button class="btn btn-light" onclick="location.href='<%= str %><%= p %>'"><%= p %></button>
			<% } %>
		<% } %>
				
		<%  if(currentPage >= maxPage){  %>
			<button class="btn btn-light" disabled>></button>
		<%  } else { %>
			<button class="btn btn-light" onclick="location.href='<%= str %><%= currentPage + 1 %>'">></button>
		<%  } %>
		
		<button class="btn btn-light" onclick="location.href='<%= str %><%= maxPage %>'">>></button>
		
	</div>
	
	<br/>
	
	<div class="container">
		<form id="searchFrm" action="<%= request.getContextPath() %>/search.bo" class="form-inline">
			<select name="category" id="category" class="custom-select">
				<option value="BOARD_TITLE" selected>제목</option>
				<option value="MEMBER_ID">작성자</option>
				<option value="BOARD_TEXT">내용</option>
			</select>
			
			&nbsp;&nbsp;
			
			<input type="text" name="searchWord" id="searchWord" placeholder="내용을 입력해주세요." class="form-control" />
		
			&nbsp;&nbsp;
			
			<span class="form-inline-btn">
				<button class="btn btn-light" type="button" id="searchBtn">검색</button>
			</span>
		</form>
	</div>
	
	<br/><br/><br/><br/>
	
	<%@ include file="/views/common/footer.jsp" %>
	
	<script>
		$('td').on('mouseenter', function() {
			$(this).css('cursor', 'pointer');
		}).on('click', function() {
			var boardNo = $(this).parent().find('input').val();
			console.log(boardNo);
			<% if(m != null) { %>
				location.href='<%= request.getContextPath() %>/selectOne.bo?boardNo=' + boardNo;
			<% } else { %>
				location.href='<%= request.getContextPath() %>/views/member/memberLogin.jsp';
			<% } %>
		});
		
		$('#searchBtn').on('click', function() {
			if($('#searchWord').val().length < 2) {
				alert('검색어를 2자 이상 입력해주세요');
				$('#searchWord').focus();
				return;
			}
			
			$('#searchFrm').submit();
		});
	</script>
	
<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/player.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/nice-select.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/mixitup.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/slicknav.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>