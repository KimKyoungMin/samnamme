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

</head>
    <body>
        
	    
	    <!-- <div class="main-container"> -->
	    
	    <!-- HEADER -->
	    <tiles:insertAttribute name="header"></tiles:insertAttribute>

        <!-- navi -->
        <tiles:insertAttribute name="navi"></tiles:insertAttribute>
        
        <!-- content -->
	    <tiles:insertAttribute name="content"></tiles:insertAttribute>
	    
        </div> 
	    
        <!-- footer -->
        <tiles:insertAttribute name="footer"></tiles:insertAttribute>

        
	      

    </body>	

</html>