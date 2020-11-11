<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
    
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>StillGaming | 회원가입</title>
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css">

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

.default {background-color: #e7e7e7; color: black;}

.default:hover {background: #ddd;}
.info {background-color: #2196F3;}
.info:hover {background: #0b7dda;}
</style>

</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<%@ include file="../common/header.jsp" %>
	
    <!-- Signup Section Begin -->
    <br />
    <br />
    <br />

<div class="section1">
   <div class="section2">
      <div class="section3">
            <form action="/StillGaming/insert.me" onsubmit="return validate();" method="post" style="margin-top:-10px;">
               <table>
               <tr>
	               <td>아이디</td>
	               <td><input type="text" name="memberId" id="memberId" style="width :268px; height:40px; display:inline-block;" placeholder="사용하실 아이디를 입력해주세요" class="form-control" required/></td>
	               <td><input type="button" value="중복확인" id="idDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px;" class="btn default"> </td>
	               <td><label id="idResult" style="font-size:12px;  display:block;"></label></td>
			   </tr>
               
               <tr>
                   <td>비밀번호</td>
               	   <td><input type="password" name="memberPwd" id="memberPwd" style="width : 268px;  height:40px;" required="required" placeholder="비밀번호를 입력해주세요" class="form-control"/></td>
               </tr>
               
               <tr>
               		<td>비밀번호 확인</td>
              	    <td><input type="password" name="memberPwd2" id="memberPwd2" style="width : 268px;  height:40px; margin-bottom:10px;" required="required" placeholder="비밀번호를 재입력해주세요" class="form-control"/></td>
               	    <td><label id="pwdResult" style="font-size:12px;  display:block;"></label></td>
               </tr>
               
               <tr>
               		<td>이름</td>
               		<td><input type="text" maxlenth="15" name="memberName" style="width : 268px; height:37px;" required="required" class="form-control"/></td>
               </tr>
               
               <tr>
               		<td>이메일</td>
              	 	<td><input type="text" name="email1" id="email1" style="width:122px; height:40px; display:inline-block;" required="required" class="form-control">
               @
               <input type="text" name="email2" id="email2" style="width:122px; height:40px; display:inline-block;" required="required" class="form-control"></td>
              <td><input type="button" value="중복확인" id="emailDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px; " class="btn default"></td> 
              </tr>
               
               <tr>
               		<td>생년월일</td>
			   		<td><input type="text" name="memberSsn" style="width : 268px; height:37px;" required="required" class="form-control"/></td>
               </tr>
             
              <tr>
					<td>연락처</td>
            		<td><input type="number" name="phone1" required="required" style="width:76px; height:37px; display:inline;" class="form-control"/>
			
			  -  <input type="number" name="phone2" required="required" style="width:77px; height:37px; display:inline;" class="form-control" />
			  -  <input type="number" name="phone3" required="required" style="width:76px; height:37px; display:inline;" class="form-control"/></td>
              </tr>	
              
              <tr>
				  <td><p>성별</p></td>
				  <td><input type="radio" name="gender" value="M"  />남자 &nbsp;
				  <input type="radio" name="gender" value="F" />여자</td>
			</tr>

			</table>
				<button type="submit" id="submitBtn" style="margin: -2px 0px 0px 7px; height:40px; color: white; align: center;" class="btn info">회원가입</button>
            </form>
            
         </div>           
         </div>      
      </div>
<br />
<br />
<br />
<br />

	<%@ include file="../common/footer.jsp" %>

<script>
$('#idDupCheckBtn').on('click',function(){
	$.ajax({
		url : '/StillGaming/icheck.me',
		type : 'post',
		data : { memberId : $('#memberId').val() },
		success : function(data){
			// console.log(data);
			
			// 전달된 결과가 0이면 사용자 없음 : 가입 가능!
			//			 1 		    있음 : 가입 불가!
			if( data == 0 ) {
				alert("사용 가능한 아이디입니다.");
			} else {
				alert("이미 사용 중인 아이디입니다.")
			}
		}, error : function(){
			console.log("에러 발생");
		}
	});
});

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
 
   // 이메일 중복 체크
   if(idDupCheckNum == 1){
      alert("이미 사용 중인 아이디입니다!");
      return false;
   } else if(idDupCheckNum == -1){
      alert("아이디 중복검사를 해주세요");
      return false;
   }
	  
   
}
</script>


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