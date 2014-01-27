<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

   <h2>Music List.</h2>
   
   <c:forEach var="m" items="${musicList}">
   <div class="profileM blockM">  <!-- 음악 리스트  (RIGHT-CONTAINER) -->
			
			   <ul>
			     <li align="right"><input type="checkbox" value="1"></li>
			   
			   	
			   <div class="music">
			     <img src="upload/${m.getMpicname()}" width="130px" height="150px">
			   </div>
			   <div class="music">
			      ${m.getMtitle()}
			      ${m.getMsname()}
			      ${m.getMgrade()}
			   </div>
			   
			   	<li>${m.getMetcinfo()}</li>
			   	
			   	</ul>
	

   </div>  
   </c:forEach>
   
            