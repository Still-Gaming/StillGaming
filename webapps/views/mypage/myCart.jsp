<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.mypage.model.vo.*, com.kh.jsp.board.model.vo.*, java.util.*" %>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | 장바구니</title>

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
 section {
	margin-left: 200px;
	margin-top: 100px;
	margin-right: 200px;
	margin-bottom: 50px;
}

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }

h4 {
	  letter-spacing: 5px;
}  

#hr1 {
	margin-left: 550px;
	margin-right: 550px;
	border-width: 2px;
}
 </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	
	<section>
	<h4 align="center">장바구니</h4>
	<hr id="hr1" />
	<br />
	<br />
	
	<div class="tableArea">
		<table align="center">
			<thead>
				<tr align="center">
					<th width="100">이미지</th>
					<th width="100">게임명</th>
					<th width="80">가격</th>
				</tr>
			</thead>
			<tbody>
				<% for(Cart c : list) { %>
					<tr align="center">
 						<td><%= c.getGminfoImage() %></td>
						<td><%= c.getGminfoName() %></td>
						<td><%= c.getGminfoPrice() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	<br />
	
	<hr style="border-width: 3px;" />
	
    <br />
    <br />
    <br />
    <br />
	</section>
	
	
	<%@ include file="../common/footer.jsp" %>

</body>


</body>
</html>