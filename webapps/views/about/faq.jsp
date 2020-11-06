<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ </title>
<style>
body{background:#f4f4f4}
.btn{padding:0;background:transparent;border:0;outline:0}

.accordion_area{ background-color: gray; color: #fff; cursor: pointer; padding: 10px; width: 100%; text-align: left; outline: none; font-size: 20px; transition: all 0.5s; }
.accordion_area .btn_toggle{color:teal;display:block;width:100%;height:50px;padding:0 10px;background:#fff;font-size:20px;text-align:left;line-height:30px;box-sizing:border-box}
.accordion_area .btn_toggle::before{display:inline;content:'Q.'} /* Q 에대해 */
.accordion_area .content_area{  padding: 0 18px; background-color: #fff; height: 100px; overflow: hidden; transition: all 0.5s; display:none;}
.accordion_area .content_area::before{color: black; display:inlnie;content:'A.'  } /* // 눌렀을떄 A  */
.accordion_area .content_area.act{color:black; display:block}/*  //눌렀을떄 글씨색 */
.active, .accordion_area:hover { background-color: teal; } /* //마우스 가져갔을때 */
 .accordion_area::after { content: "\002B"; color: black; font-weight: bold; float: right; margin-left: 5px; font-size: 25px; }
 .active::after { content: "\2212" }
h2{
 background-color: #ffffff;
 opacity: 1;
 color: red;
 padding: 10px;
}
</style>

</head>
<body>
<%@ include file="/views/common/header.jsp" %>
	

	<h2>FAQ</h2>
	


	<div class="accordion_area">
  <button class="btn btn_toggle">Whit is accordion?</button>
  <div class="content_area">
    Accordion is accordion.
  </div>
</div>

<div class="accordion_area">
  <button class="btn btn_toggle">Whit is accordion?</button>
  <div class="content_area">
    Accordion is accordion.
  </div>
</div>

<div class="accordion_area" data-group="one">
  <button class="btn btn_toggle">Whit is accordion?</button>
  <div class="content_area act">
    Accordion is accordion.
  </div>
</div>

<div class="accordion_area" data-group="one">
  <button class="btn btn_toggle">Whit is accordion?</button>
  <div class="content_area">
    Accordion is accordion.
  </div>
</div>

<div class="accordion_area" data-group="one">
  <button class="btn btn_toggle">Whit is accordion?</button>
  <div class="content_area">
    Accordion is accordion.
  </div>
</div>
	

<script>
function bindingAccordionEvent(wrap){
	  let areaArr = document.querySelectorAll(wrap);
	  
	  areaArr.forEach(function(area){
	     let hasGroup = area.dataset['group'] !== undefined ? true : false;
	    let btn = area.querySelector('.btn_toggle');
	    
	    btn.addEventListener('click', function(){
	      if(hasGroup === true){
	        let name = area.dataset['group'];
	        let groupArr = document.querySelectorAll(wrap + '[data-group="'+ name +'"]');
	        let thisContent = area.querySelector('.content_area');
	        
	        groupArr.forEach(function(group){
	           let content = group.querySelector('.content_area');
	          content.classList.remove('act');
	        });
	        thisContent.classList.add('act');
	      }else{
	        let content = area.querySelector('.content_area');
	        content.classList.toggle('act');
	      }
	    });
	  });
	}

	bindingAccordionEvent('.accordion_area');



</script>
	
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>