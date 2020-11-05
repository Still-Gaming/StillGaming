<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.gameinfo.model.vo.*"%>
<%
	ArrayList<GameInfo> list = (ArrayList<GameInfo>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>


<!DOCTYPE html>
<html lang="ko">
<head>

<title>스틸게이밍 상점</title>

	<style>
			/* Style the tab */
			.tab {
				overflow: hidden;
				border: 1px solid #ccc;
				background-color: #FBF8F8;
			}
			
			/* Style the buttons that are used to open the tab content */
			.tab button {
				background-color: inherit;
				float: left;
				border: none;
				outline: none;
				cursor: pointer;
				padding: 14px 16px;
				transition: 0.3s;
			}
			
			/* Change background color of buttons on hover */
			.tab button:hover {
				background-color: #ddd;
			}
			
			/* Create an active/current tablink class */
			.tab button.active {
				background-color: #ccc;
			}
			
			/* Style the tab content */
			.tabcontent {
				display: none;
				padding: 6px 12px;
				border: 1px solid #ccc;
				border-top: none;
			}
			.tabcontent {
  				animation: fadeEffect 1s; /* Fading effect takes 1 second */
  				background-color : #ddd;
			}
			

		/* Go from zero to full opacity */
		@keyframes fadeEffect {
 			 from {opacity: 0;}
 		 to {opacity: 1;}
		}
				* {
		  box-sizing: border-box;
					}
		
		/* Style the search field */
		form.example input[type=text] {
		  padding: 10px;
		  font-size: 20px;
		  border: 1px solid grey;
		  float: right;
		  width: 20%;
		  background: white;
		}
		
		/* Style the submit button */
		form.example button {
		  float: right;
		  width: 20%;
		  padding: 10px;
		  background: #2196F3;
		  color: white;
		  font-size: 17px;
		  border: 1px solid grey;
		  border-left: none; /* Prevent double borders */
		  cursor: pointer;
		}
		
		form.example button:hover {
		  background: #0b7dda;
		}
		
		/* Clear floats */
		form.example::after {
		  content: "";
		  clear: both;
		  display: table;
		}
	</style>
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
    
	
    
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	
	<div class="titleArea">
		<h2>게임 리스트</h2>
	</div>
		
	<div class="tableArea">
		<table align="center" style="color:white;">
			<thead>
				<tr align="center">
					<th width="50">이름</th>
					<th width="200">설명</th>
					<th width="80">가격</th>
					
				</tr>
			</thead>
			<tbody>
				<% for(GameInfo b : list) { %>
					<tr align="center">
						<input type="hidden" name="GameInfoNo" id="GameInfoNo" value="<%= b.getGminfoNum() %>" />
						<td><%= b.getGminfoName() %></td>
						<td><%= b.getGminfoExp() %></td>
						<td><%= b.getGminfoPrice() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	
		<div class="pagingArea" align="center">
	
		<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=1'"><<</button>
		
		<%  if(currentPage <= 1){  %>
			<button disabled><</button>
		<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= currentPage - 1 %>'"><</button>
		<%  } %>
			
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){ %>
				<button disabled><%= p %></button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= p %>'"><%= p %></button>
			<% } %>
		<% } %>
				
		<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
		<%  } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= currentPage + 1 %>'">></button>
		<%  } %>
		
		<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= maxPage %>'">>></button>
		
	</div>
	
	
	<script>
		function openCity(evt, cityName) {
		  // Declare all variables
		  var i, tabcontent, tablinks;

		  // Get all elements with class="tabcontent" and hide them
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }

		  // Get all elements with class="tablinks" and remove the class "active"
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }

		  // Show the current tab, and add an "active" class to the button that opened the tab
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
	</script>
	
	<%@ include file="/views/common/footer.jsp" %>
	
	<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
	


</body>
</html>