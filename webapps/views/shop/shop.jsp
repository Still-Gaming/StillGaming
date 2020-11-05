<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.gameinfo.model.vo.*"%>


<!DOCTYPE html>
<html lang="ko">
<head>

<title>스틸게이밍 상점</title>

	<style>
			/* Style the tab */
			.tab {
				overflow: hidden;
				border: 1px solid #ccc;
				background-color: #FBF8F8;
			}
			
			/* Style the buttons that are used to open the tab content */
			.tab button {
				background-color: inherit;
				float: left;
				border: none;
				outline: none;
				cursor: pointer;
				padding: 14px 16px;
				transition: 0.3s;
			}
			
			/* Change background color of buttons on hover */
			.tab button:hover {
				background-color: #ddd;
			}
			
			/* Create an active/current tablink class */
			.tab button.active {
				background-color: #ccc;
			}
			
			/* Style the tab content */
			.tabcontent {
				display: none;
				padding: 6px 12px;
				border: 1px solid #ccc;
				border-top: none;
			}
			.tabcontent {
  				animation: fadeEffect 1s; /* Fading effect takes 1 second */
  				background-color : #ddd;
			}
			

		/* Go from zero to full opacity */
		@keyframes fadeEffect {
 			 from {opacity: 0;}
 		 to {opacity: 1;}
		}
				* {
		  box-sizing: border-box;
					}
		
		/* Style the search field */
		form.example input[type=text] {
		  padding: 10px;
		  font-size: 20px;
		  border: 1px solid grey;
		  float: right;
		  width: 20%;
		  background: white;
		}
		
		/* Style the submit button */
		form.example button {
		  float: right;
		  width: 20%;
		  padding: 10px;
		  background: #2196F3;
		  color: white;
		  font-size: 17px;
		  border: 1px solid grey;
		  border-left: none; /* Prevent double borders */
		  cursor: pointer;
		}
		
		form.example button:hover {
		  background: #0b7dda;
		}
		
		/* Clear floats */
		form.example::after {
		  content: "";
		  clear: both;
		  display: table;
		}
	</style>
	
    
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	
	
	
	<script>
		function openCity(evt, cityName) {
		  // Declare all variables
		  var i, tabcontent, tablinks;

		  // Get all elements with class="tabcontent" and hide them
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }

		  // Get all elements with class="tablinks" and remove the class "active"
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }

		  // Show the current tab, and add an "active" class to the button that opened the tab
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
	</script>
	
	<%@ include file="../common/footer.jsp" %>
	
	<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
	


</body>
</html>