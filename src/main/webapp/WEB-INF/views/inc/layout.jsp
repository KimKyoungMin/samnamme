<!DOCTYPE html5>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" type="text/css" href="CSS/newCSS.css" />        

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <%
   UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
   if(user==null){
%>
<jsp:forward page="/View/LoginForm.jsp"/>
<%
}
%> --%>

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
        
	    
	    <!-- <div class="main-container"> -->
	    
	    <!-- HEADER -->
	    <tiles:insertAttribute name="header"></tiles:insertAttribute>

        <!-- content -->
	    <tiles:insertAttribute name="content"></tiles:insertAttribute>
	    
        </div> 
	    
        <!-- footer -->
        <tiles:insertAttribute name="footer"></tiles:insertAttribute>

        
	      

    </body>	

</html>