<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.kh.jsp.gameinfo.model.vo.*, java.util.*,  com.kh.jsp.gamereview.model.vo.*" %>
	<%
	
	GameInfo gi = (GameInfo)request.getAttribute("GameInfo");
	GameImage gie = (GameImage)request.getAttribute("GameImage");
	ArrayList<GameReview> clist = (ArrayList<GameReview>)request.getAttribute("clist");
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>게임 상세 페이지</title>

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


    <!-- Anime Section Begin -->
    <section class="anime-details spad" style="background: #0b0c2a;">
        <div class="container">
            <div class="anime__details__content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="anime__details__pic set-bg">
                           <img id="gameImg" src="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gie.getGmimgCgfile() %>">
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="anime__details__text">
                            <div class="anime__details__title">
                                <h3> <%= gi.getGminfoName() %> </h3>
                                <span></span>
                            </div>
                            <div class="anime__details__rating">
                                <div class="rating">
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star-half-o"></i></a>
                                </div>
                               
                            </div>
                            <p> <%= gi.getGminfoExp() %> </p>
                            <div class="anime__details__widget">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span>가격 :</span><%= gi.getGminfoPrice() %></li>
                                            <li><span>회사 : </span> <%= gi.getGminfoCompany() %></li>
                                            <li><span>출시 일 : </span> <%= gi.getGminfoDate() %></li>
                                           
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      
                                    </div>
                                </div>
                            </div>
                            <div class="anime__details__btn">
                                <a href="#" class="follow-btn"><i class="fa fa-heart-o"></i> 찜 목록</a>
                                <a href="#" class="watch-btn"><span>장바구니</span> <i
                                    class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
              <div class="replyArea">
			<div class="replyWriteArea">
				<form action="<%= request.getContextPath() %>/reviewInsert.do" method="post">
					<input type="hidden" name="memberId" value="<%= m.getMemberId() %>">
					<input type="hidden" name="gminfoNum" value="<%= gi.getGminfoNum() %>" />
					<input type="hidden" name="refCno" value="0" />
					<input type="hidden" name="comtLevel"  value="1"/>
					
					<div class="row">
                    <div class="col-lg-10 col-md-10">
                        <div class="anime__details__review">
                            <div class="section-title">
                                <h5>Reviews</h5>
                            </div>
                            <div class="anime__review__item">
                            <div class="anime__review__item__pic"></div>
                            <div class="anime__review__item__text" style="overflow:hidden; background:#1d1e39; padding:18px 30px 16px 20px; border-radius:10px;">
                                    <h6>Chris Curry - <span>1 Hour ago</span></h6>
                                    <p>whachikan Just noticed that someone categorized this as belonging to the genre
                                    "demons" LOL</p>
                                </div>
							<td>
								<textarea name="comtCont" id="replyContent" 
								          cols="80" rows="3"></textarea>
							</td>
							<td>
								<button type="submit" id="addReply">
									댓글 등록
								</button>
							</td>
							
						</tr>
					</table>
				</form>
		<div class="replySelectArea">
		
			
			<!-- 댓글 목록 구현 영역 -->
			<% if (clist.size() == 0 ) { %>
				<span style ="color:white;">여러분이 새 댓글의 주인공이 되어 보세요!</span>
			<% } else {
				for(GameReview bco : clist) { %>
				
			<table id="replySelectTable"
		      	 style="margin-left : <%= (bco.getComtLevel()-1) * 15 %>px;
		      	 		width : <%= 800 - ((bco.getComtLevel()-1) * 15)%>px;"
		      	 class="replyList<%=bco.getComtLevel()%>">
		  		<tr>
		  			<td rowspan="2"> </td>
					<td><b><%= bco.getMemberId() %></b></td>
					<td><%= bco.getComtDate() %></td>
					<td align="center">
 					<%if(m.getMemberId().equals(bco.getMemberId())) { %>
						<input type="hidden" name="comtNum" value="<%=bco.getComtNum() %>"/>
							 
						<button type="button" class="updateBtn" 
							onclick="updateReply(this);">수정하기</button>
							
						<button type="button" class="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none;" >수정완료</button> &nbsp;&nbsp;
							
						<button type="button" class="deleteBtn"
							onclick="deleteReply(this);">삭제하기</button>
							
					<% } else if( bco.getComtLevel() < 3) { %>
						<input type="hidden" name="memberId" value="<%= bco.getMemberId()%>"/>
						<input type="hidden" name="refCno" value="<%= bco.getComtNum() %>" />
						<input type="hidden" name="comtLevel" value="<%=bco.getComtLevel() %>" />
						<button type="button" class="insertBtn" 
							 onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
							 
						<button type="button" class="insertConfirm"
							onclick="reConfirm(this);"
							style="display:none;" >댓글 추가 완료</button> 
							
					<% } else {%>
						<span> 마지막 레벨입니다.</span>
					<% } %>
					</td>
				</tr>
				<tr class="comment replyList<%=bco.getComtLevel()%>">
					<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="105" rows="3"
					 readonly="readonly"><%= bco.getComtCont() %></textarea>
					</td>
				</tr>
			</table>
				
					
			<%
				}
			}
			%>
			
			</div>
		
		</div>
	<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/player.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.nice-select.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/mixitup.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script> 
		
		
		
		<script>
		
			function reComment(obj) {
				// 추가 완료 버튼
				$(obj).siblings('.insertConfirm').css('display', 'inline');
				
				// 현재 클릭한 버튼 숨기기
				$(obj).css('display', 'none');
				
				// 대댓글 입력공간 만들기
				var htmlForm = 
					'<tr class="comment"><td></td>'
						+'<td colspan="3" style="background : transparent;">'
							+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
						+ '</td>'
					+ '</tr>';
				
				$(obj).parents('table').append(htmlForm);
			}
		
			function reConfirm(obj){
				// 참조할 댓글 번호 가져오기
				var refcno = $(obj).siblings('input[name=refCno]').val();
				var level = $(obj).siblings('input[name=comtLevel]').val();
				
				level = Number(level) + 1;
				
				// 게시글 번호 가져오기
				var bno = '<%= gi.getGminfoNum() %>';
				
				var content = $(obj).parent().parent().siblings()
				              .last().find('textarea').val();
				
				location.href = '<%=request.getContextPath()%>/reviewInsert.do'
						+ '?memberId=<%= m.getMemberId()%>'
						+ '&comtCont=' + content
						+ '&gminfoNum=' + bno
						+ '&refCno=' + refcno
						+ '&comtLevel=' + level;
						
					
			}
			
			function updateReply(obj) {
				// 현재 버튼의 위치와 가장 가까운 textarea 접근하기
				$(obj).parent().parent().next().find('textarea').removeAttr('readonly');
				
				// 수정 완료 버튼 보이게 하기
				$(obj).siblings('.updateConfirm').css('display', 'inline');
				
				// 현재 클릭한 수정 버튼 숨기기
				$(obj).css('display', 'none');
			}
			
			function updateConfirm(obj) {
				// 수정을 마친 댓글 내용 가져오기
				var content = $(obj).parent().parent().next().find('textarea').val();
				
				// 댓글 번호 가져오기	
				var cno = $(obj).siblings('input').val();
				
				location.href = "<%= request.getContextPath() %>/reviewUpdate.do?"
						      + "gminfoNum=<%= gi.getGminfoNum() %>"
						      + "&comtNum=" + cno
						      + "&comtCont=" + content;
			}
			
			function deleteReply(obj){
				// 댓글 번호 가져오기
				var cno = $(obj).siblings('input').val();
				
				// 게시글 번호 가져오기
				var bno = '<%= gi.getGminfoNum() %>';
				
				//console.log("삭제 댓글 번호 : " + cno + " / " + bno);
				
				location.href="<%= request.getContextPath() %>/reviewDelete.do"
				            + "?comtNum=" + cno + "&gminfoNum=" + bno;
				
			}
			
		</script>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
		
	</div>
	
	
		<%@ include file="/views/common/footer.jsp" %>
	
    </html>