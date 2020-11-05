<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A </title>
<style>
a {
	text-decoration: none;
	color: black;
}

table, tr, td {
	border-radius: 3px;
	 color: yellow;
}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<form action="" method="post">
	<table width="600px" style="margin: 50px auto" border="1">
		<tr>
			<td align="left" style="color:red">Q & A</td>
			<td colspan="2" align="right"><a href="../index.jsp">메인화면</a></td>
		</tr>
		<tr>
			<td width="70" align="center">제목</td>
			<td width="330"><input type="text" name="writer" size="12">
			<select name="Questions">
					<option value="배송문의">배송문의</option>
					<option value="기타문의">기타문의</option>
					<option value="환불문의">환불문의</option>
					<option value="문의사항">직접작성</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">이메일</td>
			<td width="330"><input type="text" name="email" size="30">
			</td>
		</tr>
		<tr>
			<td width="70" align="center">제목</td>
			<td width="330"><input type="text" name="subject" size="50"
				value='<c:if test="${ not empty param.ref }">[답글]</c:if>'>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">내용</td>
			<td width="330"><textarea rows="13" cols="50" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<td width="70" align="center">비밀번호</td>
			<td width="330"><input type="password" name="pass" size="10">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="제출">
				<input type="reset" value="다시작성"> 
		</tr>
	</table>
	<input type="hidden" name="p_ref" value="${ param.ref }" />
</form>

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>