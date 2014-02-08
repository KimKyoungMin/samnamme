<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div class="main-container">
            <!-- LEFT-CONTAINER -->
            <div class="left-container container">
                <div class="menu-box block"> <!--  Top5 (LEFT-CONTAINER) -->
                    <h2 class="titular">Music Top5</h2>
                    <ul class="menu-box-menu">
                        <c:forEach var="m" items="${musicList}">
                        <li>
                            <a class="menu-box-tab" href="#6">${m.getMtitle()} / ${m.getMsname()}</a>                            
                        </li>
                        </c:forEach> 
                                             
                    </ul>
                </div>
                                
			    <div class="join-newsletter block"> <!--  (LEFT-CONTAINER) -->
					<h2 class="titular">CONCERT INFOMATION.</h2>
					<P>CONTENT</P>
				</div>
            
           </div>

           <div class="slide">
              <h2 class="titular">광고</h2>
              
           </div>
           
           <div align="center">
           <div class="noticemain">
              <h2>Notice</h2>
           </div>
           
           <div class="noticemain">
              <h2>Community</h2>
           </div>
			</div>
</div>


