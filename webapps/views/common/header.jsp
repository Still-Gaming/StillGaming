<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.* "%>
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
<meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/slicknav.min.css" type="text/css">
=======
<head>
>>>>>>> refs/remotes/origin/develop
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">
<<<<<<< HEAD
    
    
    <style>
    	.header__ul {
    		margin-top : 20px;
    	}
    	
		.header__right {
			margin-top: 20px;
		}
		
		
		.header__right b a {
			font-size : 14px;
		}
    	
    </style>
=======
    <style>
    	.header__ul {
    		margin-top : 20px;
    	}
    	
		.header__right {
			margin-top: 20px;
		}
		
		
		.header__right b a {
			font-size : 14px;
		}
		
		.header__menu ul li .dropdown {
>>>>>>> refs/remotes/origin/develop

<<<<<<< HEAD


=======
			background: #EAEAEA;
	  }  	
	  
	  
	  .header__menu ul li:hover a {
		color: black;
	}
	
	.header__menu ul li a {
		color: black;
		font-size: 18px;
	}
	
	.header__menu ul li:active a {
		color : #00005D;
	}
	
	.dropdown li:hover{
		background: #5D5D5D;
	}
	
	#drop:hover {
		color: #ffffff;
	}
	
    </style>
>>>>>>> refs/remotes/origin/develop

</head>
<body>
    <!-- Header Section Begin -->
<<<<<<< HEAD

=======

>>>>>>> refs/remotes/origin/develop
    <header class="header" style="background-color: white;">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="/StillGaming/">
                            <img src="/StillGaming/resources/img/sglogo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
<<<<<<< HEAD

                  <ul class="header__ul">
                                <li><a href="#" class="menu">Shop</a></li>
                                <li><a href="./categories.jsp" class="menu">Community<span class="arrow_carrot-down"></span></a>
=======

                		  <ul class="header__ul">
                                <li><a href="#">Shop</a></li>
                                <li><a href="#">Community<span class="arrow_carrot-down"></span></a>
>>>>>>> refs/remotes/origin/develop
                                    <ul class="dropdown">
<<<<<<< HEAD
                                        <li><a href="#" >공지사항</a></li>
                                        <li><a href="#">자유게시판</a></li>
=======
                                        <li><a href="#" id="drop">공지사항</a></li>
                                        <li><a href="#" id="drop">자유게시판</a></li>
>>>>>>> refs/remotes/origin/develop
                                    </ul>
<<<<<<< HEAD
                                </li>
                                <li><a href="#" >Q&A<span class="arrow_carrot-down"></span></a>
                                   <ul class="dropdown">
                                        <li><a href="<%= request.getContextPath() %>/views/about/faq.jsp">FAQ</a></li>
                                        <li><a href="<%= request.getContextPath() %>/views/about/qna.jsp">1:1문의</a></li>
                                   </ul>

=======
                                </li>
                                <li><a href="#" >Q&A<span class="arrow_carrot-down"></span></a>
                                   <ul class="dropdown">
                                        <li><a href="#" id="drop">FAQ</a></li>
                                        <li><a href="#" id="drop">1:1문의</a></li>
                                   </ul>

>>>>>>> refs/remotes/origin/develop
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
<!--                         <a href="#" class="search-switch"><span class="icon_search"></span></a> -->
		<%if ( m == null ) { %>
                        <b><a href="/StillGaming/views/member/memberLogin.jsp" style="color: black;" >LOGIN</a></b>&nbsp; | &nbsp;
                      <b><a href="/StillGaming/views/member/memberJoin.jsp" style="color: black;" >JOIN US</a></b>
         <% } else { %>
         			<b><a href="/StillGaming/logout.me" style="color: black;" >LOGOUT</a></b>&nbsp; | &nbsp;
         			<b><a href="/StillGaming/views/mypage/mypageMain.jsp" style="color: black;" >MY PAGE</a></b>
          	<% } %>          
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
<<<<<<< HEAD

=======

>>>>>>> refs/remotes/origin/develop
    </header>
    <!-- Header End -->
    
<<<<<<< HEAD
    
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/player.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/mixitup.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
=======
 
>>>>>>> refs/remotes/origin/develop
</body>
</html>