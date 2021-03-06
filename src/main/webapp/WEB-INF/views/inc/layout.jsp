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

<title>main</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 $(document).ready(function(){  
  $(".header-menu-tab").hover(function() {     
   $(this).parent().find(".subnav").slideDown('fast').show(); 
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
	 open(window, "NewWindow", "top=0, right=0, width=320, height=500, resizable=0, scrollbars=yes");
 }
 
    //checkbox 전체 선택 & 해제
	var check = false;
	function CheckAll() {
		var chk = document.getElementsByName("check[]");
		if (check == false) {
			check = true;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = true; //모두 체크
			}
		} else {
			check = false;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false; //모두 해제
			}
		}
	}
	
	//음악 삭제 
	function submit_delete(){
		document.form1.action="musicDelete.htm";
		document.form1.submit();
	}

</script>

</head>
	
	
<article>
   <div class="main">
   <div class="row-1"> <a class="logo" href="main.htm">HomeStyle</a>
        
    <div align="right">    
      <s:authentication property="name" var="loginUser"/>
   <h2>
      	<a href="account.user?userid=${loginUser }&page=1" style="color:#FFC341;">${loginUser }&nbsp;&nbsp;</a>
        <s:authorize ifNotGranted="ROLE_USER, ROLE_ADMIN">
         <a style="color: white; padding-top: 5px" href="login.htm">Login</a> <span style="color: white">||</span> <a style="color: white" href="join.htm">Join</a>
        </s:authorize>
        
        <s:authentication property="name" var="loginUser"/>
        <s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
             <a style="color: white" href="${pageContext.request.contextPath}/j_spring_security_logout">        
                       Logout
             </a>
         </s:authorize>
   </h2>
   </div>
   
        </div></div>

  </article>
	
	
    <div class="main-container">
        
	    
	    <!-- <div class="main-container"> -->
	    
	    <!-- HEADER -->
	    <tiles:insertAttribute name="header"></tiles:insertAttribute>

        <!-- content -->
	    <tiles:insertAttribute name="content"></tiles:insertAttribute>
	    
	    
        <!-- footer -->
        <tiles:insertAttribute name="footer"></tiles:insertAttribute>

        
	      

    </div>	

</html>