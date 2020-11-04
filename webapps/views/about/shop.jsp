<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />

<!-- styles -->
<link rel="stylesheet"
	href="//cdn-cms-s.f-static.net/versions/2/css/minimizeSITE123website.css?v=r6915"
	type="text/css" crossorigin="anonymous">
<link rel="stylesheet"
	href="//cdn-cms-s.f-static.net/versions/2/css/minimizeSITE123website_inside_page.css?v=r6915"
	type="text/css" crossorigin="anonymous">
<title>Still Gaming</title>

</head>



<body class="language_ko insidePage landingPage "
	data-user-language="ko">

	<%@ include file="../common/header.jsp"%>

	<div class="container-fluid landing_bigTempImage clean">
		<div class="landing_rowMainImage">
			<div style="display: inline; max-width: 50%;">

				<ul id="websitesTemplatesCategoriesBox"
					class="list-group s123-categories-navbar horizontal"
					style="display: inline;">
					<li class="list-group-item active" data-cat="all"><a>모두</a></li>
					<li class="list-group-item " data-cat="1"><a>랭킹</a></li>
					<li class="list-group-item " data-cat="2"><a>신작</a></li>
					<li class="list-group-item " data-cat="2"><a>어쩌구</a></li>
					<li class="list-group-item " data-cat="2"><a>저쩌구</a></li>

				</ul>
			</div>
		</div>
	</div>

	<table>
		<tr>
			<td><img src="../../resources/img/tekken.png" width="100px"
				height="100px" /> <span> 철권 </span></td>
		
		<tr>
			<td><img src="../../resources/img/tekken.png" width="100px"
				height="100px" />  <span> 철권 </span>  </td>
		</tr>
		
		<tr>
			<td><img src="../../resources/img/tekken.png" width="100px"
				height="100px" />  <span> 철권 </span> </td>
		</tr>
	</table>



	<script>
		//We use this to tell the tracker to what landing page the user get
		window.TrackJS && TrackJS.install({
			token : "796de012983949dcac1df8994f9f070b"
		});
		var landPage = '';
		var utm_landingPage = 'homepage';
		var intercomStatus = 'active';
		var popupExitStatus = 'disable';
		var design = '';
		var language = 'ko';
		var page = '';
		var signUpLink = 'https://app.site123.com/manager/login/sign_up.php?l=ko';
		var generalSignupLink = 'https://app.site123.com/manager/login/sign_up_general.php?l=ko';
		var homepageMenuTransparent = '';
		var slideSpeed = 500; //Use in templates page
		var youTubeMovie = 'L1lS_w_w5KE';
		var translate1 = "\uc8c4\uc1a1\ud569\ub2c8\ub2e4. {{domain}}\uc740 \uc720\ud6a8\ud55c \ub3c4\uba54\uc778 \uc774\ub984\uc774 \uc544\ub2d9\ub2c8\ub2e4.";
		var translate2 = "{{domain}}\uc740 (\ub294) \uc11c\ube0c \ub3c4\uba54\uc778\uc785\ub2c8\ub2e4. \ub3c4\uba54\uc778 \uc774\ub984\uc5d0 \uc810\uc744 \ud3ec\ud568\ud560 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4.";
		var translate3 = "\ub3c4\uba54\uc778\uc774 \uc0ac\uc6a9 \uac00\ub2a5\ud569\ub2c8\ub2e4.";
		var translate4 = "\uc8c4\uc1a1\ud569\ub2c8\ub2e4. {{domainName}}\uc740 \uc0ac\uc6a9\ud560 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4.";
		var translate_domain_cancel = "\ub2e4\uc2dc \uac80\uc0c9";
		var translate_domain_ok = "\uc9c0\uae08 \ubc1b\uc544\ubcf4\uc138\uc694!";
		var translate_my_account = "\ub0b4 \uacc4\uc815";
		var translateLiveChatDisable = "\ud604\uc7ac \uace0\uac1d\ub2d8\uc758 \uad6d\uac00\uc5d0\uc11c \ub77c\uc774\ube0c \ucc44\ud305 \uc9c0\uc6d0\uc744 \uc0ac\uc6a9\ud560 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4.";
		var translateLiveChatOK = "\ud655\uc778";

		// Get the order system version
		var order_system_folder = "s123_order_pro";
	</script>
	<!-- ace scripts -->
	<script
		src="//cdn-cms-s.f-static.net/versions/2/js/minimizeSITE123website.js?v=r6915"
		crossorigin="anonymous"></script>
	<script
		src="//cdn-cms-s.f-static.net/versions/2/js/minimizeSITE123_tracker.js?v=r6915"
		crossorigin="anonymous"></script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>