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
    
    <style>
    	.product__pagination a:hover {
	color: #b7b7b7;
	cursor: pointer;
}
    </style>
    
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	<!-- Product Section Begin -->
    <section class="product-page spad"  style="background: #0b0c2a; ">
        <div class="container">
            <div class="row" >
                <div class="col">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4 >Games</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
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
                        </div>
                        <div class="row">
                        <% if(list == null || list.size() == 0) { %>
                        	<div class="col-lg-8 col-md-8 col-sm-8">
                        		<h2>조회된 상품이 없습니다.</h2>
                        	</div>
                        <% } else { for(GameInfo gi : list) { %>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gi.getGminfoImage() %>">
                                        <div class="ep"><%= gi.getGminfoDate() %></div>
                                       
                                        <div class="view"><i class="fa fa-check"></i> <%= gi.getGminfoAgeRank() %></div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li><%= gi.getGminfoType() %></li>
                                        </ul>
                                        <h5><a  href="<%= request.getContextPath() %>/selectone.do?gminfoNum=<%=gi.getGminfoNum()%>"><%= gi.getGminfoName() %></a></h5></div>
                                       	&nbsp;&nbsp;
                                      
                                    </div>
                                </div>
                            <% } } %>
                            </div>
                            <% if(chkSearch) {  %> 
                    <div class="product__pagination" align="center" >
                  
		<a onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=1'"><<</a>
		
		<%  if(pi.getCurrentPage() <= 1){  %>
			<a class="current-page"><</a>
		<%  }else{ %>
			<a onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= pi.getCurrentPage() - 1 %>'"><</a>
		<%  } %>
			
		<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){
				if(p == pi.getCurrentPage()){ %>
				<a class="current-page"><%= p %></a>
			<% } else { %>
				<a onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= p %>'"><%= p %></a>
			<% } %>
		<% } %>
				
		<%  if(pi.getCurrentPage() >= pi.getMaxPage()){  %>
			<a class="current-page">></a>
		<%  } else { %>
			<a onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= pi.getCurrentPage() + 1 %>'">></a>
		<%  } %>
		
		<a onclick="location.href='<%= request.getContextPath() %>/gamelist.do?currentPage=<%= pi.getMaxPage() %>'">>></a>
		
	</div>
	<% } %>
                        </div>
                        <button onclick="location.href='views/shop/gameInsertForm.jsp'">작성하기</button>
                    </div>
                   <!--   <div class="product__sidebar">
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
    <div class="product__sidebar__comment">
        <div class="section-title">
            <h5>New Comment</h5>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-1.jpg" alt="">
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
                <img src="img/sidebar/comment-2.jpg" alt="">
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
                <img src="img/sidebar/comment-3.jpg" alt="">
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
                <img src="img/sidebar/comment-4.jpg" alt="">
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
	
	</section>
	
	
	<%@ include file="/views/common/footer.jsp" %>
	
	<script>  
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchGame.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
		
	</script>
	


</body>
</html>