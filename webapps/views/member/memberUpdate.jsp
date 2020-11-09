<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Still Gaming | 정보수정</title>
    
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>

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
.section1{
	margin: 0 auto;
}
.section2{
	margin: 0 auto;
	width:550px;
}
.section3{
	margin:0 auto;
	margin-left:30px;
	margin-top : 50px;
	margin-bottom: 30px;
}
.section4{
	margin:0 auto;
	padding:25px;
	margin-left:30px;
}
.section3>h3{
font-family: 'Noto Sans KR', sans-serif;
}
.section4>table{
display:inline-block;
}
.edit1>div{
padding:10px 20px;
}
.default {background-color: #e7e7e7; color: black;}

.default:hover {background: #ddd;}
.info {background-color: #2196F3;}
.info:hover {background: #0b7dda;}

#deleteBtn {
	margin-left: 200px;
}


</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
<br />
<br />
<br />
<br />

	<div class="section1">
		<div class="section2">
			<div class="section3">			
					<form action="/StillGaming/update.me" method="post" >
				<table>
				<tr>
					<td><div style="font-size:15px;">아이디 :</div></td>
					<td><%= m.getMemberId() %></td>
					<td></td>
				</tr>
				
				<tr>
					<td><div class="ui input" style="font-size:15px;">변경 PWD :</div></td>
					<td><input type="password" name="memberPwd" id="memberPwd" style="width:200px; height:30px; border-radius:5px;" required></td>
					<td></td>
				</tr>
				
				<tr>
					<td><div class="ui input" style="font-size:15px;">변경 PWD 확인 :</div></td>
					<td><input type="password" name="memberPwd2" id="memberPwd2" style="width:200px; height:30px; border-radius:5px;" required></td>
					<td><label id="pwdResult" style="font-size:12px;  display:block;"></label></td>
				</tr>
				
				<tr>
					<td><div style="font-size:15px;">이름 :</div></td>
					<td><%= m.getMemberName() %></td>
					<td></td>
				</tr>

				<tr>
					<td><div class="ui input" style="font-size:15px;">이메일 :</div></td>          
					<td><input type="text" name="email1" id="email1" style="width:100px; height:30px; border-radius:5px;" required> @
						<input type="text" name="email2" id="email2" style="width:100px; height:30px; border-radius:5px;" required></td>
					<td><input type="button" value="중복확인" id="emailDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px; " class="btn default"></td> 
						
				</tr>
				
				<tr>
					<td><div style="font-size:15px;">생년월일 :</div></td>
					<td><%= m.getMemberSsn() %></td>
					<td></td>
				</tr>
				
				<tr>
					<td><div class="ui input" style="font-size:15px;">연락처 :</div>
					<td><input type="number" name="phone1" id="phone1" style="width:70px; border-radius:5px;" required>-  
						<input type="number" name="phone2" id="phone2" style="width:70px; border-radius:5px;" required>-  
						<input type="number" name="phone3" id="phone3" style="width:70px; border-radius:5px;" required></td>
						<td></td>
				</tr>
				
				<tr>
					<td><div style="font-size:15px;">성별 :</div></td>
					<td>
					 <% if( m.getGender().toUpperCase().equals("F  ") ) { %>
							여자
						<% } else { %>
							남자
						<% } %> 
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td><div style="font-size:15px;">가입일자 :</div></td>
					<td><%= m.getJoinDate() %></td>
					<td></td>
				</tr>	

		</table>
		
		<br />
		    <button type="submit" class="btn default">정보 수정</button>
 					
			<button id="deleteBtn" class="btn default" onclick="deleteMember();">회원 탈퇴</button>
		</form>
		
		</div>	
	</div>
</div>

<br />
<br />
<br />
<br />
<br />
	
	<%@ include file="../common/footer.jsp" %>
	
		<script>
		
		
		
		function deleteMember() {
						var result = window.confirm("정말 탈퇴하시겠습니까?");
						
						if (result == true) {
							location.href = "/StillGaming/delete.me?memberId=<%=m.getMemberId()%>";
							alert("탈퇴 처리되었습니다.");
						} else {
							 alert("탈퇴 취소되었습니다.");
						}
					}

		$('#emailDupCheckBtn').on('click',function(){
			$.ajax({
				url : '/StillGaming/echeck.me',
				type : 'post',
				data : { 
					email1 : $('#email1').val(),
					email2 : $('#email2').val()
						 },
				success : function(data){
						console.log(data);

					if( data == 0 ) {
						alert("사용 가능한 이메일입니다.");
					} else {
						alert("이미 사용 중인 이메일입니다.")
					}
				}, error : function(){
					console.log("에러 발생");
				}
			});
		});
		
		// 비밀번호 유효성 체크 정규표현식 함수(영문,숫자,특수문자 8자리 이상 20자리 이하)
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


		// 비밀번호 유효성체크 이벤트 함수
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


	<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/player.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/mixitup.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>	

</body>
</html>