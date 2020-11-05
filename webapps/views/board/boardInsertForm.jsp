<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<% if(m != null) { %>
		
		<div class="outer">
		
			<br/>
			
			<h2 align="center">게시글 작성</h2>
			<div class="tableArea">
				<form action="<%= request.getContextPath() %>/insert.bo"
				      method="post" enctype="multipart/form-data">
		      		<input type="hidden" name="memberId" value="<%= m.getMemberId() %>" />
		      		<input type="hidden" name="boardType" value="1" />
				    <table>
				      	<tr>
				      		<td>제목</td>
				      		<td>
				      			<input type="text" name="boardTitle" size="40" />
				      		</td>
				      	</tr>
				      	<tr>
				      		<td>첨부 파일</td>
				      		<td>
				      			<input type="file" name="file" id="file" />
				      		</td>
				      	</tr>
				      	<tr>
				      		<td>내 용</td>
				      		<td>
				      			<textarea name="boardText"
				      				cols="50" rows="15"
				      				style="resize:none;"></textarea>
				      		</td>
				      	</tr>
				    </table>
				    
				    <br/>
				    <div align="center">
				      	<button type="reset">작성 취소</button>
				    	<button type="submit">게시글 등록</button>
				    </div>
				</form>
			</div>
		</div>
		
	<% } else { 
		request.getRequestDispatcher("/views/member/memberLigin.jsp").forward(request, response);
	} %>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>