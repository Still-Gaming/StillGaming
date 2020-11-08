<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String msg = (String)request.getAttribute("error-msg");
	Exception e = (Exception)request.getAttribute("exception");
	// 일반적으로 jsp에 사용되는 exception 내장 객체는 jspException 클래스를 활용한다.
	// 따라서 사용자 정의 예외를 구현할 때에는 Exception 객체를 직접 선언하여 사용하여야 한다.
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | ERROR</title>

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
	<%@ include file="header.jsp" %>
	
	<div class="outer">
		<h1>서비스 에러 발생!!!</h1>
		<h3 style="color:hotpink;">ERROR : <%= e.getMessage() %></h3>
		<h4><span>서</span>비스 수행 중 에러가 발생했습니다. 전송 값을 확인해 보시고,<br>
		이상이 없을 시 부서 담당자에게 연락하시기 바랍니다.</h4>
	</div>
	
	
	<%@ include file="footer.jsp" %>
	


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