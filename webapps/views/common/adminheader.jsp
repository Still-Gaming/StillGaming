<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.* "%>
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css" type="text/css">
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

</head>
<body>
    <!-- Header Section Begin -->

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

                		  <ul class="header__ul">
                                <li><a href="<%= request.getContextPath()%>/views/manage/member_manage.jsp">회원관리</a></li> |
                                <li><a href="#">신고관리</a></li> |
                                <li><a href="#">게시글관리</a></li> |
                                <li><a href="#">Q&A 관리</a></li> |
                                <li><a href="#">공지사항 관리</a></li> 
                                
                                
                                
                                
                               

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
    
 
</body>
</html>