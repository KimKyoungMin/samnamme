

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
	videopagecall();
 });

function videopagecall(){
		$.ajax({
			type :"get",
			url : "pagechangeof.user",
			data : ({

			}), 
			dataType : "json",
			
			success : function(data) {
			
				htmlSrc2 = "";
				
				var per_page = 6; //보여줄 목록 갯수
				var no_pages = Math.ceil(data.length / per_page); // 페이지 총 갯수
				
				 for (var i = 0; i < data.length; i++) {
					 
					 /* htmlSrc2 += "<a href='musicViedo.user?Minfonum="+data[i].minfonum+"&page="+pagenum+"'>"+data[i].mtitle+"</a>"; */
					
					/* data[0].minfonum 노래 번호*/
					htmlSrc2 +="<a href='musicViedo.user?Minfonum="+data[i].minfonum+"'>";
					
					htmlSrc2 +=data[i].mtitle;   
					htmlSrc2 +="-"+ data[i].msname+"<br>";   
					htmlSrc2 +="</a><br>";
					}
				 	
	
					
					 for ( var i = 0; i < no_pages; i++) {
							htmlSrc2 += "<a class='current'>"+i+"</a>";
						}
				 
				 
				$('#ajax').html(htmlSrc2);
				
			},
			error : function(data) {
				alert("Error 발생");
			}
		});
	};
</script>


	<div class="profileV blockV" id="ajax">
	
	</div>
	
	
