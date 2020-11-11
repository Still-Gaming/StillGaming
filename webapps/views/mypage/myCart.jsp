<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.mypage.model.vo.*, com.kh.jsp.board.model.vo.*, java.util.*" %>
<%
	Cart cart = (Cart)request.getAttribute("cart");

	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | 장바구니</title>

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
 section {
	margin-left: 200px;
	margin-top: 100px;
	margin-right: 200px;
	margin-bottom: 50px;
}

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }

h4 {
	  letter-spacing: 5px;
}  

#hr1 {
	margin-left: 550px;
	margin-right: 550px;
	border-width: 2px;
}

.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}

 </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	
	<section>
	<h4 align="center">장바구니</h4>
	<hr id="hr1" />
	<br />
	<br />
	
	<div class="tableArea">
		<table align="center">
			<thead>
				<tr align="center">
					<th width="30">	<input type="checkbox" id="checkAll"></th>
					<th width="100">이미지</th>
					<th width="100">게임명</th>
					<th width="80">가격</th>
				</tr>
			</thead>
			<tbody>
				<% for(Cart c : list) { %>
					<tr align="center">
						<input type="hidden" name="CartNo" id="CartNo" value="<%= c.getGminfoNum() %>" />					
						<td><input type="checkbox" name="gno" id="chk" value="<%= c.getGminfoNum() %>"></td>						
 						<td><%= c.getGminfoImage() %></td>
						<td><%= c.getGminfoName() %></td>
						<td><%= c.getGminfoPrice() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	<br />
	
	<div>
		<span><button id="delete" class="btn btn-default" onclick="deleteChk();"><i class="fa fa-check"></i>삭제</button></span>
		<b style="text-align: right;" id="priceAll">총 금액 : <span style="font-size: 22px;" id="price">0</span><span> 원</span></b>
	</div>
	
		<hr style="border-width: 3px;" />
	
	<div align="center">
	<button class="btn btn-default" onclick="readyForm();">결제하기</button>
	</div>
	
    <br />
    <br />
    <br />
    <br />
	</section>
	
	
	<%@ include file="../common/footer.jsp" %>

	<script>

	$(document).ready(function(){
	    $("#checkAll").click(function(){
	        if($("#checkAll").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true);
	        }else{
	            $("input[type=checkbox]").prop("checked",false);
	        }
	        
	        var price = 0;
			
			$('input:checkbox[name=gno]').each(function() {
				if($(this).prop('checked')) {
					price += parseInt($(this).parent().siblings().eq(3).text());
				}
			});
			
			$('#price').text(price);
	    })
	
	})

	function deleteChk(){
			var chk = "";
			$( "input[id='chk']:checked" ).each (function (){
				  chk = chk + $(this).val()+ "," ;
			 });
			 chk = chk.substring(0,chk.lastIndexOf( ","));
	 
		  if(chk == ''){
		    alert("삭제할 항목을 선택하세요.");
		    return false;
		  }
		 
		  if(confirm("삭제 하시겠습니까?")){
				  console.log(chk);
				location.href='<%= request.getContextPath() %>/chkDelete.my?memberId=<%= m.getMemberId() %>&gno=' + chk;
		  }
		}
	
	$('input:checkbox[name=gno]').on('change', function() {
		var price = 0;
		
		$('input:checkbox[name=gno]').each(function() {
			if($(this).prop('checked')) {
				price += parseInt($(this).parent().siblings().eq(3).text());
			}
		});
		
		$('#price').text(price);
	});
	
	function readyForm(){
		var gameInfoNums = "";
		$('input:checkbox[name=gno]').each(function() {
			if($(this).prop('checked')) {
				gameInfoNums += $(this).parent().parent().find('input:hidden').val() + ",";
			}
		});
		
		gameInfoNums = gameInfoNums.substring(0, gameInfoNums.lastIndexOf(","));
		
		location.href = '<%= request.getContextPath() %>/view.pay?memberId=<%= m.getMemberId() %>&gameInfoNums=' + gameInfoNums;
	}
</script>

</body>
</html>