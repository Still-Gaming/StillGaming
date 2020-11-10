<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | 찾기</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Amiko' rel='stylesheet'>
    <!-- Css Styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style2.css" type="text/css">
    
    <style>
    	td {
    		padding: 5px;
    		vertical-align: middle;
    	}
    </style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="container">
		<form id="searchIdFrm" action="<%= request.getContextPath() %>/searchId.me">
			<h4>아이디 찾기</h4>
			
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="idName" placeholder="내용을 입력해주세요" class="form-control" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="idEmail" placeholder="내용을 입력해주세요" class="form-control" /></td>
				</tr>
				<tr>
					<td colspan="2"><button type="button" class="btn btn-dark" id="searchId">확인</button></td>
				</tr>
			</table>
		</form>
		
		<form id="searchPwdFrm" action="<%= request.getContextPath() %>/searchPwd.me">
			<h4>비밀번호 찾기</h4>
			
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="pwdId" placeholder="내용을 입력해주세요" class="form-control" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="pwdName" placeholder="내용을 입력해주세요" class="form-control" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="pwdEmail" placeholder="내용을 입력해주세요" class="form-control" /></td>
				</tr>
				<tr>
					<td colspan="2"><button type="button" class="btn btn-dark" id="searchPwd">확인</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	<br/><br/><br/><br/><br/>

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
    <script>
    	$('#searchId').on('click', function() {
    		var idName = $('input[name=idName]');
    		var idEmail = $('input[name=idEmail]');
    		
    		if(idName.val() == "") {
    			alert('이름을 입력해주세요');
    			
    			setTimeout(function(){ 
    				idName.focus();
    			}, 1);
    			
    			return;
    		} else if(idEmail.val() == "") {
    			alert('이메일을 입력해주세요');
    			
    			setTimeout(function(){ 
    				idEmail.focus();
    			}, 1);
    			
    			return;
    		} else {
    			$('#searchIdFrm').submit();
    		}
    	});
    	
    	$('#searchPwd').on('click', function() {
    		var pwdId = $('input[name=pwdId]');
    		var pwdName = $('input[name=pwdName]');
    		var pwdEmail = $('input[name=pwdEmail]');
    		
    		if(pwdId.val() == "") {
    			alert('아이디를 입력해주세요');
    			
    			setTimeout(function(){ 
    				pwdId.focus();
    			}, 1);
    			
    			return;
    		} else if(pwdName.val() == "") {
				alert('이름을 입력해주세요');
    			
    			setTimeout(function(){ 
    				pwdName.focus();
    			}, 1);
    			
    			return;
    		} else if(pwdEmail.val() == "") {
				alert('이메일을 입력해주세요');
    			
    			setTimeout(function(){ 
    				pwdEmail.focus();
    			}, 1);
    			
    			return;
    		} else {
    			$('#searchPwdFrm').submit();
    		}
    	});
    </script>
</body>
</html>