<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.mypage.model.vo.*, com.kh.jsp.board.model.vo.*, java.util.*" %>
<%
	ArrayList<Ord> list = (ArrayList<Ord>)request.getAttribute("list");
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

hr {
	margin-left: 550px;
	margin-right: 550px;
	border-width: 2px;
}

.product__pagination {
	padding-top: 15px;
}

.product__pagination a {
	display: inline-block;
	font-size: 15px;
	color: #000000;
	font-weight: 600;
	height: 50px;
	width: 50px;
	border: 1px solid transparent;
	border-radius: 50%;
	line-height: 48px;
	text-align: center;
	-webkit-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.product__pagination a:hover {
	color: #b7b7b7;
	cursor: pointer;
}

.product__pagination a.current-page {
	border: 1px solid #000000;
}

.product__pagination a i {
	color: #b7b7b7;
	font-size: 15px;
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
	<h4 align="center">구매내역</h4>
	<hr />
	<input type="date" id="date1"> ~ <input type="date" id="date2">
	<button type="button" class="btn btn-default" onclick="search();">조회</button>
	<button type="reset" class="btn btn-default">초기화</button>
	<br />
	<br />
		<div class="tableArea">
		<table>
			<thead>
				<tr align="center">
					<th width="200">구매일자</th>
					<th width="260">게임명</th>
					<th width="80">가격</th>
				</tr>
			</thead>
			<tbody>
				<% for(Ord o : list) { %>
					<tr align="center">
						<input type="hidden" name="Order" id="OrderNo" value="<%= o.getOrdNo() %>" />
						<td><%= o.getOrdDate() %></td>
						<td><%= o.getGminfoName() %></td>
						<td><%= o.getGminfoPrice() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	<br />
	    <div class="product__pagination" align="center">
           <a onclick="location.href='<%= request.getContextPath() %>/ord.my?memberId=<%= m.getMemberId() %>&currentPage=1'"><<</a>
		
		<%  if(currentPage <= 1){  %>
			<a class="current-page"><</a>
		<%  }else{ %>
			<a onclick="location.href='<%= request.getContextPath() %>/ord.my?memberId=<%= m.getMemberId() %>&currentPage=<%= currentPage - 1 %>'"><</a>
		<%  } %>
			
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){ %>
				<a class="current-page"><%= p %></a>
			<% } else { %>
				<a onclick="location.href='<%= request.getContextPath() %>/ord.my?memberId=<%= m.getMemberId() %>&currentPage=<%= p %>'"><%= p %></a>
			<% } %>
		<% } %>
				
		<%  if(currentPage >= maxPage){  %>
			<a class="current-page">></a>
		<%  } else { %>
			<a onclick="location.href='<%= request.getContextPath() %>/ord.my?memberId=<%= m.getMemberId() %>&currentPage=<%= currentPage + 1 %>'">></a>
		<%  } %>
		
		<a onclick="location.href='<%= request.getContextPath() %>/ord.my?memberId=<%= m.getMemberId() %>&currentPage=<%= maxPage %>'">>></a>
	
      </div>
      
      <br />
      <br />
      <br />
      <br />
	</section>
	
	<br />
	<br />
	<br />
	<br />
	<br />

	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
	function search(){
		location.href="<%=request.getContextPath()%>/searchOrd.my?memberId=<%= m.getMemberId() %>&date1="+$('#date1').val()+"&date2="+$('#date2').val();
	}
	</script>

	<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/player.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/mixitup.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>	
	
</body>

</html>