<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.board.model.vo.*, com.kh.jsp.boardComment.model.vo.*, java.util.*" %>
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
<style>
	td {
		color : white;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
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
						<% if(bf != null && bf.getFileChangeName() != null && bf.getFileChangeName().length() > 0) { %>
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
				<button onclick="location.href='<%= request.getContextPath() %>/updateView.bo?boardNo='+<%=b.getBoardNo()%>">수정</button>
				<button onclick="location.href='<%= request.getContextPath() %>/delete.bo?boardNo='+<%=b.getBoardNo()%>">삭제</button>
			<% } %>
		</div>
		
		
		<div class="replyArea">
			<div class="replyWriteArea">
				<form action="<%= request.getContextPath() %>/insert.co" method="post">
					<input type="hidden" name="memberId" value="<%= m.getMemberId() %>">
					<input type="hidden" name="boardNo" value="<%= b.getBoardNo() %>" />
					<input type="hidden" name="refcno" value="0" />
					<input type="hidden" name="commentLevel"  value="1"/>
					
					<table align="center">
						<tr>
							<td>댓글 작성</td>
							<td>
								<textarea name="commentText" id="replyContent" 
								          cols="80" rows="3"></textarea>
							</td>
							<td>
								<button type="submit" id="addReply">
									댓글 등록
								</button>
							</td>
							
						</tr>
					</table>
				</form>>
		<div class="replySelectArea">
		
		
			<!-- 댓글 목록 구현 영역 -->
			<% if (clist.size() == 0) { %>
				<span>여러분이 새 댓글의 주인공이 되어 보세요!</span>
			<% } else {
				for(BoardComment bco : clist) { %>
				
			<table id="replySelectTable"
		      	 style="margin-left : <%= (bco.getCommentLevel()-1) * 15 %>px;
		      	 		width : <%= 800 - ((bco.getCommentLevel()-1) * 15)%>px;"
		      	 class="replyList<%=bco.getCommentLevel()%>">
		  		<tr>
		  			<td rowspan="2"> </td>
					<td><b><%= bco.getMemberId() %></b></td>
					<td><%= bco.getCommentDate() %></td>
					<td align="center">
 					<%if(m.getMemberId().equals(bco.getMemberId())) { %>
						<input type="hidden" name="commentNo" value="<%=bco.getCommentNo()%>"/>
							  
						<button type="button" class="updateBtn" 
							onclick="updateReply(this);">수정하기</button>
							
						<button type="button" class="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none;" >수정완료</button> &nbsp;&nbsp;
							
						<button type="button" class="deleteBtn"
							onclick="deleteReply(this);">삭제하기</button>
							
					<% } else if( bco.getCommentLevel() < 3) { %>
						<input type="hidden" name="memberId" value="<%= bco.getMemberId()%>"/>
						<input type="hidden" name="commentNo" value="<%= bco.getCommentNo() %>" />
						<input type="hidden" name="commentLevel" value="<%=bco.getCommentLevel() %>" />
						<button type="button" class="insertBtn" 
							 onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
							 
						<button type="button" class="insertConfirm"
							onclick="reConfirm(this);"
							style="display:none;" >댓글 추가 완료</button> 
							
					<% } else {%>
						<span> 마지막 레벨입니다.</span>
					<% } %>
					</td>
				</tr>
				<tr class="comment replyList<%=bco.getCommentLevel()%>">
					<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="105" rows="3"
					 readonly="readonly"><%= bco.getCommentText() %></textarea>
					</td>
				</tr>
			</table>
				
					
			<%
				}
			}
			%>
			</div>
		
		</div>
		<script>
		
			function reComment(obj) {
				// 추가 완료 버튼
				$(obj).siblings('.insertConfirm').css('display', 'inline');
				
				// 현재 클릭한 버튼 숨기기
				$(obj).css('display', 'none');
				
				// 대댓글 입력공간 만들기
				var htmlForm = 
					'<tr class="comment"><td></td>'
						+'<td colspan="3" style="background : transparent;">'
							+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
						+ '</td>'
					+ '</tr>';
				
				$(obj).parents('table').append(htmlForm);
			}
		
			function reConfirm(obj){
				// 참조할 댓글 번호 가져오기
				var refcno = $(obj).siblings('input[name=refcno]').val();
				var level = $(obj).siblings('input[name=comment_Level]').val();
				
				level = Number(level) + 1;
				
				// 게시글 번호 가져오기
				var bno = '<%= b.getBoardNo() %>';
				
				var content = $(obj).parent().parent().siblings()
				              .last().find('textarea').val();
				
				location.href = '<%=request.getContextPath()%>/insert.co'
						+ '?writer=<%= m.getMemberId()%>'
						+ '&replyContent=' + commentText
						+ '&boardNo=' + boardNo
						+ '&refcno=' + refcno
						+ '&commentLevel=' + level;
				
			}
			function updateReply(obj) {
				// 현재 버튼의 위치와 가장 가까운 textarea 접근하기
				$(obj).parent().parent().next().find('textarea').removeAttr('readonly');
				
				// 수정 완료 버튼 보이게 하기
				$(obj).siblings('.updateConfirm').css('display', 'inline');
				
				// 현재 클릭한 수정 버튼 숨기기
				$(obj).css('display', 'none');
			}
			
			function updateConfirm(obj) {
				// 수정을 마친 댓글 내용 가져오기
				var content = $(obj).parent().parent().next().find('textarea').val();
				
				// 댓글 번호 가져오기	
				var cno = $(obj).siblings('input').val();
				
				location.href = "<%= request.getContextPath() %>/update.co?"
						      + "boardNo=<%= b.getBoardNo() %>"
						      + "&commentNo=" + cno
						      + "&commentText=" + content;
			}
			
			
		</script>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
		
	</div>
	
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>