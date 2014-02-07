<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

   <h2>Music List</h2>

   <form action="myplayerlist.htm" method="post" name="form1">
   <div align="right">
	   <h3>
	   <input type="submit" class="listadd button3" value="MyPlayerList에 추가하기"> 
	   
	   <s:authorize ifAnyGranted="ROLE_ADMIN">
	  	 <input type="button" class="delete button2" value="Delete" onclick="javascript:submit_delete()">
	   </s:authorize>
	      || 전체 선택 <input type="checkbox" name="checkall" onclick="javascript:CheckAll()">
	   </h3>
	   <br>
   </div>
   <div>
   <c:forEach var="m" items="${musicList}">
   <div class="profileM blockK">  <!-- 음악 리스트  (RIGHT-CONTAINER) -->
			
			   <ul>
			     <s:authorize ifAnyGranted="ROLE_ADMIN">
  			        <li align="left"><a href="amusicEdit.admin?minfonum=${m.getMinfonum()}">수정</a></li> 
			     </s:authorize>
			     <li align="right"><input type="checkbox" id="check[]" name="check[]" value=${m.getMinfonum() }></li>
		   	
			   <div class="music" align="center">
			     <img src="upload/${m.getMpicname()}" width="250px" height="200px">
			   </div>
			   <div class="music">
			      <table>
			         <tr>
			            <td><b>노래</b></td>
			            <td>${m.getMtitle()}</td>
			         </tr>
			         <tr>
			            <td><b>가수</b></td>
			            <td>${m.getMsname()}</td>
			         </tr>
			         <tr>
			            <td><b>장르</b></td>
			            <td>${m.getMgrade()}</td>
			         </tr>
			         <tr rowspan="2">
			            <td><b>Down</b></td>
			            <td><a href="download.htm?p=upload&f=${m.getMfilename()}&minfonum=${m.getMinfonum()}">${m.getMfilename()}</a></td>
			         </tr>
			      </table>
			      <br>
			      ${m.getMetcinfo()}
			   </div>
			   	
			   	</ul>
	

   </div>  
   </c:forEach>
   </div>
  </form>

            