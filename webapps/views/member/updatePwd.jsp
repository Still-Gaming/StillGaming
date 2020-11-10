<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member sm = (Member)request.getAttribute("searchMember");
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
    <title>비밀번호 변경</title>

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
    
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="container">
		<form id="updatePwdFrm" action="<%= request.getContextPath() %>/updatePwd.me">
			<h4>비밀번호 변경</h4>
			
			<table>
				<tr>
					<td><label for="">아이디</label></td>
					<td>
						<input type="text" value="<%= sm.getMemberId() %>" disabled="disabled" />
						<input type="hidden" name="memberId" value="<%= sm.getMemberId() %>" />
					</td>
				</tr>
				<tr>
					<td><label for="">비밀번호</label></td>
					<td><input type="password" name="memberPwd" placeholder="내용을 입력해주세요" /></td>
				</tr>
				<tr>
					<td><label for="">비밀번호 확인</label></td>
					<td><input type="password" name="memberPwd2" placeholder="내용을 입력해주세요" /></td>
				</tr>
				<tr>
					<td colspan="2"><button type="button" class="btn btn-dark" id="updatePwd">확인</button></td>
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
    	$('#updatePwd').on('click', function() {
    		var pwd1 = $('input[name=memberPwd]');
    		var pwd2 = $('input[name=memberPwd2]');
    		
    		if(pwd1.val().length == 0) {
    			alert('비밀번호를 입력해주세요.');
    			pwd1.focus();
    			return;
    		} else if(pwd2.val().length == 0) {
    			alert('비밀번호를 입력해주세요.');
    			pwd2.focus();
    			return;
    		} else if(pwd1.val() != pwd2.val()) {
    			alert('비밀번호가 서로 다릅니다.');
    			pwd1.val('');
    			pwd2.val('');
    			pwd1.focus();
    			return;
    		} 
    		
    		$('#updatePwdFrm').submit();
    	});
    </script>
</body>
</html>