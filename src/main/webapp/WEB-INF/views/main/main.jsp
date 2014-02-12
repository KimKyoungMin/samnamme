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
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
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
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

$(function () {
	var amount1 = new Array();

	<c:forEach items="${productList}" var="name">
    var amount2 = new Array();
    amount2.push("${name.mtitle}");
    amount2.push("${name.count}");
    amount1.push(amount2);
    </c:forEach>
    
    $('#container1234').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: ''
        },
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '',
            data: [
                ['${musictitle1}',    ${musiccount1}],
                ['${musictitle2}',    ${musiccount2}],
                ['${musictitle3}',    ${musiccount3}],
                ['${musictitle4}',    ${musiccount4}],
                ['${musictitle5}',    ${musiccount5}]
            ]
        }]
    });
});
</script>

<body>
<div class="main-container">
            <!-- LEFT-CONTAINER -->
            <div class="left-container container">
                <div class="menu-box blockMain"> <!--  Top5 (LEFT-CONTAINER) -->
                    <h2 class="titular">Music Top5</h2>
                    <ul class="menu-box-menu">
                        <c:forEach var="m" items="${musicList}">
                        <li>
                            <a class="menu-box-tab" href="musicmain.user">${m.getMtitle()} / ${m.getMsname()}</a>                            
                        </li>
                        </c:forEach> 
                                             
                    </ul>
                </div>
                                
			    <div class="join-newsletter block"> <!--  (LEFT-CONTAINER) -->
					<h2 class="titular">CONCERT INFOMATION.</h2>
					<P>CONTENT</P>
				</div>
            
           </div>

           <div class="slide" >
              <section  id="jms-slideshow" class="jms-slideshow">
			<c:forEach var="f" items="${concertlist}" varStatus="imp">
				<c:if test="${imp.index==0 }">
					<div class="step" data-color="color-5">
					<div class="jms-content">
						<h3>${f.contitle }</h3>
						<p>${f.conectinfo }</p>
						<p class="jms-link" >${f.consinger }</p>
					</div>
					<img src="concertpic/${f.conpic }" />
				</div>
				</c:if>
				
				<c:if test="${imp.index==1 }">
					<div class="step" data-color="color-4" data-y="500" data-scale="0.4" data-rotate-x="30">
					<div class="jms-content">
						<h3>${f.contitle }</h3>
						<p>${f.conectinfo }</p>
						<p class="jms-link" >${f.consinger }</p>
					</div>
					<img src="concertpic/${f.conpic }" />
				</div>
				</c:if>
				<c:if test="${imp.index==2 }">
					<div class="step" data-color="color-3" data-x="2000" data-z="3000" data-rotate="170">
					<div class="jms-content">
						<h3>${f.contitle }</h3>
						<p>${f.conectinfo }</p>
						<p class="jms-link" >${f.consinger }</p>
					</div>
					<img src="concertpic/${f.conpic }" />
				</div>
				</c:if>
			</c:forEach>
			
				
				
				
				
				
				
				
			</section>
           </div>
           
 
           <div class="noticemain">
              <h2>음악 차트 순위</h2>
              <div id="container1234" style="min-width: 640px; height: 360px; margin: 0 auto"></div>
           </div>

</div>

    	<script type="text/javascript">
			$(function() {
				$( '#jms-slideshow' ).jmslideshow();
				
			});
		</script>
</body>

</html>

