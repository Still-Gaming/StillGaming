<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.kh.jsp.gameinfo.model.vo.*, java.util.*" %>
	<%
	
	GameInfo gi = (GameInfo)request.getAttribute("GameInfo");
	GameImage gie = (GameImage)request.getAttribute("GameImage");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 상세 페이지</title>
<style>
	td {
		color : white;
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
						<img id="gameImg" src="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gie.getGminfoImage() %>">
					</div>
				</td>
				
			</tr>
			
		</table>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do'">목록으로</button>
			
			
				<button onclick="location.href='<%= request.getContextPath() %>/updateView.do?gminfoNum='+<%=gi.getGminfoNum()%>">수정</button>
				<button onclick="location.href='<%= request.getContextPath() %>/delete.do?gminfoNum='+<%=gi.getGminfoNum()%>">삭제</button>
			
		</div>
		
		
		

</body>
</html>