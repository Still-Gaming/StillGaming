<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.gameinfo.model.vo.*"%>
<%
	ArrayList<GameInfo> list = (ArrayList<GameInfo>)request.getAttribute("list");
	GameInfo gif = (GameInfo)request.getAttribute("gif");
	GameImage gii = (GameImage)request.getAttribute("gii");
	
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
  		.btnArea {
  			width : 500px;
  			height : 450px;
  			margin-left : auto;
  			margin-right : auto;
  		}
  		.btnArea {
  			width : 150px;
  			margin-left: auto;
  			margin-right : auto;
  		}
  		#titleImgArea {
  			width :350px;
  			height : 200px;
  			border : 2px dashed darkgray;
  			text-align: center;
  			display : table-cell;
  			vertical-align:middle;
  		}
  	</style>
    
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
                            <div class="col-sm-8">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gi.getGminfoImage() %>">
                                        <div class="ep"><%= gi.getGminfoDate() %></div>
                                       
                                        <div class="view"><i class="fa fa-check"></i> <%= gi.getGminfoAgeRank() %></div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li><%= gi.getGminfoType() %></li>
                                        </ul>
                                        <h5><a href="<%= request.getContextPath() %>/selectone.do?gminfoNum=<%=gi.getGminfoNum()%>"><%= gi.getGminfoName() %></a></h5></div>
                                       	&nbsp;&nbsp;
                                      
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                        <button onclick="location.href='views/shop/gameInsertForm.jsp'">작성하기</button>
                    </div>
                    
                    <div class="pagingArea" align="center">
	
		<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=1'"><<</button>
		
		<%  if(currentPage <= 1){  %>
			<button disabled><</button>
		<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= currentPage - 1 %>'"><</button>
		<%  } %>
			
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){ %>
				<button disabled><%= p %></button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= p %>'"><%= p %></button>
			<% } %>
		<% } %>
				
		<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
		<%  } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= currentPage + 1 %>'">></button>
		<%  } %>
		
		<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= maxPage %>'">>></button>
		
	</div>
	
                </div>
             
	</div>
	</div>
	</section>
	
	
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