<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" %>
<% 
	HashMap<String, Integer> counts = (HashMap<String, Integer>)request.getAttribute("counts");
%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/plyr.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css"
	type="text/css">


<!-- THEME STYLES -->
<link
	href="<%=request.getContextPath()%>/resources/css/layout.min.css"
	rel="stylesheet" type="text/css" />

<style>
	.header__right, .heaer__ul {
		    font-weight:normal;
	}
</style>

</head>
<body>

	<%@ include file="../common/header.jsp"%>

	
	<div class="bg-color-sky-light" data-auto-height="true">
		<div class="content-lg container">
			<div class="row row-space-1 margin-b-2">
				<div class="col-sm-4 sm-margin-b-2" style="background: #fafafa;">
					<div class="wow fadeInLeft" data-wow-duration=".3"
						data-wow-delay=".3s">
						<div class="service" data-height="height"
							style="background: #fafafa;"></div>
					</div>
				</div>
				<div class="col-sm-4 sm-margin-b-2">
					<div class="wow fadeInLeft" data-wow-duration=".3"
						data-wow-delay=".2s">
						<div class="service" data-height="height">
							<div class="service-element">
								<h3>프로필</h3>
							</div>
							<div class="service-info">
								<i align="center" class="service-icon fa fa-user-circle"></i>
							</div>
							<a href="../member/memberUpdate.jsp" class="content-wrapper-link"></a>
						</div>
					</div>
				</div>
				<div class="col-sm-4" style="background: #fafafa;">
					<div class="wow fadeInLeft" data-wow-duration=".3"
						data-wow-delay=".1s">
						<div class="service" data-height="height"
							style="background: #fafafa;"></div>
					</div>
				</div>
			</div>
			<!--// end row -->

			<div class="row row-space-1">
				<div class="col-sm-4 sm-margin-b-2">
					<div class="wow fadeInLeft" data-wow-duration=".3"
						data-wow-delay=".4s">
						<div class="service" data-height="height">
							<div class="service-element">
								<h3>장바구니</h3>
							</div>
							<div class="service-info">
								<i align="center" class="service-icon fa fa-shopping-cart"></i>
								<%= counts.get("cartCount") %>
							</div>
							<a
								href="<%=request.getContextPath()%>/cart.my?memberId=<%=m.getMemberId()%>"
								class="content-wrapper-link"></a>
						</div>
					</div>
				</div>
				<div class="col-sm-4 sm-margin-b-2">
					<div class="wow fadeInLeft" data-wow-duration=".3"
						data-wow-delay=".5s">
						<div class="service" data-height="height">
							<div class="service-element">
								<h3>구매내역</h3>
							</div>
							<div class="service-info">
								<i align="center" class="service-icon fa fa-credit-card-alt"></i>
								<%= counts.get("ordCount") %>
							</div>
							<a
								href="<%=request.getContextPath()%>/ord.my?memberId=<%=m.getMemberId()%>"
								class="content-wrapper-link"></a>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="wow fadeInLeft" data-wow-duration=".3"
						data-wow-delay=".6s">
						<div class="service" data-height="height">
							<div class="service-element">
								<h3>게시글 조회</h3>
							</div>
							<div class="service-info">
								<i align="center" class="service-icon fa fa-align-left"></i>
								<%= counts.get("listCount") %> 
							</div>
							<a
								href="<%=request.getContextPath()%>/post.my?memberId=<%=m.getMemberId()%>"
								class="content-wrapper-link"></a>
						</div>
					</div>
				</div>
			</div>
			<!--// end row -->
		</div>
	</div>
	<!-- End Service -->
	<%@ include file="../common/footer.jsp"%>

</body>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/player.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.nice-select.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/mixitup.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.slicknav.js"></script>
<script
	sr c="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/layout.min.js"
	type="text/javascript"></script>

</body>
</html>