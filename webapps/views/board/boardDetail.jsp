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
    
<style>
.sub_news,.sub_news th,.sub_news td{
  border:0;
}

.sub_news a{
  color:#383838;
  text-decoration:none;
}

.sub_news{
  width:100%;
  border-bottom:1px solid #999;
  color:#666;
  font-size:15px;
  table-layout:fixed;
}

.sub_news caption{
  display:none;
}

.sub_news th{
  padding:5px 0 6px;
  border-top:solid 1px #999;
  border-bottom:solid 1px #b2b2b2;
  background-color:#f1f1f4;
  color:#333;
  font-weight:bold;
  line-height:20px;
  vertical-align:top;
  text-align: center;
}

.sub_news td{
  padding:8px 0 9px;
  border-bottom:solid 1px #d2d2d2;
  border-top: solid 1px #d2d2d2;
  text-align:center;
  line-height:18px;
}

.sub_news .date,.sub_news .hit{
  padding:0;
  font-family:Tahoma;
  font-size:11px;
  line-height:normal;
}

.sub_news .title{
  text-align:left; 
  padding-left:15px; 
  font-size:13px;
}

.sub_news .title .pic,.sub_news .title .new{
  margin:0 0 2px;
  vertical-align:middle;
}

.sub_news .title a.comment{
  padding:0;
  background:none;
  color:#f00;
  font-size:12px;
  font-weight:bold;
}

.sub_news tr.reply .title a{
  padding-left:16px;
  background:url(../images/ic_reply.png) 0 1px no-repeat;
}

.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}

.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}

textarea {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}

.btn-default:hover {background: #ddd;}

#upbtn {
	margin-left: 905px;
}

.replyArea {
	background : #f1f1f4;
}

#updateBtn {
		margin-left: 725px;
	
}

body {
	background: white;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<br /><br /><br />
	<section class="container">
		<div class="tableArea">
			<table class="sub_news" cellspacing="0" >
			<tbody style="border: 1px solid #d2d2d2;">
			
				<tr>
					<td style="width:10%;background-color:#f1f1f4;">제목 </td>	
					<td colspan="5"><span><%= b.getBoardTitle() %></span></td>
				</tr>
				<tr>
					<td style="background-color:#f1f1f4;">작성자 </td>
					<td colspan="5"><span><%= b.getMemberId() %></span></td>
				</tr>
				<tr>
					<td style="background-color:#f1f1f4;">작성일 </td>
					<td colspan="3"><span><%= b.getBoardDate() %></span></td>
					<td style="background-color:#f1f1f4;">조회수 </td>
					<td colspan="1"><span> <%= b.getBoardCount() %></span></td>
				</tr>
				<tr style="height:300px;overflow-y:auto;text-align:left;">
					<td style="background-color:#f1f1f4;">내용</td>
						<td colspan="5"><div class="imgArea">
						<% if(bf != null && bf.getFileChangeName() != null && bf.getFileChangeName().length() > 0) { %>
							<img src="<%= request.getContextPath() %>/resources/boardUploadFiles/<%= bf.getFileChangeName() %>" />
						<% } %>
						</div>
						<div class="textArea">
							<%= b.getBoardText() %>
						</div></td>
				</tr>
				</tbody>
			</table>
		</div>
		
		<br />
		<div class="btnArea" align="left">
			<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/selectList.bo'">목록으로</button> 
			&nbsp;
			<% if(m != null && m.getMemberId().equals(b.getMemberId())){ %>
				<button class="btn btn-default" id="upbtn" onclick="location.href='<%= request.getContextPath() %>/updateView.bo?boardNo='+<%=b.getBoardNo()%>">수정</button>
				<button class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/delete.bo?boardNo='+<%=b.getBoardNo()%>">삭제</button>
			<% } %>
		</div>
		
		<br />
		<div class="replyArea">
		<br />
			<div class="replyWriteArea">
				<form action="<%= request.getContextPath() %>/insert.co" method="post">
					<input type="hidden" name="memberId" value="<%= m.getMemberId() %>">
					<input type="hidden" name="boardNo" value="<%= b.getBoardNo() %>" />
					<input type="hidden" name="refCno" value="0" />
					<input type="hidden" name="commentLevel"  value="1"/>
					
					<table align="center">
						<tr>
							<td>댓글 작성</td>
							<td>
								<textarea name="commentText" id="replyContent" 
								          cols="110" rows="3"></textarea>
							</td>
							<td>
								<button class="btn btn-default" type="submit" id="addReply">
									등록
								</button>
							</td>
							
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="replySelectArea">

		<hr />
			<!-- 댓글 목록 구현 영역 -->
			<% if (clist.size() == 0) { %>
				<p style="text-align: center;">여러분이 새 댓글의 주인공이 되어 보세요!</p>
				<br />
			<% } else {
				for(BoardComment bco : clist) { %>
				
			<table align="center" id="replySelectTable"
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
							  
						<button type="button" class="btn btn-default" id="updateBtn"
							onclick="updateReply(this);">수정하기</button>
							
						<button type="button" class="btn btn-default" id="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none;" >수정완료</button> &nbsp;&nbsp;
							
						<button type="button" class="btn btn-default" id="deleteBtn"
							onclick="deleteReply(this);">삭제하기</button>
							
					<% } else if( bco.getCommentLevel() < 3) { %>
						<input type="hidden" name="memberId" value="<%= bco.getMemberId()%>"/>
						<input type="hidden" name="refCno" value="<%= bco.getCommentNo() %>" />
						<input type="hidden" name="commentLevel" value="<%=bco.getCommentLevel() %>" />
						<button type="button" class="btn btn-default" id="insertBtn"
							 onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
							 
						<button type="button" class="btn btn-default" id="insertConfirm"
							onclick="reConfirm(this);"
							style="display:none;" >댓글 추가 완료</button> 
							
					<% } else {%>
						<span> 마지막 레벨입니다.</span>
					<% } %>
					</td>
				</tr>
				<tr class="comment replyList<%=bco.getCommentLevel()%>">
					<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="125" rows="3"
					 readonly="readonly"><%= bco.getCommentText() %></textarea>
					</td>
				</tr>
			</table>
				
					
			<%
				}
			}
			%>
		</div>
	</section>
