<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.kh.jsp.gameinfo.model.vo.*, java.util.*,  com.kh.jsp.gamereview.model.vo.*" %>
	<%
	
	GameInfo gi = (GameInfo)request.getAttribute("GameInfo");
	GameImage gie = (GameImage)request.getAttribute("GameImage");
	ArrayList<GameReview> clist = (ArrayList<GameReview>)request.getAttribute("clist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 상세 페이지</title>
<style>
	td {
		color : black;
	}
	body {
		background : black;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
		
			<h2 align="center">게임 상세 보기</h2>
			<div class="tableArea">
			<table align="center" width="800px"> 
			<tr>
				<td width="50px">게임 타이틀</td> 
				<td colspan="5"><span><%= gi.getGminfoName() %></span></td> 
			</tr>
			<tr>
				<td>게임 설명 </td>
				<td colspan="6"><span><%= gi.getGminfoExp() %></span></td>
				<td>가격</td>
				<td><span><%= gi.getGminfoPrice() %></span></td>
				
			</tr>
			
			<tr>
				<td>대표사진</td>
				<td colspan="4">
					<div id="titleImgArea" align="center">
						<img id="gameImg" src="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gie.getGmimgCgfile() %>">
					</div>
				</td>
				
			</tr>
			
		</table>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do'"> 목록 </button>
			
			
				<button onclick="location.href='<%= request.getContextPath() %>/updateView.do?gminfoNum='+<%=gi.getGminfoNum()%>">수정</button>
				<button onclick="location.href='<%= request.getContextPath() %>/delete.do?gminfoNum='+<%=gi.getGminfoNum()%>">삭제</button>
			
		</div>
		</div>
		
	
		<div class="replyArea">
			<div class="replyWriteArea">
				<form action="<%= request.getContextPath() %>/reviewInsert.do" method="post">
					<input type="hidden" name="memberId" value="<%= m.getMemberId() %>">
					<input type="hidden" name="gminfoNum" value="<%= gi.getGminfoNum() %>" />
					<input type="hidden" name="refCno" value="0" />
					<input type="hidden" name="comtLevel"  value="1"/>
					
					<table align="center">
						<tr>
							<td>댓글 작성</td>
							<td>
								<textarea name="comtCont" id="replyContent" 
								          cols="80" rows="3"></textarea>
							</td>
							<td>
								<button type="submit" id="addReply">
									댓글 등록
								</button>
							</td>
							
						</tr>
					</table>
				</form>
		<div class="replySelectArea">
		
		
			<!-- 댓글 목록 구현 영역 -->
			<% if (clist.size() == 0 ) { %>
				<span>여러분이 새 댓글의 주인공이 되어 보세요!</span>
			<% } else {
				for(GameReview bco : clist) { %>
				
			<table id="replySelectTable"
		      	 style="margin-left : <%= (bco.getComtLevel()-1) * 15 %>px;
		      	 		width : <%= 800 - ((bco.getComtLevel()-1) * 15)%>px;"
		      	 class="replyList<%=bco.getComtLevel()%>">
		  		<tr>
		  			<td rowspan="2"> </td>
					<td><b><%= bco.getMemberId() %></b></td>
					<td><%= bco.getComtDate() %></td>
					<td align="center">
 					<%if(m.getMemberId().equals(bco.getMemberId())) { %>
						<input type="hidden" name="comtNum" value="<%=bco.getComtNum() %>"/>
							 
						<button type="button" class="updateBtn" 
							onclick="updateReply(this);">수정하기</button>
							
						<button type="button" class="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none;" >수정완료</button> &nbsp;&nbsp;
							
						<button type="button" class="deleteBtn"
							onclick="deleteReply(this);">삭제하기</button>
							
					<% } else if( bco.getComtLevel() < 3) { %>
						<input type="hidden" name="memberId" value="<%= bco.getMemberId()%>"/>
						<input type="hidden" name="refCno" value="<%= bco.getComtNum() %>" />
						<input type="hidden" name="comtLevel" value="<%=bco.getComtLevel() %>" />
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
				<tr class="comment replyList<%=bco.getComtLevel()%>">
					<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="105" rows="3"
					 readonly="readonly"><%= bco.getComtCont() %></textarea>
					</td>
				</tr>
			</table>
				
					
			<%
				}
			}
			%>
			</div>
		
		</div>
	<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/player.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/mixitup.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script> 
		
		
		
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
				var refcno = $(obj).siblings('input[name=refCno]').val();
				var level = $(obj).siblings('input[name=comtLevel]').val();
				
				level = Number(level) + 1;
				
				// 게시글 번호 가져오기
				var bno = '<%= gi.getGminfoNum() %>';
				
				var content = $(obj).parent().parent().siblings()
				              .last().find('textarea').val();
				
				location.href = '<%=request.getContextPath()%>/reviewInsert.do'
						+ '?memberId=<%= m.getMemberId()%>'
						+ '&comtCont=' + content
						+ '&gminfoNum=' + bno
						+ '&refCno=' + refcno
						+ '&comtLevel=' + level;
						
					
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
				
				location.href = "<%= request.getContextPath() %>/reviewUpdate.do?"
						      + "gminfoNum=<%= gi.getGminfoNum() %>"
						      + "&comtNum=" + cno
						      + "&comtCont=" + content;
			}
			
			function deleteReply(obj){
				// 댓글 번호 가져오기
				var cno = $(obj).siblings('input').val();
				
				// 게시글 번호 가져오기
				var bno = '<%= gi.getGminfoNum() %>';
				
				//console.log("삭제 댓글 번호 : " + cno + " / " + bno);
				
				location.href="<%= request.getContextPath() %>/reviewDelete.do"
				            + "?comtNum=" + cno + "&gminfoNum=" + bno;
				
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