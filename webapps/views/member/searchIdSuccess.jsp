<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.*"%>
<%
	String memberId = (String)request.getAttribute("memberId");
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/site_ico.ico" type="image/x-icon">
<link rel="icon" href="<%=request.getContextPath() %>/resources/img/site_ico.ico" type="image/x-icon">
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style2.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">
    
    <style>
    	.btn {
    		background: lightgray;
    		color: white;
    	}
    	
    	.btn:hover {
    		background: gray;
    		color: white;
    	}
    </style>
    
    <title>StillGaming | 아이디찾기</title>
    
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
    <div align="center">
		아이디 : <%= memberId %>
		
		<br />
		<br />
	
	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
	<%@ include file="../common/footer.jsp" %>
	<!-- Js Plugins -->
	<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/player.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/mixitup.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>