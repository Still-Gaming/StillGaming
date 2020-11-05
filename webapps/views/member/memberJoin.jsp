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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
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
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<%@ include file="../common/header.jsp" %>
   
<!--     Normal Breadcrumb Begin
    <section class="normal-breadcrumb set-bg" data-setbg="../../resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Sign Up</h2>
                        <p>Welcome to the official Anime blog.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
<div class="section1">
   <div class="section2">
      <div class="section3">
         <div class="join1">
            <form action="/StillGaming/insert.me" onsubmit="return validate();" method="post" style="margin-top:-10px;">
            
               <p><b>아이디</b></p>
               <input type="text" name="memberId" id="memberId" style="width :268px; height:40px; display:inline-block;" required="required" placeholder="아이디를 입력해주세요" class="form-control"/>
               <input type="button" value="중복확인" id="idDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px; background:#364559;" class="btn btn-primary"> 
               <label id="idResult" style="font-size:12px;  display:block;"></label>

               
               <p><b>비밀번호</b></p>
               <input type="password" name="memberPwd" id="memberPwd" style="width : 268px;  height:40px;" required="required" placeholder="비밀번호를 입력해주세요" class="form-control"/>
               
               <p><b>비밀번호 확인</b></p>
               <input type="password" name="memberPwd2" id="memberPwd2" style="width : 268px;  height:40px; margin-bottom:10px;" required="required" placeholder="비밀번호를 재입력해주세요" class="form-control"/>
               <label id="pwdResult" style="font-size:12px;  display:block;"></label>
               
               <p><b>이름</b></p>
               <input type="text" name="memberName" style="width : 268px; height:37px;" required="required" class="form-control"/>
               
               <p><b>이메일</b></p>
               <input type="text" name="email1"style="width:122px; height:40px; display:inline-block;" required="required" class="form-control">
             &nbsp;@&nbsp;
              <input type="text" name="email2"style="width:122px; height:40px; display:inline-block;" required="required" class="form-control">
             <input type="button" value="중복확인" id="emailDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px; background:#364559;" class="btn btn-primary"> 
               
               <p><b>생년월일</b></p>
			   <input type="text" name="memberSsn" style="width : 268px; height:37px;" required="required" class="form-control"/>
               
             
               <p><b>연락처</b></p>
            <input type="number" name="phone1" required="required" style="width:76px; height:37px; display:inline;" class="form-control"/>
			
			 &nbsp; - &nbsp; <input type="number" name="phone2" required="required" style="width:77px; height:37px; display:inline;" class="form-control" />
			 &nbsp; - &nbsp; <input type="number" name="phone3" required="required" style="width:76px; height:37px; display:inline;" class="form-control"/>        
               			
			<p><b>성별</b></p>
			<input type="radio" name="gender" value="M"  />남 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="gender" value="F" />여
               
                <input type="submit" id="submitBtn" value=" 동의 후 회원 가입" class="btn btn-primary" style="text-align:center;width: 351px; height:45px; margin-left: 56px; margin-top:-10px;background:#364559;left:601px;position:absolute" /> 
            </form>
            
         </div>
         <div class="join2">
            <div class="check" style="position:absolute;top:39px">
               <div class="custom-control custom-checkbox" style="margin-left:40px;font-family: 'Noto Sans KR', sans-serif;">
                  <input type="checkbox" class="custom-control-input" id="term1" onchange="isChecked();">
                   <label class="custom-control-label" for="term1">서비스 이용약관 동의 (필수)</label><br>   
                    <textarea class="term-box" readonly>제1조 (목적)

                 </textarea>
                 </div>
                 
                 <div class="custom-control custom-checkbox" style="margin-left:40px;font-family: 'Noto Sans KR', sans-serif;margin-top:30px;">
                  <input type="checkbox" class="custom-control-input" id="term2" onchange="isChecked();">
                   <label class="custom-control-label" for="term2">개인정보 수집 • 이용에 대한 동의 (필수)</label>
                   <textarea class="term-box" readonly>
 
                 </textarea>
                   </div>
                </div>
                
         </div>      
      </div>
   </div>
</div>


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