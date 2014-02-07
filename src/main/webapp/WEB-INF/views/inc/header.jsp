<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<div onclick="location.href='main.htm';" style="cursor: pointer;" class="header01">
   <header align="center">
      <h1>Music Site</h1>
   </header>
</div>

<div class="block3">
      <s:authentication property="name" var="loginUser"/>
   <h2>
      
        <s:authorize ifNotGranted="ROLE_USER, ROLE_ADMIN">
         <a href="login.htm">Login</a> || <a href="join.htm">Join</a>
        </s:authorize>
        
        <s:authentication property="name" var="loginUser"/>
        <s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
             <a href="${pageContext.request.contextPath}/j_spring_security_logout">        
                       Logout
             </a>
         </s:authorize>
   </h2>
   
   
   
</div>

<div class="main-container">
<!-- <div class="head-container"> -->
   <header class="block">
      <ul class="header-menu horizontal-list">
         <li><a class="header-menu-tab" href="musicmain.user"><span
               class="icon fontawesome-star-empty scnd-font-color"></span>Music</a></li>
         <li><a class="header-menu-tab" href="musicViedo2.user"><span
               class="icon fontawesome-eye-open scnd-font-color"></span>MusicVideo</a>
         </li>
         <li><a class="header-menu-tab" href="concertmain.user"><span
               class="icon entypo-calendar scnd-font-color"></span>Inform</a></li>
         <li class="navi_set"><a class="header-menu-tab" href="#"><span
               class="icon entypo-paper-plane scnd-font-color"></span>Community</a>
             <ul class="subnav">
               <li><a href="notice.user">Notice</a></li>
               <li><a href="community.user">Community</a></li>
               <li><a href="qna.user">Q&A</a></li>
            </ul>
         </li>
         
          <li>
              <s:authorize ifAnyGranted="ROLE_USER">
                <a class="header-menu-tab" href="account.user?userid=${loginUser }"><span class="icon fontawesome-user scnd-font-color"></span>Account</a>
             </s:authorize>
             <s:authorize ifAnyGranted="ROLE_ADMIN">
             <a class="header-menu-tab" href="#"><span class="icon entypo-cog scnd-font-color"></span>Settings</a>
                <ul class="subnav">
                  <li><a href="ausers.admin">User</a></li>
                  <li><a href="amusicform.admin">Music</a></li>
                  <li><a href="aconcertform.admin">Concert</a></li>
               </ul>
            </s:authorize>
         </li> 

      </ul>

      <div class="profile-menu">
         <p>
            ${loginUser } 
            <s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                <a href=javascript:openNewWindow("mylist.user") style="color:white"><span class="entypo-down-open scnd-font-color"></span></a>
                          
            </s:authorize>              
          </p>
      </div>

       <div id="banner">   
          <!-- <audio  id="au" src="" controls="controls" style="width: 30%;" autoplay="true"></audio>
          <input type="text" id="mfilename" class="text4-input" placeholder="노래 리스트가 없습니다.." readonly> -->
      </div> 
   </header>
   
   