<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!-- <link rel="stylesheet" type="text/css" href="CSS/newCSS.css" />
 -->


<div onclick="location.href='main.htm';" style="cursor: pointer;">
	<header align="center">
		<h1>Music Site</h1>
	</header>
</div>

<div class="block3">
		<s:authentication property="name" var="loginUser"/>
	<h2>
		<div>
		 <audio src="" controls="controls" style="width: 30%"></audio>
		  <s:authorize ifNotGranted="ROLL_USER, ROLL_ADMIN">
			<a href="login.htm">Login</a> 
		  </s:authorize>
		  
		  <s:authentication property="name" var="loginUser"/>
		  <s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
			    <a href="${pageContext.request.contextPath}/j_spring_security_logout">        
					      (${loginUser })로그아웃
			    </a>
	      </s:authorize>
		|| <a href="join.htm">Join</a>
		</div>
			

	</h2>
	
	
	
</div>

<div class="main-container">
<!-- <div class="head-container"> -->
	<header class="block">
		<ul class="header-menu horizontal-list">
			<li><a class="header-menu-tab" href="musicmain.htm"><span
					class="icon fontawesome-star-empty scnd-font-color"></span>Music</a> <a
				class="header-menu-number" href="#4">6</a></li>
			<li><a class="header-menu-tab" href="musicViedo.htm"><span
					class="icon fontawesome-eye-open scnd-font-color"></span>MusicVideo</a>
			</li>
			<li><a class="header-menu-tab" href="concertmain.htm"><span
					class="icon entypo-calendar scnd-font-color"></span>Inform</a></li>
			<li class="navi_set"><a class="header-menu-tab" href="#"><span
					class="icon entypo-paper-plane scnd-font-color"></span>Community</a>
			    <ul class="subnav">
					<li><a href="notice.htm">Notice</a></li>
					<li><a href="community.htm">Community</a></li>
				</ul>
			</li>
			
		    <li>
		        <s:authorize ifAnyGranted="ROLE_USER">
			       <a class="header-menu-tab" href="account.htm"><span class="icon fontawesome-user scnd-font-color"></span>Account</a>
			    </s:authorize>
			    <s:authorize ifAnyGranted="ROLE_ADMIN">
			    <a class="header-menu-tab" href="#"><span class="icon entypo-cog scnd-font-color"></span>Settings</a>
			       <ul class="subnav">
					   <li><a href="ausers.htm">User</a></li>
					   <li><a href="amusicform.htm">Music</a></li>
					   <li><a href="aconcertform.htm">Concert</a></li>
				   </ul>
				</s:authorize>
			</li> 

		</ul>


		<div class="profile-menu">
			<p>
				Me <a href="#26"><span class="entypo-down-open scnd-font-color"></span></a>
			</p>
			<div class="profile-picture small-profile-picture">
				<img width="40px" alt="Anne Hathaway picture"
					src="http://upload.wikimedia.org/wikipedia/commons/e/e1/Anne_Hathaway_Face.jpg">
			</div>
		</div>

	</header>
