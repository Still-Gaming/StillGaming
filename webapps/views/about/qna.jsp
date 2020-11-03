<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="">
   
    <head>
      
<link rel="stylesheet" type="text/css" href="../../Bootstrap-Admin/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css"></link>
 
    </head>   
    <body>
      <%@ include file="/views/common/header.jsp" %>
 
    
         
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                
                </div>
                 
                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>Q & A 게시판</h4>
                        </div>
                             
                        </div>
                    
                    
                   <div>
                      
                   
                     <div class="table-responsive">
                     <table class="table">
                        <tr>
                            <th>제목</th>
                            <td>${qnaVO.subject } ${qnaVO.rep }</td>
                        </tr>
                         
                        <tr>
                            <th>등록일</th>
                            <td><fmt:formatDate value="${qnaVO.indate }"  type="date" /></td>
                        </tr>
 
                        <tr>
                            <th>내용</th>
                            <td>
                                ${qnaVO.content }
                            </td>
                        </tr>
                         
                        <c:choose>
                            <c:when test="${qnaVO.rep=='1' }">
                            <form action="/MacaronicsServlet?command=admin_qna_repsave" method="post" >
                             <table class="table">
                                <tr>
                                    <th>답변하ㄴ기</th>
                                    <td>
                                        <textarea id="bootstrap-editor" style="width:98%;height:200px;" name="reply" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                 <td></td>
                                 <td> 
                                 <input type="hidden" value="${qnaVO.qseq}" name="qseq">
                                
                                </tr>
                            </table>
                            </form>   
                            </c:when>
                            <c:otherwise>
                     
                            </c:otherwise>                
                        </c:choose>
             
                        <tfoot>
                            <tr>
                                <td colspan="2" class="text-center" style="text-align: center;">
                                    <a href="MacaronicsServlet?command=admin_qna_list"  class="btn btn-primary">제출</a>
                                 </td>
                            </tr>
                        </tfoot>
                     </table>
                     </div>
                   
                   
                      
                   </div>
                     
                    </div>
                </div>
          
            
            </div>
            <hr>
 
<div style="margin-bottom: 150px;">
&nbsp;
</div>
     <!-- FOOTER -->
<nav class="avbar navbar-inverse navbar-fixed-bottom" style="height:50px  ;  background-color:#000  ;">
  <div class="container text-center" style="color:#fff;">
  <p>&nbsp;</p>
   <p ><a href="http://macaronics.net/" style="   color:#fff;">Macaronics.net</a></p>  
    <p>&nbsp;</p><p>&nbsp;</p>
  </div>
</nav>
 
 
        <!--/.fluid-container-->
        <script src="../../Bootstrap-Admin/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
        <script src="../../Bootstrap-Admin/vendors/jquery-1.9.1.min.js"></script>
        <script src="../../Bootstrap-Admin/bootstrap/js/bootstrap.min.js"></script>
        <script src="../../Bootstrap-Admin/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
<script src="../../Bootstrap-Admin/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
  
<script type="text/javascript">
 
 
$(function() {
     
    // Bootstrap
    $('#bootstrap-editor').wysihtml5();
     
});
 
</script>
  

	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>






