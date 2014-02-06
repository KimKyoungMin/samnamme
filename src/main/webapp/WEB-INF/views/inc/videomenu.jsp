<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int startpage = (Integer)request.getAttribute("startpage");
int endpage = (Integer)request.getAttribute("endpage");
int nowpage = (Integer)request.getAttribute("page");
%>
<script type="text/javascript">
	function video(murl){
		alert(murl);
		document.getElementById("murl").value=murl;

	}
	function videopagecall(pagenum){
		alert(pagenum);
		$.ajax({
			type : "post",
			url : "pagechangeof.user",
			data : ({
				pagenum : pagenum
			}), //data를 갖고
			dataType : "json",
			success : function(data) {
				htmlSrc = "";
				
				/* for (var i = 0; i < data.length; i++) {
					//댓글 출력 부분
					htmlSrc += data[i].username+ ':'+ data[i].ccontent;
					htmlSrc += '<div class="main-container" style="text-align: left">'+ data[i].cdate+ '';
					//조건에 따라 삭제 버튼키 추가
					 if(loginUser == data[i].userid){
						 htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data[i].cnum+","+ data[i].bnum+","+barnum+","+replycountin+","+replycountnum+")'>&nbsp;삭제</a></div><br>";
					}else{
						htmlSrc+='</div><br>';
					}
				} */
				
				$('#div 태그의 클래스명').html(htmlSrc);
			},
			error : function(data) {
				alert("Error 발생");
			}
		});
	};
</script>


<h2>MusicVideo Player</h2>

<div class="navi">
	<div class="profileV blockV">
		<ul class="music-box-menu">



			
			<c:forEach var="m" items="${videoList}">
			
				<li>
				<a href="musicViedo.user?Minfonum=${m.getMinfonum()}&page=${page}">
						${m.getMtitle()} - ${m.getMsname()}
				</a>
				</li>
			</c:forEach>
		</ul>
			
		<div>

			<div style="clear: both">
				<br>
				<table class="list_n_menu">
					<tr align=center height=20>
						<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
							<c:choose>
								<c:when test="${page<=1}">
									<a class="active">◀</a>&nbsp;</c:when>
								<c:otherwise>
									<a href="musicViedo.user?page=${page-1}" class="disabled">
									◀</a>&nbsp;
      							</c:otherwise>
								</c:choose>
								 <%for(int pagenum=startpage;pagenum<=endpage;pagenum++){
									if(pagenum==nowpage){
										%> <a class="current"><%=pagenum %></a> <%
									}else{ %> 
									<a href="javascript:void()" onclick="videopagecall('<%=pagenum %>')"><%=pagenum %></a>
									<%-- <a href="musicViedo.user?page=<%=pagenum %>" class="disabled">
									<%=pagenum %></a>&nbsp; --%>
									
									<%} 
								 } %> 
								 <c:choose>
									<c:when test="${page>=maxpage }">
										<a class="active">▶</a>
									</c:when>
									<c:otherwise>
										<a href="musicViedo.user?page=${page+1}">▶</a>
									</c:otherwise>
								</c:choose>
						</td>
					</tr>
				</table>
			</div>


		</div>
		
	</div>

</div>