<script>
		
			function reComment(obj) {
				// 추가 완료 버튼
				$(obj).siblings('#insertConfirm').css('display', 'inline');
				
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
				var refcno = $(obj).siblings('input[name=refCno]').val();
				var level = $(obj).siblings('input[name=commentLevel]').val();
				
				level = Number(level) + 1;
				
				// 게시글 번호 가져오기
				var bno = '<%= b.getBoardNo() %>';
				
				var content = $(obj).parent().parent().siblings()
				              .last().find('textarea').val();
				
				location.href = '<%=request.getContextPath()%>/insert.co'
						+ '?memberId=<%= m.getMemberId()%>'
						+ '&commentText=' + content
						+ '&boardNo=' + bno
						+ '&refCno=' + refcno
						+ '&commentLevel=' + level;
				
			}
			function updateReply(obj) {
				// 현재 버튼의 위치와 가장 가까운 textarea 접근하기
				$(obj).parent().parent().next().find('textarea').removeAttr('readonly');
				
				// 수정 완료 버튼 보이게 하기
				$(obj).siblings('#updateConfirm').css('display', 'inline');
				
				// 현재 클릭한 수정 버튼 숨기기
				$(obj).css('display', 'none');
			}
			
			function updateConfirm(obj) {
				// 수정을 마친 댓글 내용 가져오기
				var content = $(obj).parent().parent().next().find('textarea').val();
				
				// 댓글 번호 가져오기	
				var cno = $(obj).siblings('input').val();
				
				location.href = "<%= request.getContextPath() %>/updateComment.co?"
						      + "boardNo=<%= b.getBoardNo() %>"
						      + "&commentNo=" + cno
						      + "&commentText=" + content;
			}
			
			function deleteReply(obj){
				// 댓글 번호 가져오기
				var cno = $(obj).siblings('input').val();
				
				// 게시글 번호 가져오기
				var bno = '<%= b.getBoardNo() %>';
				
				//console.log("삭제 댓글 번호 : " + cno + " / " + bno);
				
				location.href="<%= request.getContextPath() %>/deleteComment.co"
				            + "?commentNo=" + cno + "&boardNo=" + bno;
				
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
	
		
	
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>