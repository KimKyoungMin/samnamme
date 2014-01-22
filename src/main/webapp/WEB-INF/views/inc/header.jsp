<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 





<div onclick="location.href='main.htm';" style="cursor: pointer;">
	<header align="center">
		<h1>Music Site</h1>
	</header>
</div>

<div class="block3">
	<h2>
		<audio src="" controls="controls" style="width: 30%"></audio>
		<a href="login.htm">Login</a> || <a href="join.htm">Join</a>
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
			<!-- <li class="navi_set">
			    <a class="header-menu-tab" href="account.htm"><span class="icon fontawesome-user scnd-font-color"></span>Account</a>
			</li> --> 
			<li>
			    <a class="header-menu-tab" href="#"><span class="icon entypo-cog scnd-font-color"></span>Settings</a>
			    <ul class="subnav">
					<li><a href="ausers.htm">User</a></li>
					<li><a href="amusicform.htm">Music</a></li>
					<li><a href="acform.htm">Concert</a></li>
				</ul>
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
