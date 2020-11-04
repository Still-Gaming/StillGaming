<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.board.model.vo.*, com.kh.jsp.boardcomment.model.vo.*, java.util.*" %>
<% 
	Board b = (Board)request.getAttribute("board");
	BoardFile bf = (BoardFile)request.getAttribute("boardFile");
	ArrayList<BoardComment> clist = (ArrayList<BoardComment>)request.getAttribute("clist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
		<div class="outer">
		<br/>
		<h2 align="center">게시글 상세 보기</h2>
		<div class="tableArea">
			<table align="center" width="800px">
				<tr>
					<td colspan="3"><span><%= b.getBoardTitle() %></span></td>
				</tr>
				<tr>
					<td colspan="2"><span><%= b.getMemberId() %></span></td>
					<td rowspan="2"><button type="button">신고하기</button></td>
				</tr>
				<tr>
					<td><span><%= b.getBoardDate() %></span></td>
					<td><span>조회 <%= b.getBoardCount() %></span></td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="imgArea">
						<% if(bf.getFileChangeName() != null && bf.getFileChangeName().length() > 0) { %>
							<img src="<%= request.getContextPath() %>/resources/boardUploadFiles/<%= bf.getFileChangeName() %>" />
						<% } %>
						</div>
						<div class="textArea">
							<%= b.getBoardText() %>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo'">목록으로</button>
			
			<% if(m != null && m.getMemberId().equals(b.getMemberId())){ %>
				<button onclick="location.href='<%= request.getContextPath() %>/upload.bo?boardNo='+<%=b.getBoardNo()%>">수정</button>
				<button onclick="location.href='<%= request.getContextPath() %>/delete.bo?boardNo='+<%=b.getBoardNo()%>">삭제</button>
			<% } %>
		</div>
		
		<div class="replyArea">
			<span>댓글(<%= clist.size() %>)</span>
			
			<div class="replyWriteArea">
				<form action="<%= request.getContextPath() %>/insert.co" method="post">
					<input type="hidden" name="memberId" value="<%= m.getMemberId() %>" />
					<input type="hidden" name="boardNo" value="<%= b.getBoardNo() %>" />
					
					<table align="center">
						<tr>
							<td>
								<textarea name="replyContent" id="replyContent" cols="80" rows="3" placeholder="내용을 입력해주세요"></textarea>
							</td>
							<td>
								<button type="button" id="addReply">작성</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>