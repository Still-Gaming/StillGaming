<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A </title>

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
	
	body {
		background-color: white;
	}
	
a {
	text-decoration: none;
	color: black;
	font-size: 30px;
}

table, tr, td {
	border-radius: 3px;
	border-color: black;
	 color: black;
	 border-width: 5px;
}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<form action="<%= request.getContextPath() %>/qna.do" 
		method="post" class="qnasm"  enctype="multipart/form-data">
	<table width="900px" style="margin: 50px auto" border="1">
		<tr >

			<td align="left" style="color:red">Q & A</td>
			<td colspan="2" align="right" ><a href="<%= request.getContextPath()%>">메인화면</a></td>
		</tr>
		<tr>
			<td width="70" align="center">제목</td>
			<td width="330"><input type="text" name="qtitle" size="30">
			<select name="qcode" style="display:block;">
					<option value="1">게임문의</option>
					<option value="2">기타문의</option>
					<option value="3">환불문의</option>
			</select>
			</td>
		</tr>
		
		<tr>
		<td width="70" align="center">첨부파일</td>
			<td width="330"><input type="file" value="파일 선택" name="file" size="30">
			</td>
       		
		</tr>
		<tr>
			<td width="70" align="center">내용</td>
			<td width="330"><textarea rows="13" cols="50" name="qcontent"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="제출">
				<input type="reset" value="다시작성"> 
		</tr>
	</table>
	
</form>

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>