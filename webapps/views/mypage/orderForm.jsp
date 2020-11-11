<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.mypage.model.vo.*, java.util.*" %>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | 구매내역</title>

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
 <script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	
	<%@ include file="../common/header.jsp" %>
	
	<section>
	<h4 align="center">주문서 작성</h4>
	<hr />
	<input type="date" name="date1" id="date1"> ~ <input type="date" name="date2" id="date2">
	<button type="button" class="btn btn-default" onclick="search();">조회</button>
	<button type="reset" class="btn btn-default" onclick="history.back();">초기화</button>
	<br />
	<br />
		<div class="tableArea">
		<table>
			<thead>
				<tr align="center">
					<th width="260">게임명</th>
					<th width="80">가격</th>
				</tr>
			</thead>
			<tbody>
				<% for(Cart c : list) { %>
					<tr align="center">
						<td><%= c.getGminfoName() %></td>
						<td><%= c.getGminfoPrice() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	

</body>
</html>