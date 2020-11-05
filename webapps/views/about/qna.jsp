<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Q&A</title>
    
    <%@ include file="/views/common/header.jsp" %>
    
    <style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
           
        }
        
        .aa{
         
            
            height : 250px;
            
        }
        
        
    
        #detailBoard{
            text-align :left;
            
        }
        
        #title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :left;
             
        }
    </style>
    
    <script type="text/javascript">
        function changeView(value)
        {
            if(value == 0)    location.href="BoardListAction.bo?page=${pageNum}";
            else if(value == 1){
                location.href='BoardReplyFormAction.bo?num=${board.board_num}&page=${pageNum}';
            }
                
        }
    </script>
</head>
<body>
 
<div id="wrap">
    <br><br>
    <div id="board">
        <table id="detailBoard" width="800" border="3" bordercolor="lightgray" >
        
        
            <tr>
                <td id="title">작성자</td>
                <td>${board.board_id}</td>
            </tr>
            <tr>
                <td id="title">
                    제 목
                </td>
                <td>
                    ${board.board_subject}
                </td>        
            </tr>
            <tr class="aa">
                <td id="title" >
                    내 용
                </td>
                <td>
                    ${board.board_content}
                </td>        
            </tr>
            <tr>
                <td id="title">
                    첨부파일
                </td>
                <td>
                    <a href='FileDownloadAction.bo?file_name=${board.board_file}'>${board.board_file}</a>
                </td>    
            </tr>
    
            <tr align="center" valign="middle">
                <td colspan="5">
              
                    <c:if test="${sessionScope.sessionID == board.board_id}">
                        <input type="button" value="제출" >
                        <input type="button" value="삭제" >
                    </c:if>
                   
            </tr>
        </table>
    </div>
</div>    

<%@ include file="/views/common/footer.jsp" %>
 
</body>
</html>


