<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.gameinfo.model.vo.*"%>
<%  
	ArrayList<GameInfo> list = (ArrayList<GameInfo>) request.getAttribute("list"); 
	int price = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | 결제</title>

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

<style>

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

.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}

 </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	
	<section>
	<h4 align="center">주문서 작성</h4>
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
				<% for(GameInfo gi : list) { %>
					<tr align="center">
						<input type="hidden" name="CartNo" id="CartNo" value="<%= gi.getGminfoNum() %>" />						
 						<td><img src="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gi.getGminfoImage() %>"></td>
						<td><%= gi.getGminfoName() %></td>
						<td><%= gi.getGminfoPrice() %></td>
					</tr>
					<% price += gi.getGminfoPrice(); %>
				<% } %>
			</tbody>
		</table>
	</div>
	<br />
	
	<div>
		<b style="text-align: right;" id="priceAll">총 금액 : <span style="font-size: 22px;" id="price"><%= price %></span><span> 원</span></b>
	</div>
	
		<hr style="border-width: 3px;" />
	
	<div align="center">
	<button class="btn btn-default" onclick="readyForm();">결제하기</button>
	</div>
	
    <br />
    <br />
    <br />
    <br />
	</section>
	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>