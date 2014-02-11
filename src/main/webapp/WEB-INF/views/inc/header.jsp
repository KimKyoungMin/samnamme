<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<head>


 <link rel="stylesheet" type="text/css" href="CSS/newCSS.css" />

</head>  

<body>
<div class="block3" style="margin-top: 180px;">
     
   
</div>

<div class="main-container">
</div>
<!-- <div class="head-container"> -->
   <div class="block">
      <ul class="header-menu horizontal-list">
         <li><a class="header-menu-tab" href="musicmain.user"><span
               class="icon fontawesome-star-empty scnd-font-color"></span>Music</a></li>
         <li><a class="header-menu-tab" href="musicViedo2.user"><span
               class="icon fontawesome-eye-open scnd-font-color"></span>MusicVideo</a>
         </li>
         <li ><a class="header-menu-tab" href="concertmain.user"><span
               class="icon entypo-calendar scnd-font-color"></span>Inform</a></li>
         
         <li>
         	<a class="header-menu-tab" href="notice.user"><span
               class="icon entypo-paper-plane scnd-font-color"></span>Community</a>
             <ul class="subnav">
               <li><a href="notice.user">Notice</a></li>
               <li><a href="community.user">Community</a></li>
               <li><a href="qna.user">Q&A</a></li>
              </ul>
         </li>
         
          <li>
              <s:authorize ifNotGranted="ROLE_ADMIN">
                <s:authentication property="name" var="loginUser"/>
                <a class="header-menu-tab" href="account.user?userid=${loginUser }&page=1"><span class="icon fontawesome-user scnd-font-color"></span>Account</a>
             </s:authorize>
             <s:authorize ifAnyGranted="ROLE_ADMIN">
             <a class="header-menu-tab" href="ausers.admin"><span class="icon entypo-cog scnd-font-color"></span>Settings</a>
                <!-- <div style="border: 1px; solid"> -->
                <ul class="subnav">
                  
                  <li><a href="ausers.admin">User</a></li>
                  <li><a href="amusicform.admin">Music</a></li>
                  <li><a href="aconcertform.admin">Concert</a></li>
                  
               </ul>
              <!--  </div> -->
            </s:authorize>
         </li> 

         <li>
            <s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                <a class="header-menu-tab" href=javascript:openNewWindow("mylist.user")>
                <span class="icon entypo-music scnd-font-color"></span>PlayList</a>
            </s:authorize>              
         </li>
      </ul>

				
     

       <div id="banner">   
      </div> 
   </div>
   
   
   
   </body>
   
   