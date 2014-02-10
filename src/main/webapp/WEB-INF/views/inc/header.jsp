<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

  

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
         <li class="navi_set"><a class="header-menu-tab" href="#"><span
               class="icon entypo-paper-plane scnd-font-color"></span>Community</a>
             <ul class="subnav">
               <li style="background-color:E1EDB9"><a href="notice.user">Notice</a></li>
               <li style="background-color:E1EDB9"><a href="community.user">Community</a></li>
               <li style="background-color:E1EDB9"><a href="qna.user">Q&A</a></li>
            </ul>
         </li>
         
          <li>
              <s:authorize ifNotGranted="ROLE_ADMIN">
              
                <a class="header-menu-tab" href="account.user?userid=${loginUser }&page=1"><span class="icon fontawesome-user scnd-font-color"></span>Account</a>
             </s:authorize>
             <s:authorize ifAnyGranted="ROLE_ADMIN">
             <a class="header-menu-tab" href="#"><span class="icon entypo-cog scnd-font-color"></span>Settings</a>
                <ul class="subnav">
                  <li style="background-color:E1EDB9"><a href="ausers.admin">User</a></li>
                  <li style="background-color:E1EDB9"><a href="amusicform.admin">Music</a></li>
                  <li style="background-color:E1EDB9"><a href="aconcertform.admin">Concert</a></li>
               </ul>
            </s:authorize>
         </li> 
         
         <li>
            ${loginUser } 
            <s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
                <a class="header-menu-tab" href=javascript:openNewWindow("mylist.user")>
                <span class="icon entypo-music scnd-font-color"></span>PlayList</a>
            </s:authorize>              
         </li>
      </ul>

     

       <div id="banner">   
          <!-- <audio  id="au" src="" controls="controls" style="width: 30%;" autoplay="true"></audio>
          <input type="text" id="mfilename" class="text4-input" placeholder="노래 리스트가 없습니다.." readonly> -->
      </div> 
   </div>
   </body>
   
   