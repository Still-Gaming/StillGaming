<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.gameinfo.model.vo.*"%>
<%
	ArrayList<GameInfo> list = (ArrayList<GameInfo>)request.getAttribute("list");
	
	PageInfo pi = null;
	String keyword = request.getParameter("keyword");
	boolean chkSearch = false;
	if(list != null && list.size() > 0 && (keyword == null)) {
		pi = (PageInfo)request.getAttribute("pi");
		chkSearch = true;
	}
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
                                        <h4 style='color:black;'>Games</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p  style='color:black;'> Order by:</p>
                                        <select>
                                            <option value="">A-Z</option>
                                            <option value="">1-10</option>
                                            <option value="">10-50</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="searchArea" align="center">
									<select id="searchCondition" name="searchCondition">
										<option value="">---</option>
										<option value="name">게임이름</option>
										<option value="company">게임회사</option>
										<option value="content">내용</option>
								</select>
								<input type="search" id="keyword" placeholder="키워드를 입력하세요!"> 
								<button type="button" onclick="search();">검색하기</button>
							</div>
                            </div>
                        </div>
                        <div class="row">
                        <% if(list == null || list.size() == 0) { %>
                        	<div class="col-lg-10 col-md-10 col-sm-10">
                        		<h2>조회된 상품이 없습니다.</h2>
                        	</div>
                        <% } else { for(GameInfo gi : list) { %>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gi.getGminfoImage() %>">
                                        <div class="ep"><%= gi.getGminfoDate() %></div>
                                       
                                        <div class="view"><i class="fa fa-check"></i> <%= gi.getGminfoAgeRank() %></div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li style="color : black;"><%= gi.getGminfoType() %></li>
                                        </ul>
                                        <h5><a  style="color : black;" href="<%= request.getContextPath() %>/selectone.do?gminfoNum=<%=gi.getGminfoNum()%>"><%= gi.getGminfoName() %></a></h5></div>
                                       	&nbsp;&nbsp;
                                      
                                    </div>
                                </div>
                            </div>
                            <% } } %>
                        </div>
                        <button onclick="location.href='views/shop/gameInsertForm.jsp'">작성하기</button>
                    </div>
                    <% if(chkSearch) {  %> 
                    <div class="pagingArea" align="center">
	
		<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=1'"><<</button>
		
		<%  if(pi.getCurrentPage() <= 1){  %>
			<button disabled><</button>
		<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= pi.getCurrentPage() - 1 %>'"><</button>
		<%  } %>
			
		<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){
				if(p == pi.getCurrentPage()){ %>
				<button disabled><%= p %></button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= p %>'"><%= p %></button>
			<% } %>
		<% } %>
				
		<%  if(pi.getCurrentPage() >= pi.getMaxPage()){  %>
			<button disabled>></button>
		<%  } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= pi.getCurrentPage() + 1 %>'">></button>
		<%  } %>
		
		<button onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= pi.getMaxPage() %>'">>></button>
		
	</div>
	<% } %>
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
	
	<script>  
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchGame.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
		
	</script>
	
	</section>
	
	
	<%@ include file="/views/common/footer.jsp" %>
	
	
	


</body>
</html>