<!DOCTYPE html5>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="CSS/newCSS.css" />
<title>concertDetailLayout</title>
</head>
    <body>
    <table style="width: 480; height: 500">
        <!-- content -->
	    <tiles:insertAttribute name="header"></tiles:insertAttribute>
	    <tr><td colspan="2">
	    <!-- content -->
	    <tiles:insertAttribute name="content"></tiles:insertAttribute>
	    </td></tr>
	    <tr>
	    <!-- footer -->
	    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
	    </tr>
    </body>	
</table>
</html>