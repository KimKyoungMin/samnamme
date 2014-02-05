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
		document.getElementById("murl").value=murl;

	}
</script>


<h2>MusicVideo Player</h2>

<div class="navi">
	<div class="profileV blockV">
		<ul class="music-box-menu">

				
			<c:forEach var="m" items="${videoList}">
				<li>
				<%-- <a class="menu-box-tab" href="javascript:video('${m.getMurl()}');"> --%>
				<a class="menu-box-tab" href='javascript:doopen("${m.getMurl()}");'>
				${m.getMtitle()} 
				${m.getMsname()} 
				
						</a></li>
			</c:forEach>
		</ul>

		<div>
		 
   <div style="clear: both">
  <br>
   <table  class="list_n_menu">
   <tr align=center height=20>
      <td colspan=7 style=font-family:Tahoma;font-size:10pt;>
         <c:choose>
         <c:when test="${page<=1}"><a class="active">이전</a>&nbsp;</c:when>
         <c:otherwise>
         <a href="musicViedo.user?page=${page-1}" class="disabled">이전</a>&nbsp;
         </c:otherwise>
         </c:choose>
        
    <%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				<a class="current"><%=a %></a>
				<%}else{ %>
				<a href="musicViedo.user?page=<%=a %>" class="disabled"><%=a %></a>&nbsp;
				<%} %>
			<%} %> 
          
         <c:choose>
         <c:when test="${page>=maxpage }"><a class="active">다음</a></c:when>
         <c:otherwise>
         <a href="musicViedo.user?page=${page+1}">다음</a>
         </c:otherwise>
         </c:choose>
      </td>
   </tr>
   </table>
   </div>  
   
		
		</div>
	</div>

</div>
