	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임등록</title>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<% if (m != null) { %>
	<div class="outer">
		<br>
		<h2 align="center">게임 등록</h2>
		<form action="<%= request.getContextPath() %>/gameinsert.do"
			  method="post" enctype="multipart/form-data">
			<div class="insertArea">
				<!-- 게시글 추가 영역 -->
				<input type="hidden" name="MemberId" value="<%= m.getMemberId() %>" />
				<table align="center">
					<tr>
						<td width="100px">제목</td>
						<td colspan="3">
							<input type="text" name="title" size="45" />
						</td>
					</tr>
					<tr>
						<td>이미지</td>
						<td colspan="3">
							<!-- div#titleImgArea -->
							<div id="titleImgArea">
								<img id="titleImg" width="350" height="200" />
							</div>
						</td>
					</tr>
					<tr>
						<td width="100px">게임 설명</td>
						<td colspan="3">
							<textarea name="content" cols="50" rows="5" style="resize:none;"></textarea>
						</td>
					</tr>
					<td width="100px">가격</td>
						<td colspan="3">
							<input type="text" name="price" size="45" />
						</td>
				</table>
			
			</div>
			<div class="fileArea" id="fileArea">
				<!-- 첨부할 사진 추가 영역 -->
				<!-- (input:file#thumbnailImg[name=thumbnailImg onchange=loadImg(this, )])*4 -->
				<input type="file" name="Img1" id="Img1" onchange="loadImg(this,1);" />
				
			</div>
			<div class="btnArea">
				<button type="submit">작성 완료</button>
				<button type="reset">작성 취소</button>
			</div>
		</form>	
	</div>		
	<script>
		// 사진 게시글 미리보기 기능 구현
		$(function(){
			$('#titleImgArea').click(function(){
				$('#Img1').click();
			});
			
			
			$('#fileArea').hide();
		})
		
		function loadImg(img, num){
			if(img.files && img.files[0]) {
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					
					switch(num){
					case 1 : $('#titleImg').attr('src', e.target.result);
					
					}
				}
				
				reader.readAsDataURL(img.files[0]);
			}	
		}
	</script>
	<% } else { // 비회원 접근 차단
		request.setAttribute("exception", new Exception("비회원 접근"));
		request.setAttribute("error-msg", "회원 로그인 후 진행하세요!");
		
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);		
	} %>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>