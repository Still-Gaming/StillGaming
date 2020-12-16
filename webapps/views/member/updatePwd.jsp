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
    <title>StillGaming | 비밀번호 찾기</title>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/site_ico.ico" type="image/x-icon">
<link rel="icon" href="<%=request.getContextPath() %>/resources/img/site_ico.ico" type="image/x-icon">
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
	
	<br/>
	
	<div class="container" style="background : lightgrey; padding : 10px; border-radius : 5px;">
		<form id="updatePwdFrm" action="<%= request.getContextPath() %>/updatePwd.me" onsubmit="return validate();">
			<h4>비밀번호 변경</h4>
			
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" value="<%= sm.getMemberId() %>" disabled="disabled" class="form-control" />
						<input type="hidden" name="memberId" value="<%= sm.getMemberId() %>" />
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="memberPwd" name="memberPwd" placeholder="내용을 입력해주세요" class="form-control" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="memberPwd2" name="memberPwd2" placeholder="내용을 입력해주세요" class="form-control" /></td>
               	    <td><label id="pwdResult" style="font-size:12px;  display:block;"></label></td>
					
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
    function pwdRegEx(pwd){  
    	   var pwdRegEx = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;

    	   return pwdRegEx.test(pwd);
    	}

    	// 두 비밀번호가 같은지 체크하는 함수
    	function isSamePwd(pwd1,pwd2){
    	   if(pwd1 == pwd2){
    	      return true;
    	   }else return false;
    	   
    	}
    $('[name^="memberPwd"]').change(function(){
    	   var pwd1 = $('#memberPwd').val();
    	   var pwd2 = $('#memberPwd2').val();

    	   if(!isSamePwd(pwd1,pwd2)){
    	      $('#pwdResult').html("비밀번호가 일치하지 않습니다.").css('color','red');
    	   }else if(!pwdRegEx(pwd2)){
    	      $('#pwdResult').html("");
    	      $('#pwdResult').html("비밀번호는 숫자,영문 대소문자, 특수문자로 구성된<br> 8자리 이상 20자리 이하이어야 합니다.").css('color','red');
    	   }else{
    	      $('#pwdResult').html("사용 가능한 비밀번호입니다.").css('color','green');
    	   }
    	   
    	});

    	function validate(){

    	   // 비밀번호
    	   var pwd1 = $('#memberPwd').val();
    	   var pwd2 = $('#memberPwd2').val();

    	   // 비밀번호 체크
    	   if(!isSamePwd(pwd1,pwd2)){   
    	    alert("비밀번호가 일치하지 않습니다.");
    	       return false;
    	   }
    	   
    	   if(!pwdRegEx(pwd2)){
    	      alert("올바르지 않은 형식의 비밀번호입니다.");
    	      return false;
    	   }
    	}
    </script>
</body>
</html>