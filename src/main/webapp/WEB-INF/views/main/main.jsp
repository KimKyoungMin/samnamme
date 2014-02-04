<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div class="main-container">
            <!-- LEFT-CONTAINER -->
            <div class="left-container container">
                <div class="menu-box block"> <!--  Top5 (LEFT-CONTAINER) -->
                    <h2 class="titular">Music Top5</h2>
                    <ul class="menu-box-menu">
                        <li>
                            <a class="menu-box-tab" href="#6">1st music</a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#8">2st music</a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#10">3st music</a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#12">4st music</a>
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#13">5st music</a>
                        </li>                        
                    </ul>
                </div>
                                
			    <div class="join-newsletter block"> <!--  (LEFT-CONTAINER) -->
					<h2 class="titular">CONCERT INFOMATION.</h2>
					<P>CONTENT</P>
				</div>
            
           </div>

            <!-- MIDDLE-CONTAINER -->
            <div class="middle-container container">       
                <div class="profile block"> <!--  (MIDDLE-CONTAINER) -->
                    <a class="add-button" href="#28"><span class="icon entypo-plus scnd-font-color"></span></a>
                    <div class="profile-picture big-profile-picture clear">
                        <img width="150px" alt="Anne Hathaway picture" src="http://upload.wikimedia.org/wikipedia/commons/e/e1/Anne_Hathaway_Face.jpg" >
                    </div>
                    <h1 class="user-name">Anne Hathaway</h1>
                    <div class="profile-description">
                        <p class="scnd-font-color">Lorem ipsum dolor sit amet consectetuer adipiscing</p>
                    </div>
                </div>
                 
             </div>  
           
            <!-- RIGHT-CONTAINER -->
            <div class="right-container container">
                <div class="weather block clear"> <!-- 공지사항  (RIGHT-CONTAINER) -->
                    <h2 class="titular">Least Notice</h2>
                    <div class="tweet first"> 
                       <p>
	                       notice write.....<br>
	                       samnammeajo^^%
                       </p>        
                    </div>    
                </div>
                
                            
                <div class="tweets block"> <!-- (RIGHT-CONTAINER) -->
                    <h2 class="titular">NewsPeed</h2>
                      <p> board ......1 </p>
                      <hr>
                      <p>   ${mfilename}</p>
                </div>

            </div>


</div>


