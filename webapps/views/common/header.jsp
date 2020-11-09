<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.* "%>
<%
	Member m = (Member)session.getAttribute("member");
%>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/headerstyle.css" type="text/css">
	<style>
	
	.header {	
		font-family: "Mulish", sans-serif;
	}
	</style>
    <!-- Header Section Begin -->

    <header class="header" style="background-color: white;">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="/StillGaming/">
                            <img src="/StillGaming/resources/img/sglogo.png">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">

                		  <ul class="header__ul">
                                <li><a href="<%= request.getContextPath() %>/gamelist.do">Store</a></li>
                                <li><a href="#">Community<span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="#" id="drop">공지사항</a></li>
                                        <li><a href="<%= request.getContextPath() %>/selectList.bo" id="drop">자유게시판</a></li>
                                    </ul>
                                </li>
                                
								<li><a href="#" >Q&A<span class="arrow_carrot-down"></span></a>
                                   <ul class="dropdown">
                                        <li><a href="<%= request.getContextPath()%>/views/about/faq.jsp" id="drop">FAQ</a></li>
                                        <li><a href="<%= request.getContextPath()%>/views/about/qna.jsp" id="drop">1:1문의</a></li>
                                   </ul>

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

    </header>
    <!-- Header End -->
