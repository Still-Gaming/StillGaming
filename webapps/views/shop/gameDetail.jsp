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
	
	<style>
		textarea {
			resize: none;
		}
	</style>
</head>

<body >

	<%@ include file="/views/common/header.jsp" %>


    <!-- Anime Section Begin -->
    <section class="anime-details spad" style="background: #0b0c2a;">
    	<div class="container">
    		<div class="anime__details__content">
    			<div class="row">
    				<div class="col-lg-3">
    					<div class="anime__details__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/gameimageUploadFiles/<%= gie.getGmimgCgfile() %>">
                            <!-- <div class="comment"><i class="fa fa-comments"></i> 11</div> --><!-- 왼쪽 아래 말풍선 -->
                            <div class="view"><i class="fa fa-check"></i><%= gi.getGminfoAgeRank() %></div>
                        </div>
    				</div>
    				
    				<div class="col-lg-9">
			    		<div class="anime__details__text">
			    			<div class="anime__details__title">
			    				<input type="hidden" id="gminfoNum" value="<%= gi.getGminfoNum() %>" />
                                <h3><%= gi.getGminfoName() %></h3>
                                <span><%= gi.getGminfoCompany() %></span>
                            </div>
                            <p><%= gi.getGminfoExp() %></p>
                            <div class="anime__details__widget">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span>가격 : </span><%= gi.getGminfoPrice() %></li>
                                            <li><span>회사 : </span><%= gi.getGminfoCompany() %></li>
                                            <li><span>출시 일 : </span><%= gi.getGminfoDate() %></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                    <!-- 
                                        <ul>
                                            <li><span>Scores:</span> 7.31 / 1,515</li>
                                            <li><span>Rating:</span> 8.5 / 161 times</li>
                                            <li><span>Duration:</span> 24 min/ep</li>
                                            <li><span>Quality:</span> HD</li>
                                            <li><span>Views:</span> 131,541</li>
                                        </ul>
                                     -->
                                    </div>
                                </div>
                            </div>
                            <div class="anime__details__btn">
                                <!-- <a href="#" class="follow-btn"><i class="fa fa-krw"></i>바로 결제</a> -->
                                <a href="#" class="watch-btn" id="cart"><i class="fa fa-shopping-cart"></i><span>장바구니 담기</span> <i
                                    class="fa fa-angle-right"></i></a>
                            </div>
			    		</div>
    				</div>
    			</div>
    		</div>
    		
    		<div class="row">
    			<div class="col-lg-8 col-md-8">
    				<div class="anime__details__review" style="clear: both;">
    					<div class="section-title">
                        	<h5>Reviews</h5>
                        </div>
                        
                        
                        <!-- 댓글 목록 구현 영역 -->
						<% if (clist.size() == 0 ) { %>
							<span style ="color:white;">여러분이 새 댓글의 주인공이 되어 보세요!</span>
						<% } else {
							for(GameReview co : clist) { %>
							
							<table id="replySelectTable"
						      	 style="margin-left : <%= (co.getComtLevel()-1) * 15 %>px;
						      	 		width : <%= 800 - ((co.getComtLevel()-1) * 15)%>px;"
						      	 class="replyList<%= co.getComtLevel()%>">
						  		<tr>
									<td><b><%= co.getMemberId() %></b></td>
									<td align="center">
										<% if(m != null) { %>
						 					<% if(m.getMemberId().equals(co.getMemberId())) { %>
												<input type="hidden" name="comtNum" value="<%= co.getComtNum() %>"/>
													 
												<button type="button" class="updateBtn" 
													onclick="updateReply(this);">수정하기</button>
													
												<button type="button" class="updateConfirm"
													onclick="updateConfirm(this);"
													style="display:none;" >수정완료</button> &nbsp;&nbsp;
													
												<button type="button" class="deleteBtn"
													onclick="deleteReply(this);">삭제하기</button>
													
											<% } else if( co.getComtLevel() < 3) { %>
												<input type="hidden" name="memberId" value="<%= co.getMemberId()%>"/>
												<input type="hidden" name="refCno" value="<%= co.getComtNum() %>" />
												<input type="hidden" name="comtLevel" value="<%= co.getComtLevel() %>" />
												<button type="button" class="btn insertBtn" 
													 onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
													 
												<button type="button" class="insertConfirm"
													onclick="reConfirm(this);"
													style="display:none;" >댓글 추가 완료</button> 
													
											<% } else {%>
												<span> 마지막 레벨입니다.</span>
											<% } %>
										<% } else { %>
											<button type="button" class="insertBtn" disabled>댓글 달기</button>
										<% } %>
									</td>
								</tr>
								<tr class="comment replyList<%= co.getComtLevel()%>">
									<td colspan="3" style="background : transparent;">
										<textarea class="reply-content" cols="105" rows="3"
										 readonly="readonly"><%= co.getComtCont() %></textarea>
									</td>
								</tr>
							</table>
							
								
						<%
							}
						}
						%>
                        
                        
    				</div>
    				<div class="anime__details__form" style="clear: both; ">
                        <div class="section-title" >
                            <h5>댓글 등록</h5>
                        </div>
                        <form action="<%= request.getContextPath() %>/reviewInsert.do">
							<input type="hidden" name="gminfoNum" value="<%= gi.getGminfoNum() %>" />
							<input type="hidden" name="refCno" value="0" />
							<input type="hidden" name="comtLevel"  value="1"/>
                            <textarea name="comtCont" placeholder="내용을 입력해주세요."></textarea>
                            <% if(m != null) { %>
                        		<input type="hidden" name="memberId" id="memberId" value="<%= m.getMemberId() %>">
                            	<button type="submit"><i class="fa fa-location-arrow"></i> 등록</button>
                            <% } else { %>
                            	<button type="submit" disabled><i class="fa fa-location-arrow"></i> 등록</button>
                            <% } %>
                        </form>
                    </div>
    			</div> 
    		</div>
    	</div>
    </section>
    
    <%@ include file="/views/common/footer.jsp" %> 
	
	<% if (m != null) { %>
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
			
			$('#cart').on('click', function() {
				$.ajax({
					url : '/StillGaming/insert.cart',
					type : 'post',
					data : { memberId : $('#memberId').val(), 
							 gminfoNum : $('#gminfoNum').val() },
					success : function(data){
						if( data == 1 ) {
							alert('장바구니에 등록되었습니다.');
						} else {
							alert('이미 등록된 게임입니다.');
						}
					}, error : function(){
						console.log('장바구니 담기 에러 발생');
					}
				});
			});
			
		</script>
		
	<% } %>
	
	</body>	
</html>