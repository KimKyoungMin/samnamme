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
      </div> 
   </div>
   
   
   
   
   
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">
			
			function DropDown(el) {
				this.dd = el;
				this.placeholder = this.dd.children('span');
				this.opts = this.dd.find('ul.dropdown > li');
				this.val = '';
				this.index = -1;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						return false;
					});

					obj.opts.on('click',function(){
						var opt = $(this);
						obj.val = opt.text();
						obj.index = opt.index();
						obj.placeholder.text(obj.val);
					});
				},
				getValue : function() {
					return this.val;
				},
				getIndex : function() {
					return this.index;
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					$('.wrapper-dropdown-3').removeClass('active');
				});

			});

		</script>
   
   
   </body>
   
   