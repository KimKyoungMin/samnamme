<!DOCTYPE html5>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="CSS/newCSS.css" />
<title>main</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 $(document).ready(function(){  
   
  $(".header-menu-tab").hover(function() {     
   $(this).parent().find(".subnav").slideDown('normal').show(); 
   $(this).parent().hover(function() {  
   }, function(){  
    $(this).parent().find(".subnav").slideUp('fast');   
   });  
  });  
   
 });  
   
 function winopen(connum){
		window.open('concertdetail.user?connum='+connum,'NewWindow2','top=0,left=0,width=550,height=630,resizable=0,scrollbars=no');
	}
//mylist popup 
function openNewWindow(window){
	 open(window, "NewWindow", "top=0, right=0, width=320, height=310, resizable=0, scrollbars=yes");
}
 
</script>
</head>



    <body class="main-container">
        
	    
	    <!-- <div class="main-container"> -->
	    
	    <!-- HEADER -->
	    <tiles:insertAttribute name="header"></tiles:insertAttribute>

        <!-- navi -->
        <tiles:insertAttribute name="navi"></tiles:insertAttribute>
        
        <!-- content -->
	    <tiles:insertAttribute name="content"></tiles:insertAttribute>
	    
	    
        <!-- footer -->
        <tiles:insertAttribute name="footer"></tiles:insertAttribute>

        
	      

    </body>	

</html>