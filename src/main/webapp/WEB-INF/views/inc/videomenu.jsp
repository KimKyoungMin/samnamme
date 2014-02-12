
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%
int startpage = (Integer)request.getAttribute("startpage");
int endpage = (Integer)request.getAttribute("endpage");
int nowpage = (Integer)request.getAttribute("page");
%>
<script type="text/javascript">
$(document).ready(function() {
	videopagecall(1);
 });

function videopagecall(pagenum){
		$.ajax({
			type :"get",
			url : "pagechangeof.user",
			data : ({
				pagenum:pagenum
				
			}), 
			dataType : "json",
			
			success : function(data) {
			
				htmlSrc1 = "";
				htmlSrc2 = "";
				var per_page = 6; //보여줄 목록 갯수
				var no_pages = Math.ceil(data[0].listcount / per_page); // 페이지 총 갯수
				
				htmlSrc1 += "<ul class ='menu-box-menu'>";
				 for (var i = 1; i < data.length; i++) {
					 
					
					/* data[0].minfonum 노래 번호*/
					htmlSrc1 +="<li class='menu-box-tab'><a href='musicViedo.user?Minfonum="+data[i].minfonum+"&pagenum="+pagenum+"'>";
					htmlSrc1 +=data[i].mtitle;   
					htmlSrc1 +="-"+ data[i].msname;   
					htmlSrc1 +="</a></li>";
					}
				
				 htmlSrc1 +="</ul>";
				 for ( var i = 1; i <no_pages+1; i++) {
						
					 if(i==pagenum){
						 htmlSrc2 += "<a class='current'>"+i+"</a>";
					 }
					 else{
						 htmlSrc2 += "<a class='disabled' href='javascript:videopagecall("+i+")'>";
							htmlSrc2 += i;
							htmlSrc2 += "</a>";
					 }
					 	
					}
					
				$('#ajax').html(htmlSrc1);
				
				$('#ajax2').html(htmlSrc2);
				
				
			},
			error : function(data) {
				alert("Error 발생");
				
			}
		});
	};
</script>
	
	  	
		

	<div class="profileV blockV" >
	<div id="ajax" class="menu-box" style="margin-left:5px" ></div>
	<div style="margin-top: 10" class = "list_n_menu" id="ajax2"></div>
	
	</div>
	
	
