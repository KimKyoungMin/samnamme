<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

   <h2>Music List</h2>

   <form action="myplayerlist.htm" method="post" name="form1">
   <div align="right">
	   <h2>
	   <input type="submit" value="MyPlayerList에 추가하기"> 
	   
	   <s:authorize ifAnyGranted="ROLE_ADMIN">
	  	 <input type="button" value="Delete" onclick="javascript:submit_delete()">
	   </s:authorize>
	      || 전체 선택 <input type="checkbox" name="checkall" onclick="javascript:CheckAll()">
	   </h2>
	   <br>
   </div>
   <div>
   <c:forEach var="m" items="${musicList}">
   <div class="profileM blockK">  <!-- 음악 리스트  (RIGHT-CONTAINER) -->
			
			   <ul>
			     <li align="right"><input type="checkbox" id="check[]" name="check[]" value=${m.getMinfonum() }></li>
		   	
			   <div class="music" align="center">
			     <img src="upload/${m.getMpicname()}" width="250px" height="200px">
			   </div>
			   <div class="music">
			      노래 : ${m.getMtitle()}<br>
			      가수 : ${m.getMsname()}<br>
			      장르 : ${m.getMgrade()}<br>
			      다운 : <a href="download.htm?p=upload&f=${m.getMfilename()}&minfonum=${m.getMinfonum()}">${m.getMfilename()}</a>
			   </div>
			   
			   	<li>${m.getMetcinfo()}</li>
			   	
			   	</ul>
	

   </div>  
   </c:forEach>
   </div>
  </form>

            