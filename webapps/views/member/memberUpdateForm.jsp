<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | 마이페이지</title>

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
*{
   font-family: 'Noto Sans KR', sans-serif;
}
.logo{
   width: 500px;
   text-align:center;
   margin:0 auto;
}
.section1{
   margin:0 auto;
}
.section2{
   width : 1200px;
   margin:0 auto;
   margin-top: 50px;
}
.section3{
   margin:0 auto;
   padding:30px;
   position: relative; 
}
.section3>div{
   display:inline-block;
}
.join1{
  width:420px;
  border-right:2px solid #BDD4F2;
  margin-left:150px;
}
.join2{
  width:470px;
}
.email>div{
   width :300px; 
   height:40px; 
   display:inline-block;
}
.join1>form>p{
   font-size:15px;
   margin-top:14px;
   margin-bottom:3px;
   font-family: 'Noto Sans KR', sans-serif;
}
.check{
    margin-bottom: 132px;

}
input{margin-bottom: 9px;}
.term-box{
 font-family: 'Noto Sans KR', sans-serif;
   width:350px;
   height:160px;
   margin-left:15px;
   border-radius:3px;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="section1">
		<div class="section2">
			<div class="section3">
				<h3>회원정보 수정</h3>
			</div>
		
		<div class="section4" style="width:450px; border: solid #E6E6E6 1px; border-radius: 5px;">
	
			<form id="update" action="/StillGaming/update.me" method="post" >
	
				<table align="center">
				<div class="edit1" style="margin:8px;">
			
				<div style="font-size:15px;">아이디 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= m.getMemberId() %></div>
				
				<div class="ui input" style="font-size:15px;">변경할 PWD :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="memberPwd" id="memberPwd" style="width:200px; height:30px; border-radius:5px;" required></div>
				
				<div class="ui input" style="font-size:15px;">변경할 PWD 확인 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="memberPwd2" id="memberPwd2" style="width:200px; height:30px; border-radius:5px;" required></div>
				
				<div style="font-size:15px;">이름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= m.getMemberName() %></div>

				<div class="ui input" style="font-size:15px;">이메일 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="email1" id="email1" style="width:200px; height:30px; border-radius:5px;" required> &nbsp; @ &nbsp;
				<input type="text" name="email2" id="email2" style="width:200px; height:30px; border-radius:5px;" required>
				</div>
				
				<div style="font-size:15px;">생년월일 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= m.getMemberSsn() %></div>
				
								
				<div class="ui input" style="font-size:15px;">연락처 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="number" name="phone1" id="phone1" style="width:200px; height:30px; border-radius:5px;" required> &nbsp; - &nbsp;
				<input type="number" name="phone2" id="phone2" style="width:200px; height:30px; border-radius:5px;" required> &nbsp; - &nbsp;
				<input type="number" name="phone1" id="phone1" style="width:200px; height:30px; border-radius:5px;" required>
				</div>
				
				
				<div style="font-size:15px;">성별 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= m.getGender() %></div>
				
<%-- 				<div style="font-size:15px;">가입일자 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= m.getjoinDate() %></div>
 --%>				
 
 					<div><button class="ui button"><input type="submit" value="회원 정보 수정" style="border:none;"></button>
 									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 					
					<div id="deleteBtn" onclick="deleteMember();">회원 탈퇴</div>
				</div>
			</div>
		
		</form>
		
		</div>
		
	</div>
</div>
	
	
	<%@ include file="../common/footer.jsp" %>
	
		<script>
		function deleteMember() {
						var result = window.confirm("정말 탈퇴하시겠습니까?");
						
						if (result == true) {
							location.href = "/StillGaming/delete.me?memberId=<%=m.getMemberId()%>";
						} 
					}

		
		</script>

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