<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.jsp.gameinfo.model.vo.*, java.util.*" %>
<%
	
	GameInfo gi = (GameInfo)request.getAttribute("gameInfo");
	GameImage gie = (GameImage)request.getAttribute("GameImage");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 업데이트</title>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/site_ico.ico" type="image/x-icon">
<link rel="icon" href="<%=request.getContextPath() %>/resources/img/site_ico.ico" type="image/x-icon">
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

.default {background-color: #e7e7e7; color: black;}

.default:hover {background: #ddd;}
.info {background-color: #2196F3;}
.info:hover {background: #0b7dda;}
</style>
	
		
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<% if(m != null && m.getMemberId().equals("admin")) { %>
	
	<div class="section1">
  	   <div class="section2">
     	 <div class="section3">
		<h2  align="center">게임 수정</h2>
		<form  action="<%= request.getContextPath() %>/gameupdate.do"
			  method="post" enctype="multipart/form-data" method="post" style="margin-top:-10px;"> 
			
				<input type="hidden" name="gminfoNum" value="<%= gi.getGminfoNum() %>" />
				<table >
				
					<tr>
						<td>게임명</td>
	               <td><input type="text" name="gminfoName" value="<%=gi.getGminfoName() %>" style="width :268px; height:40px; display:inline-block;" class="form-control"/></td>
					</tr>
               		
               		<tr>
                   <td>게임출시일</td>
               	   <td><input type="date" name="gminfoDate" value="<%= gi.getGminfoDate() %>" style="width : 268px;  height:40px; "  class="form-control"/></td>
             	  </tr>
					
					 <tr>
               		<td>게임 이미지</td>
              	    <td colspan="3">
							<div id="titleImgArea">
								<img id="gameimage" src="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gie.getGmimgCgfile() %>" width="350" height="200"  />
							</div>
						</td>
               		</tr>
					
					 <tr>
               		<td>출시한 회사</td>
               		<td><input type="text" maxlenth="15" name="gminfoCompany"  value="<%= gi.getGminfoCompany()%>" style="width : 268px; height:37px; margin-top:10px;" class="form-control"/></td>
             	  </tr>
		
					 <tr>
               		<td>게임 설명</td>
			   		<td>
					<textarea name="gminfoExp" cols="50" rows="5" style="resize:none;" value="<%= gi.getGminfoExp() %>" class="form-control"></textarea>
					</td>	
               </tr>
					<tr>
						<td width="100px">장르번호</td>
						<td colspan="3" height="3">
							<input type="text" name="gmTypeNum" size="45" value="<%= gi.getGmTypeNum() %>" />
							
						</td>
					</tr>
					<tr>
             
					
					<tr>
               		<td>연령등급</td>
               		<td><input type="text" maxlenth="15" name="gminfoAge" value="<%= gi.getGminfoAge()%>" style="width : 268px; height:37px; margin-top:10px;" class="form-control"/></td>
               		</tr>
					
					<tr>
               		<td>가격</td>
               		<td><input type="text" maxlenth="15" name="gminfoPrice" value="<%= gi.getGminfoPrice() %>"  style="width : 268px; height:37px; margin-top:10px;" class="form-control"/></td>
               </tr>
					
				</table>
			
			<div class="fileArea" id="fileArea">
				<!-- 첨부할 사진 추가 영역 -->
				<!-- (input:file#thumbnailImg[name=thumbnailImg onchange=loadImg(this, )])*4 -->
				<input type="file" name="gameImg1" id="gameImg1" onchange="loadImg(this);" />
				
			</div>
			<div class="btnArea">
				<button type="submit">작성 완료</button>
				<button type="reset">작성 취소</button>
			</div>
			</form>
			</div>
			</div>
			
			
		
	</div>	
	<% } else {
		request.setAttribute("exception", new Exception("비회원 접근"));
		request.setAttribute("error-msg", "회원 로그인 후 진행하세요!");
		
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	 } %>
	
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
		// 사진 게시글 미리보기 기능 구현
		$(function(){
			$('#titleImgArea').click(function(){
				$('#gameImg1').click();
			});
		
			
			$('#fileArea').hide();
			
			$.ajax({
				url : '<%= request.getContextPath() %>/genreList.do',
				type : 'get',
				success : function(list){
					var $genre = $('#selectGenre');
					for( var i = 0 ; i < list.length ; i++ ){
						var $option = $('<option value=' + list[i].gmTypeNum + '>' + list[i].gmType + '</option>');
						$genre.append($option);
					} 
				}
			});
		})
		
		function loadImg(img){
			if(img.files && img.files[0]) {
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					
					$('#gameimage').attr('src', e.target.result);
					
				}
				
				reader.readAsDataURL(img.files[0]);
			}	
		}
	</script> 
	

</body>
</html>