<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
  <head>
        <link rel="stylesheet" type="text/css" href="CSS/newCSS.css" />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="CSS/js/jmpress.min.js"></script>
		<script type="text/javascript" src="CSS/js/jquery.jmslideshow.js"></script>
		
		<noscript>
			<style>
			.step {
				width: 100%;
				position: relative;
			}
			.step:not(.active) {
				opacity: 1;
				filter: alpha(opacity=99);
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(opacity=99)";
			}
			.step:not(.active) a.jms-link{
				opacity: 1;
				margin-top: 40px;
			}
			</style>
		</noscript>
    </head>


<body>
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
              <section id="jms-slideshow" class="jms-slideshow">
			
			
				<div class="step" data-color="color-4">
					<div class="jms-content">
						<h3>Just when I thought...</h3>
						<p>From fairest creatures we desire increase, that thereby beauty's rose might never die</p>
						<a class="jms-link" href="#">Read more</a>
					</div>
					<img src="images/1.png" />
				</div>
				
				
				<div class="step" data-color="color-5" data-y="500" data-scale="0.4" data-rotate-x="30">
					<div class="jms-content">
						<h3>Holy cannoli!</h3>
						<p>But as the riper should by time decease, his tender heir might bear his memory</p>
						<a class="jms-link" href="#">Read more</a>
					</div>
					<img src="images/2.png" />
				</div>
				
				
				<div class="step" data-color="color-3" data-x="2000" data-z="3000" data-rotate="170">
					<div class="jms-content">
						<h3>No time to waste</h3>
						<p>Within thine own bud buriest thy content and, tender churl, makest waste in niggarding</p>
						<a class="jms-link" href="#">Read more</a>
					</div>
					<img src="images/3.png" />
				</div>
				
			</section>
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

    	<script type="text/javascript">
			$(function() {
			
				$( '#jms-slideshow' ).jmslideshow();
				
			});
		</script>
</body>

</html>

