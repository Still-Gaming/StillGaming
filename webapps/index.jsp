<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.gameinfo.model.vo.*, java.util.*" %>
<%
	ArrayList<GameImage> list = (ArrayList<GameImage>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Still Gaming</title>
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
 
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<%@ include file="views/common/header.jsp" %>

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="/StillGaming/resources/img/index/amongus.png">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Survival</div>
                                <h2>Among us</h2>
                                <p>An online and local party game of teamwork and betrayal for 4-10 players...in space!</p>
                                <a href="#"><span>Buy Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="hero__items set-bg" data-setbg="/StillGaming/resources/img/index/battle.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">FPS</div>
                                <h2>Battle Grounds</h2>
                                <p>An online and local party game of teamwork and betrayal for 4-10 players...in space!</p>
                                <a href="#"><span>Buy Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="/StillGaming/resources/img/index/cyber.jpg">

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Action RPG</div>
                                <h2>CyberPunk 2077</h2>
                                <p>An online and local party game of teamwork and betrayal for 4-10 players...in space!</p>
                                <a href="#"><span>Buy Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad" style="color: black;">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4 style="color:black;">최신 게임</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="<%= request.getContextPath() %>/gamelist.do" class="primary-btn" style="color:black;">더보기<span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        
                        <% for(GameImage gi : list) { %>
                        	<div class="col-lg-4 col-md-6 col-sm-6">
                        		<div class="product__item">
                        			<div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gi.getGmimgCgfile() %>">
                                        <div class="ep"><%= gi.getGminfoDate() %></div>
                                        <div class="view"><i class="fa fa-check"></i> <%= gi.getGminfoAgeRank() %></div>
                                    </div>
                                    <div class="product__item__text">
                                    	<ul>
                                            <li style="color:black;"><%= gi.getGminfoType() %></li>
                                        </ul>
                                        <h5><a href="#" style="color:black;"><%= gi.getGminfoName() %></a></h5>
                                    </div>
                        		</div>
                        	</div>
                        <% } %>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
<!--            	<div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>Top Views</h5>
                            </div>
                            <ul class="filter__controls">
                                <li class="active" data-filter="*">Day</li>
                                <li data-filter=".week">Week</li>
                                <li data-filter=".month">Month</li>
                                <li data-filter=".years">Years</li>
                            </ul>
                            <div class="filter__gallery">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                data-setbg="resources/img/sidebar/tv-1.jpg">
	                                <div class="ep">18 / ?</div>
	                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Boruto: Naruto next generations</a></h5>
                            	</div>
	                            <div class="product__sidebar__view__item set-bg mix month week"
	                            data-setbg="resources/img/sidebar/tv-2.jpg">
		                            <div class="ep">18 / ?</div>
		                            <div class="view"><i class="fa fa-eye"></i> 9141</div>
		                            <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
	                        	</div>
		                        <div class="product__sidebar__view__item set-bg mix week years"
		                        data-setbg="resources/img/sidebar/tv-3.jpg">
		                        	<div class="ep">18 / ?</div>
		                        	<div class="view"><i class="fa fa-eye"></i> 9141</div>
		                        	<h5><a href="#">Sword art online alicization war of underworld</a></h5>
		                    	</div>
			                    <div class="product__sidebar__view__item set-bg mix years month"
			                    data-setbg="resources/img/sidebar/tv-4.jpg">
			                    	<div class="ep">18 / ?</div>
			                    	<div class="view"><i class="fa fa-eye"></i> 9141</div>
			                    	<h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
			                	</div>
				                <div class="product__sidebar__view__item set-bg mix day"
				                data-setbg="resources/img/sidebar/tv-5.jpg">
				                	<div class="ep">18 / ?</div>
				                	<div class="view"><i class="fa fa-eye"></i> 9141</div>
				                	<h5><a href="#">Fate stay night unlimited blade works</a></h5>
				            	</div>
					        </div>
					    </div>
					    <div class="product__sidebar__comment">
					        <div class="section-title">
					            <h5>New Comment</h5>
					        </div>
        					<div class="product__sidebar__comment__item">
            					<div class="product__sidebar__comment__item__pic">
                					<img src="resources/img/sidebar/comment-1.jpg" alt="">
            					</div>
            					<div class="product__sidebar__comment__item__text">
					                <ul>
					                    <li>Active</li>
					                    <li>Movie</li>
					                </ul>
					                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
					                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
					            </div>
        					</div>
        					<div class="product__sidebar__comment__item">
					            <div class="product__sidebar__comment__item__pic">
					                <img src="resources/img/sidebar/comment-2.jpg" alt="">
					            </div>
            					<div class="product__sidebar__comment__item__text">
					                <ul>
					                    <li>Active</li>
					                    <li>Movie</li>
					                </ul>
					                <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
					                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
					            </div>
        					</div>
					        <div class="product__sidebar__comment__item">
					            <div class="product__sidebar__comment__item__pic">
					                <img src="resources/img/sidebar/comment-3.jpg" alt="">
					            </div>
					            <div class="product__sidebar__comment__item__text">
					                <ul>
					                    <li>Active</li>
					                    <li>Movie</li>
					                </ul>
					                <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
					                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
					            </div>
					        </div>
					        <div class="product__sidebar__comment__item">
					            <div class="product__sidebar__comment__item__pic">
					                <img src="resources/img/sidebar/comment-4.jpg" alt="">
					            </div>
					            <div class="product__sidebar__comment__item__text">
					                <ul>
					                    <li>Active</li>
					                    <li>Movie</li>
					                </ul>
					                <h5><a href="#">Monogatari Series: Second Season</a></h5>
					                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
					            </div>
					        </div>
					    </div>
					</div> -->
				</div>
			</div>
		</div>
	</section>
<!-- Product Section End -->

	<%@ include file="views/common/footer.jsp" %>

</body>

</html>