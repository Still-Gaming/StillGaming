<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.gameinfo.model.vo.*"%>
<%
	ArrayList<GameInfo> list = (ArrayList<GameInfo>)request.getAttribute("list");
	
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>


<!DOCTYPE html>
<html lang="ko">
<head>

<title>스틸게이밍 상점</title>

	<style>
			/* Style the tab */
			.tab {
				overflow: hidden;
				border: 1px solid #ccc;
				background-color: #FBF8F8;
			}
			
			/* Style the buttons that are used to open the tab content */
			.tab button {
				background-color: inherit;
				float: left;
				border: none;
				outline: none;
				cursor: pointer;
				padding: 14px 16px;
				transition: 0.3s;
			}
			
			/* Change background color of buttons on hover */
			.tab button:hover {
				background-color: #ddd;
			}
			
			/* Create an active/current tablink class */
			.tab button.active {
				background-color: #ccc;
			}
			
			/* Style the tab content */
			.tabcontent {
				display: none;
				padding: 6px 12px;
				border: 1px solid #ccc;
				border-top: none;
			}
			.tabcontent {
  				animation: fadeEffect 1s; /* Fading effect takes 1 second */
  				background-color : #ddd;
			}
			

		/* Go from zero to full opacity */
		@keyframes fadeEffect {
 			 from {opacity: 0;}
 		 to {opacity: 1;}
		}
				* {
		  box-sizing: border-box;
					}
		
		/* Style the search field */
		form.example input[type=text] {
		  padding: 10px;
		  font-size: 20px;
		  border: 1px solid grey;
		  float: right;
		  width: 20%;
		  background: white;
		}
		
		/* Style the submit button */
		form.example button {
		  float: right;
		  width: 20%;
		  padding: 10px;
		  background: #2196F3;
		  color: white;
		  font-size: 17px;
		  border: 1px solid grey;
		  border-left: none; /* Prevent double borders */
		  cursor: pointer;
		}
		
		form.example button:hover {
		  background: #0b7dda;
		}
		
		/* Clear floats */
		form.example::after {
		  content: "";
		  clear: both;
		  display: table;
		}
	</style>
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

	<%@ include file="/views/common/header.jsp" %>
	
	<!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>Games</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>Order by:</p>
                                        <select>
                                            <option value="">A-Z</option>
                                            <option value="">1-10</option>
                                            <option value="">10-50</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        <% for(GameInfo gi : list) { %>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gi.getGminfoImage() %>">
                                        <div class="ep"><%= gi.getGminfoDate() %></div>
                                       
                                        <div class="view"><i class="fa fa-check"></i> <%= gi.getGminfoAgeRank() %></div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li><%= gi.getGminfoType() %></li>
                                        </ul>
                                        <h5><a href="<%= gi.getGminfoNum() %>"><%= gi.getGminfoName() %></a></h5>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                        <button onclick="location.href='views/shop/gameInsertForm.jsp'">작성하기</button>
                    </div>
                    <div class="product__pagination">
                    <a href="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=1'"><<</a>
		
		<%  if(currentPage <= 1){  %>
			<a class="current-page"><</a>
		<%  }else{ %>
			<a href="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= currentPage - 1 %>'"><</a>
		<%  } %>
			
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){ %>
				<a class="current-page"><%= p %></a>
			<% } else { %>
				<a href="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= p %>'"><%= p %></a>
			<% } %>
		<% } %>
				
		<%  if(currentPage >= maxPage){  %>
			<a class="current-page">></a>
		<%  } else { %>
			<a href="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= currentPage + 1 %>'">></a>
		<%  } %>
		
		<a href="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= maxPage %>'">>></a>
	
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
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
                                data-setbg="img/sidebar/tv-1.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Boruto: Naruto next generations</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix month week"
                            data-setbg="img/sidebar/tv-2.jpg">
                            <div class="ep">18 / ?</div>
                            <div class="view"><i class="fa fa-eye"></i> 9141</div>
                            <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                        </div>
                        <div class="product__sidebar__view__item set-bg mix week years"
                        data-setbg="img/sidebar/tv-3.jpg">
                        <div class="ep">18 / ?</div>
                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                        <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg mix years month"
                    data-setbg="img/sidebar/tv-4.jpg">
                    <div class="ep">18 / ?</div>
                    <div class="view"><i class="fa fa-eye"></i> 9141</div>
                    <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
                </div>
                <div class="product__sidebar__view__item set-bg mix day"
	                data-setbg="img/sidebar/tv-5.jpg">
	                <div class="ep">18 / ?</div>
	                <div class="view"><i class="fa fa-eye"></i> 9141</div>
	                <h5><a href="#">Fate stay night unlimited blade works</a></h5>
            	</div>
        		</div>
    		</div>
		</div>
	</div>
	</div>
	</div>
	</section>
	<script>
		function openCity(evt, cityName) {
		  // Declare all variables
		  var i, tabcontent, tablinks;

		  // Get all elements with class="tabcontent" and hide them
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }

		  // Get all elements with class="tablinks" and remove the class "active"
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }

		  // Show the current tab, and add an "active" class to the button that opened the tab
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
	</script>
	
	<%@ include file="/views/common/footer.jsp" %>
	
	<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>

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