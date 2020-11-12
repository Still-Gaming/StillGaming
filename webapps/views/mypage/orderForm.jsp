<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.gameinfo.model.vo.*"%>
<%  
	ArrayList<GameInfo> list = (ArrayList<GameInfo>) request.getAttribute("list"); 
	int price = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Still Gaming | 결제</title>

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
 <script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	<h4 align="center">주문서 작성</h4>
	<hr id="hr1" />
	<br />
	<br />
	
	<div class="tableArea">
		<table align="center">
			<thead>
				<tr align="center">
					<th width="100">이미지</th>
					<th width="100">게임명</th>
					<th width="80">가격</th>
				</tr>
			</thead>
			<tbody>
				<% for(GameInfo gi : list) { %>
					<tr align="center">
						<input type="hidden" name="CartNo" id="CartNo" value="<%= gi.getGminfoNum() %>" />						
 						<td><img src="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gi.getGminfoImage() %>"></td>
						<td id="name"><%= gi.getGminfoName() %></td>
						<td><%= gi.getGminfoPrice() %></td>
					</tr>
					<% price += gi.getGminfoPrice(); %>
				<% } %>
			</tbody>
		</table>
	</div>
	<br />
	
	<div>
		<b style="text-align: right;" id="priceAll">총 금액 : <span style="font-size: 22px;" id="price"><%= price %></span><span> 원</span></b>
	</div>
	
		<hr style="border-width: 3px;" />
	
	<div align="center">
	<button class="btn btn-default" id="payBtn">결제하기</button>
	</div>
			</section>
	
      <table style="display:none;">
         <!-- 결제 정보에 사용-->
         <tr>
            <td>이름 : <span id="memberName" value="<%= m.getMemberName() %>"><%= m.getMemberName() %></span></td>
         </tr>
         <tr>
            <td>이메일 : <span id="email" value="<%= m.getMemberName() %>"><%=m.getEmail()%></span></td>
         </tr>
         <tr>
            <td>연락처 : <span id="phone" value="<%=m.getPhone()%>"><%=m.getPhone()%></span></td>
         </tr>
      </table>

    <br />
    <br />
    <br />
    <br />
	
		<%@ include file="../common/footer.jsp" %>

	<script>


		$('#payBtn').on('click', function(){
			// 문서 로딩될 때 바로 호출
			
			      var mname = $('#memberName').text();
     			  var memail = $('#email').text();var mphone = $('#phone').text();
     			  console.log(mname);
     			  console.log(memail);
     			  console.log(mphone);

     		var IMP = window.IMP; // 생략가능
     		IMP.init('imp38962817');

			IMP.request_pay({
					pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : 'Still Gaming',
					amount : parseInt($('#price').text()),
					buyer_email : memail,
					buyer_name : mname,
					buyer_tel : mphone,
					buyer_addr : '서울시 강남구 역삼동',
					buyer_postcode : 'TC0ONETIME'
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        
					    alert(msg);

<%-- 			             location.href="<%=request.getContextPath()%>/insertPay.do?
 --%>					    
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        alert(msg);
				        
				        location.href="<%=request.getContextPath()%>/views/mypage/orderFail.jsp";
				    }

				});
		});
			
	</script>

</body>
</html>