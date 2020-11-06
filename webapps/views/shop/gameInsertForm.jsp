<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.gameinfo.model.vo.*, java.util.*" %>
<% String memberId = (String) request.getAttribute("memberId"); 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임등록</title>

<style>
	
	.insertArea {
		width:500px;
		height:450px;
		margin-left:auto;
		margin-right:auto;
	}
	.btnArea {
		width:150px;
		margin-left:auto;
		margin-right:auto;
	}
	#titleImgArea {
		width:350px;
		height:200px;
		border:2px dashed darkgray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
	
</style>
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
				<input type="hidden" name="userId" value="<%= m.getMemberId() %>" />
				<table align="center">
				
					<tr>
						<td width="100px">게임명</td>
						<td colspan="3" height="3">
							<input type="text" name="gminfoName" size="45" />
						</td>
					</tr>
					<tr>
						<td width="100px">게임출시일</td>
						<td>
						<input type="date" name="gminfoDate"/>
						</td>
					</tr>
					<tr>
						<td>게임 이미지</td>
						<td colspan="3">
							<!-- div#titleImgArea -->
							<div id="titleImgArea">
								<img id="gameimage" width="350" height="200" />
							</div>
						</td>
					</tr>
					<tr>
						<td width="100px">출시한 회사</td>
						<td colspan="3" height="3">
							<input type="text" name="gminfoCompany" size="45" />
						</td>
					</tr>
					<tr>
						<td width="100px">게임 설명</td>
						<td colspan="3">
							<textarea name="gminfoExp" cols="50" rows="5" style="resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td width="100px">장르번호</td>
						<td colspan="3" height="3">
							<select id="selectGenre"></select>
						</td>
					</tr>
					<tr>
						<td width="100px">연령등급</td>
						<td colspan="3" height="3">
							<input type="text" name="gminfoAage" size="45" />
						</td>
					</tr>
					<tr>
						<td width="100px">가격</td>
						<td colspan="3" height="3">
							<input type="text" name="gminfoPrice" size="45" />
						</td>
					</tr>
					
				</table>
			
			</div>
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
	<% } else { // 비회원 접근 차단
		request.setAttribute("exception", new Exception("비회원 접근"));
		request.setAttribute("error-msg", "회원 로그인 후 진행하세요!");
		
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);		
	} %>
	
	
	

</body>
</html>