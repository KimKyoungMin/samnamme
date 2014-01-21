<!DOCTYPE html5>
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
   
</script>

</head>
    <body>
        
	    
	    
	    <!-- HEADER -->
	    <tiles:insertAttribute name="header"></tiles:insertAttribute>

        <!-- content -->
        
	    <tiles:insertAttribute name="content"></tiles:insertAttribute>
	    </div>
	    
        <!-- footer -->
        <tiles:insertAttribute name="footer"></tiles:insertAttribute>

        <!-- </div> --> <!-- end main-container -->
	      

    </body>	

</html>