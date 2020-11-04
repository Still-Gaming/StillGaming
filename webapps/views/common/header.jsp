<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="./index.jsp">
                            <img src="resources/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="./index.jsp">상점</a></li>
                                <li><a href="./categories.jsp">커뮤니티<span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./categories.jsp">Categories</a></li>
                                        <li><a href="./anime-details.jsp">Anime Details</a></li>
                                        <li><a href="./anime-watching.jsp">Anime Watching</a></li>
                                        <li><a href="./blog-details.jsp">Blog Details</a></li>
                                        <li><a href="../about/signup.jsp">Sign Up</a></li>
                                        <li><a href="../about/login.jsp">Login</a></li>
                                    </ul>
                                </li>
                                <li><a href="./blog.jsp">Our Blog</a></li>
                                <li><a href="#">Contacts</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                        <a href="/StillGaming/views/about/login.jsp"><span class="icon_profile"></span></a>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->